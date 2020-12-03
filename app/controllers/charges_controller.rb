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

  def edit
    @charge = Charge.find(params[:id])
    @items = Item.all
    @charge_can_work = ChargeCanWork.new
    @charge_can_works = ChargeCanWork.where(charge_id: params[:id])
  end

  def update
    @charge = Charge.find(params[:id])
    if @charge.update(charge_params)
      flash[:notice] = "担当者名を更新しました"
      redirect_to charges_path
    else
      flash[:alert] = "担当者名の更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @charge = Charge.find(params[:id])
    if @charge.destroy
      flash[:notice] = "担当者を削除しました"
      redirect_to charges_path
    else
      flash[:alert] = "担当者の削除に失敗しました"
      render 'edit'
    end
  end

  private
  
  def charge_params
    params.require(:charge).permit(:charge_name)
  end
end
