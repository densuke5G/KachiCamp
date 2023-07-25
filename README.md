# 徒歩キャン⛺
![徒歩キャンスクリーンショット](https://user-images.githubusercontent.com/129590446/255857278-58cb57f7-7758-4d93-b2e9-65d0e5d87436.png)
## サイト概要
### サイトテーマ
徒歩でアクセスしやすいキャンプ場の情報を共有するレビューサイト

### テーマを選んだ理由
コロナ禍が広がるとともに空前のキャンプブームが到来し、ソロキャンプが一般的な存在になるなど、
キャンプを楽しむ人々の形態が変化、多様化しつつある。  
その中で、あえて車を使わず自らの足でキャンプ場を訪れる「徒歩キャンプ」というジャンルが存在する。  
キャンプ市場にとって、この楽しみ方は車を持っていない都市生活者の層を取り込むことができるという点で有用性があると思う。  
しかし、キャンプ場へのアクセスは車の利用が前提であることが多く、作成者が徒歩キャンプをする際に場所の選定に苦労した経験がある。  
そこで、徒歩キャンプが可能なキャンプ場だけを案内するWEBサービスを製作しようと思った。  
大手サイトに『なっぷ』などがあるが、徒歩キャンプを題材にしたサービスは存在せず差別化を図れると考えた。  

### ターゲットユーザ
* 車を持っていない都市生活者
* ソロキャンパー
* キャンプ場経営者
* 登山者
* バックパッカー・ヒッチハイカー  

### 主な利用シーン
* 旅の途中・計画時にスマートフォンから閲覧する
* キャンプを終えたあとキャンプ場の情報をサイトに共有する

## URL
**<https://kachicamp.com>**  
* サーバー稼働時間：月～金曜日の9:00~20:00まで  

## テスト用アカウント  
### ユーザー側  
ゲストログイン機能ございます  
ヘッダーの「ゲストログイン」から  

### 管理者側
メールアドレス:admin@test.com  
パスワード:testtest  
管理者用ログインURL: /admin/sign_in  

## 設計書
* [ER図](https://drive.google.com/file/d/1Bmhe6-PhVg3oNny1gnIBZngxMuhSsOlh/view?usp=sharing)  
* [画面遷移図（管理者）](https://drive.google.com/file/d/1RT6waOObv16BDsv_vcqLa9yHhZGCnsGh/view?usp=sharing)  
* [画面遷移図（ユーザー）](https://drive.google.com/file/d/1sA-txtKzx9qzQpAPASTy_YJq3uAmIO7z/view?usp=sharing)  
* [テスト仕様書](https://docs.google.com/spreadsheets/d/1NygF-A4B5r38cdvEPtJSbsPGZ9kDydYO/edit?usp=drive_link&ouid=113708554477807667196&rtpof=true&sd=true)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- レイアウト: Font Awesome, Bootstrap

### 使用したgem

* devise
* pry-rails
* kaminari
* enum-help
* ransack
* geocoder

### 使用API
* Cloud Natural Language API
* Google Maps javascript API

## デプロイ環境
- サーバー：AWS EC2
- データベース: AWS RDS(MySQL)
- DNSサーバー: Route53
- サーバーソフト：Nginx
- フレームワーク：Ruby on Rails
- アプリケーションサーバー：puma

## 力を入れた点
重視したことは、「ユーザーが情報を提供できる」点と「投稿が複数の手段で探せる」点です。  
キャンプ場が徒歩で行けるかどうかの判断は実際の経験によるところが多いと思うので、ユーザーから直接情報を提供してもらえて、管理者の許可で投稿が反映されるようにサイトの構造を考えました。  
また、投稿を検索する手段として、名前やタグ検索の他にマップに投稿一覧を表示し直感的に探せるマップ検索機能を実装しました。  
コーディングはインデントを整え、重複するコードをパーシャル化し見やすくすることをを意識しました。  
レイアウトについては、bootstrapを使用しレスポンシブデザインに注力しました。開発中も常に携帯ビューがどうなっているか確認しながら作業を行いました。  



