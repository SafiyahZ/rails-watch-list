class ListsController < ApplicationController
  require 'mini_magick'
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to @list, notice: 'List was added successfully'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
