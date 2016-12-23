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

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end