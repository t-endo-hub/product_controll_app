class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "アイテムを追加しました"
      redirect_to items_path
    else
      flash[:alert] = "アイテムの追加に失敗しました"
      render new_item_path
    end
  end
   
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "アイテムを更新しました"
      redirect_to items_path
    else
      flash[:alert] = "アイテムの更新に失敗しました"
      render 'edit'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "アイテムを削除しました"
      redirect_to items_path
    else
      flash[:alert] = "アイテムの削除に失敗しました"
      render items_edit_pash(@item)
    end
  end



  private
  def item_params
    params.require(:item).permit(:name)
  end

end
