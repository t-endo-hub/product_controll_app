class ProductionPlanOnChargesController < ApplicationController
  before_action :add_mondays, only: [:index, :new]

  def index
    @items = Item.all
    @production_plans = ProductionPlanOnCharge.all
    @production_acts = ProductionActOnCharge.all
  end

  def new
    @item_plans = ProductionPlanOnCharge.where(item_id: params[:item_id])
    @can_work_charges = ChargeCanWork.where(item_id: params[:item_id])
    @new_production_plan = ProductionPlanOnCharge.new
  end

  def create
    @production_plan = ProductionPlanOnCharge.new(plan_params)
    @production_plan.item_id = params[:item_id]

    # 予定がすでに存在していないか
    @already_plan = ProductionPlanOnCharge.where(charge_id: params[:charge_id], item_id: params[:item_id], start_date_of_week: params[:start_date_of_week])

    if @already_plan.empty?
      # 予定の新規作成処理
      if @production_plan.save
        flash[:notice] = "予定を作成しました"
        redirect_to root_path
      else
        flash[:alert] = "予定の作成に失敗しました"
        redirect_back(fallback_location: new_production_plan_on_charge_path(@production_plan.charge_id))
      end
    else
      # 予定がすでに存在している場合の処理
      flash[:notice] = "予定は既に登録されています"
      redirect_back(fallback_location: new_production_plan_on_charge_path(@production_plan.charge_id))
    end
  end

  def edit
    @charge = Charge.find(params[:charge_id])
    @item = Item.find(params[:item_id])
    @monday = params[:start_date_of_week]
    @production_plan_on_charge = ProductionPlanOnCharge.find_by(charge_id: @charge, item_id: @item, start_date_of_week: @monday)

    # 予定が存在しない場合はリダイレクト
    if @production_plan_on_charge.nil?
      flash[:notice] = "予定を新規追加してください"
      redirect_back(fallback_location: new_production_plan_on_charge_path(@charge))
    end
  end

  def update
    @production_plan_on_charge = ProductionPlanOnCharge.find_by(charge_id: params[:charge_id], item_id: params[:item_id], start_date_of_week: params[:start_date_of_week])
    if @production_plan_on_charge.update(plan_params)
      flash[:notice] = "予定を変更しました"
      redirect_to root_path
    else
      flash[:alert] = "予定の変更に失敗しました"
      render 'edit'
    end
  end

  private

  def plan_params
    params.require(:production_plan_on_charge).permit(:id,:charge_id, :item_id, :num, :start_date_of_week)
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
        @mondays.push(monday)
      end
  end
end
