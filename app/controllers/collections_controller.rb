class CollectionsController < ApplicationController

  def show
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collection_path(@collection)
    end
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update_attributes(collection_params)
    redirect_to collection_path(@collection)
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :ordered)
  end
end