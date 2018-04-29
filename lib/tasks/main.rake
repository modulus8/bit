namespace :main do

  desc "テスト"
  task :test => :environment do
    p "Hello"
  end

  desc "データ記録cron１分"
  task :record_coin => :environment do
    require 'rest-client'
    require 'json'

    percent = 0.000001

    p "==================================="
    s_time = Time.now
    p "取得時間: #{s_time.strftime("%m-%d %H:%M:%S")}"
    p "==================================="

    response = RestClient.get('https://api.bitflyer.jp/v1/board?product_code=FX_BTC_JPY')

    recent_data = Coin.all.order(created_at: :desc).first

    p "==================================="
    mid_price = JSON.parse(response.body)["mid_price"]
    if mid_price >= recent_data.mid_price
      p  "上昇： #{mid_price - recent_data.mid_price}"
    else
      p "下降: #{recent_data.mid_price - mid_price}"
    end
    p "+++++++++++++++++++++++++"
    p "mid_price: #{mid_price}　前回：#{recent_data.mid_price}"
    p "+++++++++++++++++++++++++"


    sell = JSON.parse(response.body)["bids"]
    sell_count = sell.length
    sell_sum = 0
    sell.each do |s|
      price = s["price"]
      size = s["size"]
      sum = price * size
      sell_sum += sum
    end
    p "+++++++++++++++++++++++++"
    p "売り数: #{sell_count}"
    p "売り総額: #{sell_sum * percent}"


    buy = JSON.parse(response.body)["asks"]
    buy_count = buy.length
    buy_sum = 0
    buy.each do |s|
      price = s["price"]
      size = s["size"]
      sum = price * size
      buy_sum += sum
    end
    p "+++++++++++++++++++++++++"
    p "買い数: #{buy_count}"
    p "買い総額: #{buy_sum  * percent }"

    p "+++++++++++++++++++++++++"
    p "カウント比較: #{sell_count >= buy_count ? "売り #{sell_count - buy_count}" : "買い #{buy_count - sell_count}"}"
    p "金額比較: #{sell_sum >= buy_sum ? "売り #{(sell_sum - buy_sum)  * percent}" : "買い #{(buy_sum - sell_sum)  * percent}"}"


    p "+++++++++++++++++++++++++"
    p "処理時間： #{Time.now - s_time}"
    coin = Coin.new(
        mid_price: mid_price,
        sell_count: sell_count,
        sell_sum: sell_sum,
        buy_count: buy_count,
        buy_sum: buy_sum
    )
    unless coin.save
      p "記録に失敗しました。"
    end
  end







  desc "BIT-FXボード確認用"
  task :fx_bit_board => :environment do
    require 'rest-client'
    require 'json'

    percent = 0.000001

    p "==================================="
    s_time = Time.now
    p "取得時間: #{s_time.strftime("%m-%d %H:%M:%S")}"
    p "==================================="

    response = RestClient.get('https://api.bitflyer.jp/v1/board?product_code=FX_BTC_JPY')

    recent_data = Coin.all.order(created_at: :desc).first
    hour_data = Coin.where("created_at >= ?", Time.now - 1.hours).order(created_at: :asc)

    p "前回から#{(s_time - recent_data.created_at)}秒。 #{recent_data.created_at.strftime("%H:%M:%S")}"

    p "==================================="
    mid_price = JSON.parse(response.body)["mid_price"]
    hour_ago_price = hour_data.first.mid_price
    p  "1時間前との差： #{mid_price - hour_ago_price}"
    p "+++++++++++++++++++++++++"
    p "mid_price: #{mid_price}"
    hour_price = hour_data.map(&:mid_price)
    min_price = hour_price.min
    max_price = hour_price.max
    p "１時間最小値=#{min_price} 比較：#{mid_price - min_price}"
    p "１時間最大値=#{max_price} 比較：#{mid_price - max_price}"
    p "+++++++++++++++++++++++++"

    sell = JSON.parse(response.body)["bids"]
    sell_count = sell.length
    sell_sum = 0
    sell.each do |s|
      price = s["price"]
      size = s["size"]
      sum = price * size
      sell_sum += sum
    end
    p "+++++++++++++++++++++++++"
    p "売り数: #{sell_count} １時間前比較：#{hour_data.first.sell_count - sell_count}"
    p "売り総額: #{sell_sum * percent} １時間前比較：#{(hour_data.first.sell_sum - sell_sum) * percent}"


    buy = JSON.parse(response.body)["asks"]
    buy_count = buy.length
    buy_sum = 0
    buy.each do |s|
      price = s["price"]
      size = s["size"]
      sum = price * size
      buy_sum += sum
    end
    p "+++++++++++++++++++++++++"
    p "買い数: #{buy_count} １時間前比較：#{hour_data.first.buy_count - buy_count}"
    p "買い総額: #{buy_sum  * percent } １時間前比較：#{(hour_data.first.buy_sum - buy_sum) * percent}"

    p "+++++++++++++++++++++++++"
    p "カウント比較: #{sell_count >= buy_count ? "売り #{sell_count - buy_count}" : "買い #{buy_count - sell_count}"}"
    p "金額比較: #{sell_sum >= buy_sum ? "売り #{(sell_sum - buy_sum)  * percent}" : "買い #{(buy_sum - sell_sum)  * percent}"}"


    p "+++++++++++++++++++++++++"
    p "処理時間： #{Time.now - s_time}"
  end



end
