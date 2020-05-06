path = File.join(File.dirname(__FILE__), "/mocks/recipes.json")
recipes = JSON.parse(File.read(path))

user = User.last || User.create!(first_name: "aa", last_name: "abbb", password: "eee", email: "eee@g.com")

recipes.each do |recipe_record|
  name = recipe_record['name']
  description = recipe_record['description']
  recipe = Recipe.new(name: name, user: user, image: { url: recipe_record['imageURL'] })
  ingredients = recipe_record['ingredients']
  steps = recipe_record['steps']
  ingredients.each do |ingredient_record|
    ingredient_name = ingredient_record['name']
    ingredient_quantity = ingredient_record['quantity']
    type = Type.new(name: ingredient_record['type'])
    ingredient = Ingredient.new(name: ingredient_name, quantity: ingredient_quantity, type: type)
    recipe.ingredients << ingredient
  end
  steps.each_with_index do |step_record, index|
    index = index + 1
    step = Step.new(name: step_record, number: index)
    recipe.steps << step
  end
  recipe.save!
end
