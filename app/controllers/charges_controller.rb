class ChargesController < ApplicationController
  def index
    @charges = Charge.all
  end

  def new
    @charge = Charge.new
  end
  
  def create
    @charge = Charge.new(charge_params)
    if @charge.save
      flash[:notice] = "担当者を登録しました"
      redirect_to charges_path
    else
      flash[:alert] = "担当者の登録に失敗しました"
      render 'new'
    end
  end

  private
  def charge_params
    params.require(:charge).permit(:charge_name)
  end
end
