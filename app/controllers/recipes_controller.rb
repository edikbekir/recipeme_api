class RecipesController < ApplicationController
  before_action :check_user

  before_action :user, only: [:index]

  def index
    render json: { notice: 'Recipes', data: @recipes }, status: 200
  end

  def create
    @recipe = RecipeCreator.new(params).create

    render json: { data: @recipe, notice: "Recipe has been created", status: 200 }
  end

  private

  def recipes
    @recipes = Recipe.by_user(@user)
  end
end
