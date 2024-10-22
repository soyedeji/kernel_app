class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
  end

  def search
    @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%")
    render :index
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
