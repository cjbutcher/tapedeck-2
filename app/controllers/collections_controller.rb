class CollectionsController < ApplicationController

  def show
    @collection = Collection.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:id])
    reject_request! unless user_signed_in? && (@collection.user == current_user)
  end

  def random
    redirect_to collection_path(Collection.all.sample)
  end

  def create
    authenticate_user!
    @collection = current_user.collections.new
    if @collection.save
      redirect_to edit_collection_path(@collection)
    end
  end

  def update
    @collection = current_user.collections.find(params[:id])
    @collection.update_attributes(collection_params)
    redirect_to collection_path(@collection)
  end

  def reorder
    position = 1
    collection = current_user.collections.find(params[:collection_id])
    albums = collection.albums
    ActiveRecord::Base.transaction do
      params[:album].each do |tape_id|
        t = albums.find(tape_id)
        t.update_attributes(position: position)
        position += 1
      end
    end
    render json: nil, status: :ok
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :ordered)
  end
end