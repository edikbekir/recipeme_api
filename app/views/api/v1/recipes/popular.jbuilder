json.data @recipes do |recipe|
  json.partial! 'api/v1/recipes/recipe', recipe: recipe
end
