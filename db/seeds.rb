# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin = admin.find_create_by!(email: "admin@example.com") do |admin|
  #admin.password = "password"
#end
puts "seedの実行を開始"

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = ENV['SECRET_KEY']
end

サンプル次郎 = Customer.find_or_create_by!(email: "jirou@example.com") do |customer|
  customer.name = "サンプル次郎"
  customer.cat_name = "次郎"
  customer.cat_gender = "♂"
  customer.introduction = "初めまして。よろしくお願いいたします。"
  customer.password = "password"
  customer.image_check = true
end

サンプル花子 = Customer.find_or_create_by!(email: "hanako@example.com") do |customer|
  customer.name = "サンプル花子"
  customer.cat_name = "花子"
  customer.cat_gender = "♀"
  customer.introduction = "我が家の自慢の愛猫です。"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.jpg"), filename:"sample-customer2.jpg")
  customer.image_check = true
end

サンプルのぞみ = Customer.find_or_create_by!(email: "nozomi@example.com") do |customer|
  customer.name = "サンプルのぞみ"
  customer.cat_name = "のぞみ"
  customer.cat_gender = "♀"
  customer.introduction = "すごい可愛いです！。"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.jpg"), filename:"sample-customer3.jpg")
  customer.image_check = true
end

サンプルたけし = Customer.find_or_create_by!(email: "takeshi@example.com") do |customer|
  customer.name = "サンプルたけし"
  customer.cat_name = "たけし"
  customer.cat_gender = "♂"
  customer.password = "password"
  customer.image_check = true
end

サンプルさやか = Customer.find_or_create_by!(email: "sayaka@example.com") do |customer|
  customer.name = "サンプルさやか"
  customer.cat_name = "さやか"
  customer.cat_gender = "♀"
  customer.introduction = "よろしくお願いします。"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer4.jpg"), filename:"sample-customer4.jpg")
  customer.image_check = true
end

サンプル健二 = Customer.find_or_create_by!(email: "kenji@example.com") do |customer|
  customer.name = "サンプル健二"
  customer.cat_name = "健二"
  customer.cat_gender = "♂"
  customer.introduction = "よろしくお願いいたします!"
  customer.password = "password"
  customer.image_check = true
end

サンプルたくみ = Customer.find_or_create_by!(email: "takumi@example.com") do |customer|
  customer.name = "サンプルたくみ"
  customer.cat_name = "たくみ"
  customer.cat_gender = "♂"
  customer.introduction = "ケアの情報集めてます～"
  customer.password = "password"
  customer.image_check = true
end

サンプルよしこ = Customer.find_or_create_by!(email: "yoshiko@example.com") do |customer|
  customer.name = "サンプルよしこ"
  customer.cat_name = "よしこ"
  customer.cat_gender = "♀"
  customer.introduction = "とても元気な子です(^^♪"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer5.jpg"), filename:"sample-customer5.jpg")
  customer.image_check = true
end

サンプルさだこ = Customer.find_or_create_by!(email: "sadako@example.com") do |customer|
  customer.name = "サンプルさだこ"
  customer.cat_name = "さだこ"
  customer.cat_gender = "♀"
  customer.password = "password"
  customer.image_check = true
end

サンプルかずお = Customer.find_or_create_by!(email: "kazuo@example.com") do |customer|
  customer.name = "サンプルかずお"
  customer.cat_name = "かずお"
  customer.cat_gender = "♂"
  customer.introduction = "色々教えてください！"
  customer.password = "password"
  customer.image_check = true
end

サンプルかずお = Customer.find_or_create_by!(email: "kazuo@example.com") do |customer|
  customer.name = "サンプルかずお"
  customer.cat_name = "かずお"
  customer.cat_gender = "♂"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer6.jpg"), filename:"sample-customer6.jpg")
  customer.image_check = true
end

サンプルつばさ = Customer.find_or_create_by!(email: "tsubasa@example.com") do |customer|
  customer.name = "サンプルつばさ"
  customer.cat_name = "つばさ"
  customer.cat_gender = "♂"
  customer.password = "password"
  customer.image_check = true
end

サンプル太郎 = Customer.find_or_create_by!(email: "tarou@example.com") do |customer|
  customer.name = "サンプル太郎"
  customer.cat_name = "太郎"
  customer.cat_gender = "♂"
  customer.introduction = "こんにちは。よろしくお願いいたします。"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.jpg"), filename:"sample-customer1.jpg")
  customer.image_check = true
end

Topic.find_or_create_by!(title: "今日も可愛い") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic1.jpg"), filename:"sample-topic1.jpg")
  topic.introduction = "寝顔を撮りました！とっても可愛いです！"
  topic.category = "寝顔"
  topic.customer = サンプルたけし
  topic.image_check = true
end

Topic.find_or_create_by!(title: "今日登録しました！") do |topic|
  topic.introduction = "よろしくお願いします！"
  topic.customer = サンプル太郎
  topic.image_check = true
end

Topic.find_or_create_by!(title: "朝起きたら") do |topic|
  topic.introduction = "隣で寝ていました。　とっても可愛いです！"
  topic.category = "可愛い"
  topic.customer = サンプル花子
  topic.image_check = true
end

Topic.find_or_create_by!(title: "手を噛まれる") do |topic|
  topic.introduction = "最近、かまってほしいのか良く手を噛まれます。かなり痛くて、何か対処法はないでしょうか？？"
  topic.category = "手をかまれる"
  topic.customer = サンプルさやか
  topic.image_check = true
end

Topic.find_or_create_by!(title: "とんぼ大好き") do |topic|
  topic.introduction = "たくみはとんぼのおもちゃが大好きで、今日もたくさん遊びました！"
  topic.category = "とんぼのおもちゃ"
  topic.customer = サンプルたくみ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "大きなあくび") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic2.jpg"), filename:"sample-topic2.jpg")
  topic.introduction = "大きなあくびしていて可愛かったです笑"
  topic.category = "大きなあくび"
  topic.customer = サンプルさだこ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "頑張った！") do |topic|
  topic.introduction = "今日動物病院に行きましたが、全然鳴かなかったです！頑張った！"
  topic.category = "頑張った"
  topic.customer = サンプル次郎
  topic.image_check = true
end

Topic.find_or_create_by!(title: "心配だなー") do |topic|
  topic.introduction = "今日あんまりトイレしてなくて心配だ..."
  topic.category = "トイレしてない"
  topic.customer = サンプル健二
  topic.image_check = true
end

Topic.find_or_create_by!(title: "言葉が通じる") do |topic|
  topic.introduction = "料理していたらさやかが近づいてきたので、危ないよーって言ったら離れていきました。言葉が通じているのかな？笑"
  topic.category = "言葉が通じる"
  topic.customer = サンプルさやか
  topic.image_check = true
end

Topic.find_or_create_by!(title: "真顔") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic4.jpg"), filename:"sample-topic4.jpg")
  topic.introduction = "この顔は一体何を考えているのだろうか('_')"
  topic.category = "真顔猫"
  topic.customer = サンプル健二
  topic.image_check = true
end

Topic.find_or_create_by!(title: "ご飯くれ攻撃") do |topic|
  topic.introduction = "毎日朝の5時になるとご飯くれ攻撃をされるので、いつも寝不足です..笑"
  topic.category = "お腹空いてる"
  topic.customer = サンプルのぞみ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "一緒に寝てた") do |topic|
  topic.introduction = "お昼寝をしていて起きたら、隣で花子も寝ていました。いつの間にか一緒にお昼寝してたんだね((´∀｀*))"
  topic.category = "愛おしい"
  topic.customer = サンプル花子
  topic.image_check = true
end

Topic.find_or_create_by!(title: "玄関を開けたら") do |topic|
  topic.introduction = "買い物から帰ってきて玄関を開けたら、かずおが待っていてくれました。可愛いです！"
  topic.category = "忠猫"
  topic.customer = サンプルかずお
  topic.image_check = true
end

Topic.find_or_create_by!(title: "プラスチック噛む") do |topic|
  topic.introduction = "うちの子は良くプラスチックを噛みます。特にビニール袋などを良く噛んでいて、プラスチックを飲み込んでいないか心配です。"
  topic.category = "心配"
  topic.customer = サンプルつばさ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "毛玉は吐かない") do |topic|
  topic.introduction = "よしこが全然毛玉を吐いてくれません。吐くしぐさはするのですが、毎回止まってしまいます...。"
  topic.category = "毛玉"
  topic.customer = サンプルよしこ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "脱走") do |topic|
  topic.introduction = "お庭で洗濯物をしていたら、窓が空いていたせいかさやかが外に出ていました！すぐに気づいたので室内に戻しましたが、すごくヒヤリとしました。"
  topic.category = "ヒヤリハット"
  topic.customer = サンプルさやか
  topic.image_check = true
end

Topic.find_or_create_by!(title: "お外大好き") do |topic|
  topic.introduction = "次郎はお外を見るのが大好きで、よくカーテンの内側に入って見ています。何を考えながら見てるのかな？？笑"
  topic.category = "お腹空いてる"
  topic.customer = サンプル次郎
  topic.image_check = true
end

Topic.find_or_create_by!(title: "良く寝る") do |topic|
  topic.introduction = "うちの子は生後6ヶ月ですが、本当に良く寝ます！隙あらば寝ています笑"
  topic.category = "寝る子は育つ"
  topic.customer = サンプル太郎
  topic.image_check = true
end

Topic.find_or_create_by!(title: "イヤホン噛まれた") do |topic|
  topic.introduction = "音楽を聴こうと思ったとに、イヤホンのコードが千切れていることに気づきました。おそらくたけしが噛んだのでしょう。これからはイヤホンは机にしまうようにします泣"
  topic.category = "なんでも噛む"
  topic.customer = サンプルたけし
  topic.image_check = true
end

Topic.find_or_create_by!(title: "目にゴミが") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic3.jpg"), filename:"sample-topic3.jpg")
  topic.introduction = "先ほど気づいたんですが、かずおの目にゴミが入っていました。これは取ってあげたほうがいいんでしょうか...？？"
  topic.category = "目にゴミ"
  topic.customer = サンプルかずお
  topic.image_check = true
end

Topic.find_or_create_by!(title: "ご飯大好き") do |topic|
  topic.introduction = "たくみはご飯の時間が近づくと、体全体を使ってお腹空いたアピールをしてきます笑　とっても可愛いです！"
  topic.category = "全力アピール"
  topic.customer = サンプルたくみ
  topic.image_check = true
end

Topic.find_or_create_by!(title: "高いところ大好き") do |topic|
  topic.introduction = "今日のぞみが冷蔵庫の上にのぼりました！キャットタワーもあるのに、色々なところに行きたいんだね笑"
  topic.category = "高いところ大好き"
  topic.customer = サンプルのぞみ
  topic.image_check = true
end

puts "seedの実行が完了しました"