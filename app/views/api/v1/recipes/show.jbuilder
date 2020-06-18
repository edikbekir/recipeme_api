json.id @recipe.id
json.description @recipe.description
json.name @recipe.name
json.image_url @recipe.image
json.likes @recipe.likes
json.user @recipe.user
json.ingredients @recipe.ingredients do |ingredient|
  json.partial! 'api/v1/ingredients/ingredient', ingredient: ingredient
end
json.steps @recipe.steps do |step|
  json.partial! 'api/v1/steps/step', step: step
end
