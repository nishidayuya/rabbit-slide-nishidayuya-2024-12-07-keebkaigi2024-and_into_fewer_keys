# そして少キーへ...

author
:   西田雄也

date
:   2024-12-07
    KeebWorld Conference 2024
    "狭ピッチ"トーク

allotted-time
:   5m

theme
:   local_theme

start-time
:   2024-12-07

end-time
:   2024-12-07

# 自己紹介

- 西田雄也
- GitHub・X: `@nishidayuya`
- Mastodon: nishidayuya@mastodon.social
- ネットワーク応用通信研究所
- Matz江市在住

# さて

# キーボードと私

- 2017年にyharaさんの呼びかけでキーボード組み立て会に参加
- 市内の公民館で集まって組み立て
    - 雪積もった日もありました
- 私のは2018年に完成

![](images/kouminkan.jpg){:height='350'}

# キーボードと私

- Keyboard: Let's Split
- Switch: Gateron 青 (Clicky 50g) Keycap: DSA無刻印
- Case: 組み立て会に参加していた島根大学学生さん（2017年当時）がカットしてくださいました ありがとうございました

![](images/keyboard.png){:height='350'}

# キーボードと私

- 2018年に完成
- 以来6年間Let's Splitを利用
- あまりいじってません...

![](images/keyboard.png){:height='350'}

# そんな自分ですが

# キーボードを見て

# 気がつきました

# 使ってないキーがあるのでは？

# ということで

# 調べる旅に出ました

# やり方

- 使ってなさそうなキーキャップを外して使う

↓

# やり方

- 使ってなさそうなキーキャップを外して使う

↓

- そのキーを使っていたら　　　　→　違和感で気がつく
- そのキーを使っていなかったら　→　違和感なし

# やり方

- 使ってなさそうなキーキャップを外して使う

↓

- そのキーを使っていたら　　　　→　違和感で気がつく
- そのキーを使っていなかったら　→　違和感なし

↓

- 超ローテクで！！！

# やってみた 1

![](images/keyboard-1.png){:width='1300'}

# やってみた 2

![](images/keyboard-2.png){:width='1300'}

# やってみた 3

![](images/keyboard-3.png){:width='1300'}

# やってみた 4

![](images/keyboard-4.png){:width='1300'}

# やってみた 5

![](images/keyboard-5.png){:width='1300'}

# 順調に減っていきました

![](images/keyboard-5.png){:width='1300'}

# あとはまあ

# だいたい使ってるし

# こんなもんかなあ

# いや待てよ

# エンターもなくて良いのでは

# エンターもなくて良いのでは

- C-mがある
- Emacsも仮想端末もTextbringerも問題なさそう

# エンターもなくて良いのでは

- C-mがあるよね
- Emacsも仮想端末もTextbringerも問題なさそう

![](images/keyboard-6.png){:width='1300'}

# だめだった

# だめだった

- 主にウェブブラウザー周りで困った
- ロケーションバーでURLを確定できない
- DevToolsとかも

# だめだった

- 主にウェブブラウザー周りで困った
- ロケーションバーでURLを確定できない
- DevToolsとかも
- ~~まあキーマップをなんとかすれば...~~

↓

- 私にはエンターは必要でした！

# ということで

# 私のキーボードは

# こうなりました

# こうなりました

![](images/keyboard-completion.png){:height='560'}

# ご静聴ありがとうございました

# ご静聴ありがとうございました

# 余談

# 余談

- Rabbitでスライド切り替え時に音を鳴らしたい

# 余談

- Rabbitでスライド切り替え時に音を鳴らしたい
- 私の調べ方が悪くてよくわからなかった

# 余談

- Rabbitでスライド切り替え時に音を鳴らしたい
- 私の調べ方が悪くてよくわからなかった
- スライドが変わるときのメソッドを置換えればいいや！

```ruby
Rabbit::Renderer::Display::DrawingAreaBase.prepend(
  Module.new do
    def post_move(old_index, index)
      super
      Dj.play_track_for_slide(@canvas.current_index)
    end
```

- Ruby万歳！Rabbit万歳！

# ご静聴ありがとうございました
