class ChargeCanWorksController < ApplicationController
  before_action :authenticate_user!
  def create
    @ChargeCanWork = ChargeCanWork.new(charge_can_work_params)
    if @ChargeCanWork.save
      flash[:notice] = "生産可能アイテムを追加しました"
    else
      flash[:alert] = "生産可能アイテムの追加に失敗しました"
    end
    redirect_back(fallback_location: charge_path(Charge.find(@ChargeCanWork.charge_id)))
  end

  def destroy
    @ChargeCanWork = ChargeCanWork.find(params[:id])
    @ChargeCanWork.destroy
    flash[:notice] = "生産可能アイテムを削除しました"
    redirect_back(fallback_location: charge_path(Charge.find(@ChargeCanWork.charge_id)))
  end

  private
  def charge_can_work_params
    params.require(:charge_can_work).permit(:time_required, :item_id, :charge_id)
  end
end
