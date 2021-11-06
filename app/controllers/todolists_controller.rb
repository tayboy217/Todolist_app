class TodolistsController < ApplicationController


  def new
    @list = List.new
  end

  def index
    @list = List.new
    @lists = List.all
  end

  def show
     @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
  if@list.save(list_params)
    redirect_to todolist_path(@list.id), notice: 'Update succeeded'
  else
      @lists = List.all
      render action: :index
  end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

   def update
       @list = List.find(params[:id])
    if @list.update(list_params)
    redirect_to todolists_path(@list), notice: 'Update succeeded'
    else
    render :edit
    end
   end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
