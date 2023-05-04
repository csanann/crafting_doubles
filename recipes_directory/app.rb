#file: app.rb

require_relative 'lib/recipe_repository'

repo = RecipeRepository.new
recipes = repo.all

recipes.each do |recipe|
    puts "#{recipe.id}. #{recipe.name} - #{recipe.average_cooking_time} minutes - Rating: #{recipe.rating}/5"
end