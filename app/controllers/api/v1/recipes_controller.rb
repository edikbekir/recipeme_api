class Api::V1::RecipesController < ApplicationController
  before_action :check_user

  before_action :user, only: [:index]

  def index
    render json: { notice: 'Recipes', data: @recipes }, status: 200
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = RecipeCreator.new(permit_params).create

    render json: { data: @recipe, notice: "Recipe has been created", status: 200 }
  end

  def popular
    @recipes = Recipe.popular

    render json: { data: @recipes, notice: "Popular recipes", status: 200 }
  end

  def autocomplete
    return render json: { data: [], notice: "Please enter a valid search query", status: 400 } if params[:query].blank?

    @recipes = AutocompleteService.search(params[:query], Recipe, "name")

    render json: { data: @recipes, notice: "Recipes", status: 200 }
  end

  private

  def permit_params
    params.permit(:name, :description, :image).merge({ user_id: @current_user.id })
  end

  def recipes
    @recipes = Recipe.by_user(@current_user.id)
  end
end
