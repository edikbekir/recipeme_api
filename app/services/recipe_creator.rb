class RecipeCreator
  def initialize(params={}, user=nil)
    @user = user
    @params = params
  end

  def create
    params = permit_params
    @recipe = Recipe.create!(params)
  end

  private

  def permit_params
    @params.permit!(:name, :description, :user_id)
  end
end
