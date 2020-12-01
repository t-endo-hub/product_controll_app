class ChargeCanWorksController < ApplicationController
  def create
    @ChargeCanWork = ChargeCanWork.new(charge_can_work_params)
    if @ChargeCanWork.save!
      flash[:notice] = "生産可能アイテムを追加しました"
    else
      flash[:alert] = "生産可能アイテムの追加に失敗しました"
    end
    redirect_back(fallback_location: charge_path(Charge.find(@ChargeCanWork.charge_id)))
  end

  private
  def charge_can_work_params
    params.require(:charge_can_work).permit(:time_required, :item, :charge)
  end
end
