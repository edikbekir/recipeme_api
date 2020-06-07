class Api::V1::RecognitionsController < ApplicationController
  def index
  end

  def recipes
    begin
      @recognizer = DishRecognizer.new
      recognized_dishes = @recognizer.classify(permitted_params[:url])
      dishes = recognized_dishes["images"][0]["classifiers"][0]["classes"]
      dish = @recognizer.get_max_by_score(dishes)

      @result = RecipeApiService.search(dish["class"])

      render json: { data: @result }
    rescue => e
      render json: { notice: "Wrong url or image does not exist", message: e.message, status: 400 }, status: 400
    end
  end

  private

  def permitted_params
    params.permit(:url, :query, :offset, :limit)
  end
end
