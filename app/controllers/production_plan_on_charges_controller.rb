class ProductionPlanOnChargesController < ApplicationController
  def index
    @items = Item.all
    # 過去１週間、先２週間の月曜日の日付を取得
    this_day = Date.today
    last_monday = (this_day - (this_day.wday - 1)) - 7
    this_monday = this_day - (this_day.wday - 1)
    next_monday = this_day - (this_day.wday - 1) + 7
    in_2next_monday = this_day - (this_day.wday - 1) + 14

    monday_arreys = [last_monday, this_monday, next_monday, in_2next_monday]
    # フォーマットを変更して配列@mondaysに
    @mondays = []
    monday_arreys.each do |monday|
      @mondays.push(monday.strftime("%Y-%m-%d"))
    end
  end
end
