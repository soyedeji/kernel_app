class BreedsController < ApplicationController
  def index
    if params[:letter]
      # Filter breeds by the first letter
      @breeds = Breed.where("name LIKE ?", "#{params[:letter]}%").page(params[:page]).per(9)
    elsif params[:query]
      # Search breeds by query
      @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(9)
    else
      # Display all breeds
      @breeds = Breed.page(params[:page]).per(9)
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end

  def search
    @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(9)
    render :index
  end
end
