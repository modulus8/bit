namespace :main do

  desc "テスト"
  task :test => :environment do
    p "Hello"
  end


  desc "BIT-FXボード"
  task :fx_bit_board => :environment do
    require 'rest-client'
    require 'json'

    percent = 0.000001

    p "==================================="
    s_time = Time.now
    p "取得時間: #{s_time.strftime("%m-%d %H:%M:%S")}"
    p "==================================="

    response = RestClient.get('https://api.bitflyer.jp/v1/board?product_code=FX_BTC_JPY')
    #puts JSON.parse(response.body)

    mid_price = JSON.parse(response.body)["mid_price"]
    p "+++++++++++++++++++++++++"
    p "mid_price: #{mid_price}"
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
  end



end
