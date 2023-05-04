#recipe_repository.rb
require 'pg'
require_relative 'recipe'

class RecipeRepository

    def all
        connection = PG.connect(dbname: 'recipes_directory')
        result = connection.exec('SELECT id, name, average_cooking_time, rating FROM recipes;')
        
        result.map do |row|
            recipe = Recipe.new
            recipe.id = row['id'].to_i
            recipe.name = row['name']
            recipe.average_cooking_time = row['average_cooking_time']
            recipe.rating = row['rating'].to_i
            recipe
        end
    end

    def find(id)
        connection = PG.connect(dbname: 'recipes_directory')
        result = connection.exec('SELECT id, name, average_cooking_time, rating FROM recipes WHERE id = $1;', [id])
        row = result.first
        return nil unless row

        recipe = Recipe.new
        recipe.id = row['id'].to_i
        recipe.name = row['name']
        recipe.average_cooking_time = row['average_cooking_time'].to_i
        recipe.rating = row['rating'].to_i
        recipe
    end
end