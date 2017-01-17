class ListController < ApplicationController
  def index
    @list = List.all
    @new_list = List.new
    puts @list.length
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
end
