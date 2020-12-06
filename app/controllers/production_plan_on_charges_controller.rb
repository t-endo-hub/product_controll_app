class ProductionPlanOnChargesController < ApplicationController
  before_action :add_mondays, only: [:index, :new]

  def index
    @items = Item.all
  end

  def new
    @item_plans = ProductionPlanOnCharge.where(item_id: params[:item_id])
    @can_work_charges = ChargeCanWork.where(item_id: params[:item_id])
    @new_production_plan = ProductionPlanOnCharge.new
  end

  def create
    @production_plan = ProductionPlanOnCharge.new(plan_params)
    @production_plan.item_id = params[:item_id]
    if @production_plan.save
      flash[:notice] = "予定を作成しました"
      redirect_to root_path
    else
      flash[:alert] = "予定の作成に失敗しました"
      redirect_back(fallback_location: new_production_plan_on_charge_path(@production_plan.charge_id))
    end
  end

  private

  def plan_params
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
