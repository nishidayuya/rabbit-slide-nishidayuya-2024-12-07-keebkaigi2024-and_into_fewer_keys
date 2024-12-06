require "forwardable"
require "pathname"
require "singleton"

module ForwardableSingleton
  class << self
    def included(klass)
      klass.include(Singleton)
      klass.extend(SingleForwardable)
      def klass.method_added(name)
        def_delegator(:instance, name)
      end
    end
  end
end

class TrackPlayer
  include ForwardableSingleton

  def switch(track_number)
    path = (Pathname(__dir__) / "tracks").glob("#{track_number}_*.{flac,mp3}").first
    return if @playing_path == path
    return if !path.exist?

    stop_if_playing
    play(path)
  end

  def stop_if_playing
    return if !@pid

    begin
      Process.kill(:SIGTERM, @pid)
      Process.detach(@pid) # do not need wait for pid to stop
    rescue Errno::ESRCH
      # process is already done
    end
    @pid = nil
  end

  def play(path)
    command = %W[ffplay -loglevel error -nodisp #{path}]
    @pid = Process.spawn(*command)
    @playing_path = path
    puts("playing: #{@playing_path.basename}")
  end

  at_exit(&method(:stop_if_playing))
end

class Dj
  include ForwardableSingleton

  def initialize
    @requests = {}
  end

  def request(slide_index, track_number)
    @requests[slide_index] = track_number
  end

  def play_track_for_slide(slide_index)
    track_number = @requests[slide_index]
    return if !track_number

    puts("playing: #{slide_index} => #{track_number}")
    TrackPlayer.switch(track_number)
  end
end

Rabbit::Renderer::Display::DrawingAreaBase.prepend(
  Module.new do
    def post_move(old_index, index)
      super

      Dj.play_track_for_slide(@canvas.current_index)
    end

    def post_move_in_slide(old_index, index)
      super

      Dj.play_track_for_slide(@canvas.current_index)
    end
  end
)
