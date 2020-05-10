recipes_path = File.join(File.dirname(__FILE__), "/mocks/recipes.json")
products_path = File.join(File.dirname(__FILE__), "/mocks/products.json")
images_path = Rails.root.join('public', 'assets').to_s

recipes = JSON.parse(File.read(recipes_path))
products = JSON.parse(File.read(products_path))

user = User.last || User.create!(first_name: "aa", last_name: "abbb", password: "eee", email: "eee@g.com")

food_types = [
  {name: "dairy"},
  {name: "vegetables"},
  {name: "bakery"},
  {name: "baking"},
  {name: "fruits"},
  {name: "cereals"},
  {name: "meat"},
  {name: "seafood"},
  {name: "nuts"},
  {name: "drinks"}];

food_types.each do |type|
  file = File.open("#{images_path}/#{type[:name]}.jpg")
  Type.create!(name: type[:name], image: file)
end
Type.create!(name: "other", image: nil)

# products.each do |product_record|
#   Product.create!(
#     rating:product_record['rating'],
#     price: product_record['price'],
#     rating: product_record['rating'],
#     measurement: product_record['measurement'],
#     quantity: product_record['quantity']
#   )
# end

recipes.each do |recipe_record|
  name = recipe_record['name']
  description = recipe_record['description']
  recipe = Recipe.new(name: name, user: user, image: { url: recipe_record['imageURL'] })
  ingredients = recipe_record['ingredients']
  steps = recipe_record['steps']
  ingredients.each do |ingredient_record|
    ingredient_name = ingredient_record['name']
    ingredient_quantity = ingredient_record['quantity']
    type = Type.find_or_create_by(name: ingredient_record['type'])
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
