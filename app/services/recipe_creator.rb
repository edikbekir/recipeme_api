class RecipeCreator
  def initialize(params={})
    @params = params
  end

  def create
    @recipe = Recipe.create!(@params)
  end
end
