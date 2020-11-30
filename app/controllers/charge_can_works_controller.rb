class ChargeCanWorksController < ApplicationController
  def create
    if @ChargeCanWork = ChargeCanWork.create(charge_can_work_params)
      flash[:notice] = "生産可能アイテムを追加しました"
    else
      flash[:alert] = "生産可能アイテムの追加に失敗しました"
    end
    byebug
    redirect_back(fallback_location: charge_path(Charge.find(@ChargeCanWork.charge_id)))
  end

  private
  def charge_can_work_params
    params.require(:charge_can_work).permit(:time_required, :item_id, :charge_id)
  end
end
