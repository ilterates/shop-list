class ListController < ApplicationController
  def index
    @list = List.all
    @new_list = List.new
  end
  def new
    @list = List.new
  end
  def create
    list_params = params.require(:list).permit(:name, :quantity)
    list = List.new(list_params)
    if list.save
      redirect_to lists_path
    else
      render :new
    end
  end
  def edit
    # item_id = params[:id]
    # @item = List.find_by_id(item_id)
    item_id = params[:id]
    @edit_item = List.find_by_id(item_id)
  end
  def update
    item_id = params[:id]

    item = List.find_by_id(item_id)
    item_params = params.require(:item).permit(:name, :quantity)

    item.update_attributes(item_params)

    redirect_to lists_path
  end
  def destroy
    @kill_id = List.find_by_id(params[:id])
    if @kill_id.present?
      @kill_id.destroy
      puts "EXISTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    else
      puts "DOES NOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    end
    redirect_to "/list"
  end
end
