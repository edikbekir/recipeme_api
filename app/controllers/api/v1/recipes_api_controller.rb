class Api::V1::RecipesApiController < ApplicationController
  def ingredients
    begin
      @response = RecipeApiService.ingredients(permitted_params[:recipe_id])
      render json: @response
    rescue => e
      render json: { notice: "Ingredients does not exist", message: e.message, status: 400 }, status: 400
    end
  end

  def instructions
    begin
      @response = RecipeApiService.instructions(permitted_params[:recipe_id])
      render json: @response
    rescue => e
      render json: { notice: "Recipe instructions does not exist", message: e.message, status: 400 }, status: 400
    end
  end

  private

  def permitted_params
    params.permit(:recipe_id)
  end
end
