class BreedsController < ApplicationController
  def index
    @breeds = Breed.page(params[:page]).per(9) # Display 9 breeds per page
  end
  def search
    @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%")
    render :index
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
