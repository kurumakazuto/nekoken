# サイト名：猫の健康管理（ネコケン）

![nekoken_スクリーンショット](https://github.com/kurumakazuto/nekoken/assets/153343673/b76fc290-2bd3-416f-8862-d34b5a962481)

## サイト概要
### サイトテーマ
猫の健康管理を目的とし、ご飯やトイレの内容などを記録する機能がある。
さらに猫の飼い主同士が病気の情報やケアのコツなどを共有することもできるコミュニティサイト。
### テーマを選んだ理由
世の中の猫と飼い主が幸せになってほしいという思いで作成しました。
私自身実家で猫を飼っていて、最初はとても病気にかかることが多い子でした。病院に連れて行った際、
ご飯やトイレの内容を記録したノートを先生に見せると、より的確な処置をしてくださり安心した思い出があります。
猫飼育の需要が急増している今日、愛猫の健康サポートの手助けをできればと思いこのテーマに決めました。
### ターゲットユーザー
- 猫を飼っていて、日々の体調の記録をしようと考えている人
- 動物病院に行った際、ペットの健康状態をより詳しく伝えたい人
- 猫の病気などについて情報共有がしたい人

### 主な利用シーン
- 毎日の食事やトイレの内容を記録するとき
- 病院でペットの直近の健康状態を詳しく伝えるとき
- 猫のケアなどについて、気軽に情報を集めたいとき

## 設計書

### テーブル定義書
https://docs.google.com/spreadsheets/d/1l7cy51KMgdRd9lbroRf275-cGN23xeyZ/edit?usp=sharing&ouid=104391269188743917773&rtpof=true&sd=true

### ER図
![696a9f8a120a1fd5455a4220fe301941](https://github.com/kurumakazuto/nekoken/assets/153343673/60efa96a-885e-475b-b82e-281324a4c4f2)

### アプリケーション詳細設計書
https://docs.google.com/spreadsheets/d/183al0xkw_p7jwaMWqwMLiFuKpoZsY-V_gvnGwRFxrFs/edit?usp=sharing

## 開発環境
- OS:Linux(CentOS)
- 言語
  * HTML,CSS
  * JavaScript
  * Ruby 3.1.2
  * SQL
- フレームワーク:Ruby on Rails 6.1.7.7
- JSライブラリ:jQuery
- 外部API:Google Vision API(画像認識)
- IDE:Cloud9

### AWS構成図
![AWS構成図](https://github.com/kurumakazuto/nekoken/assets/153343673/64860b30-5a17-4f9f-9d32-aafe3969aa58)



## 機能一覧
- 会員登録、ログイン機能(devise)
- 会員機能
  * プロフィール画像(ActiveStorage)
  * 画像の判別(Google Vision API)
- 投稿機能
  * 投稿画像(ActiveStorage)
  * 画像の判別(Google Vision API)
- ご飯記録機能
- トイレ記録機能
- いいね機能(Ajax)
- コメント機能(Ajax)
- ページネーション機能(kaminari)
- カレンダー機能(simple_calendar)
- あいまい検索機能
- タグ検索機能
- レイアウト(bootstrap)

## テスト
- テスト仕様書

### 使用素材
ロゴ作成
- CANVA(https://www.canva.com/)

フリー素材として以下を使用
- イラストAC(https://www.ac-illust.com/)
- photo AC(https://www.photo-ac.com/)