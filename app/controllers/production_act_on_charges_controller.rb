class ProductionActOnChargesController < ApplicationController
  before_action :add_mondays, only: [:new]
  def new
    @item_acts = ProductionActOnCharge.where(item_id: params[:item_id])
    @can_work_charges = ChargeCanWork.where(item_id: params[:item_id])
    @new_production_act = ProductionActOnCharge.new
  end

  def act_params
    params.permit(:charge_id, :item_id, :num, :start_date_of_week)
  end

  def add_mondays
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
