class BreedsController < ApplicationController
  # Action for displaying the list of breeds
  def index
    if params[:letter]
      # If a letter is provided in the params, filter breeds by the first letter
      @breeds = Breed.where("name LIKE ?", "#{params[:letter]}%").page(params[:page]).per(9)
    elsif params[:query]
      # If a search query is provided, filter breeds based on the query
      @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(9)
    else
      # If no filter or search is applied, display all breeds with pagination (9 per page)
      @breeds = Breed.page(params[:page]).per(9)
    end
  end

  # Action for displaying the details of a single breed
  def show
    # Find the breed by its ID passed in the params
    @breed = Breed.find(params[:id])
  end

  # Action for searching breeds (via search form)
  def search
    @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(9)
    render :search  # Render the search results in search.html.erb
  end
end
