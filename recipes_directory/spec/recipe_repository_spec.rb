#file: recipe_repository_sepc.rb

require_relative '../lib/recipe_repository'

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
    before(:each) do
        reset_recipes_table
    end

    it 'returns an array of all recipes' do
        repo = RecipeRepository.new
        recipes = repo.all

        expect(recipes.length).to eq(2)
        expect(recipes[0].id).to eq(1)
        expect(recipes[0].name).to eq('Spaghetti Bolognese')
        expect(recipes[0].average_cooking_time).to eq("45")
        expect(recipes[0].rating).to eq(4)
    end

    it 'finds a recipe by id' do
        repo = RecipeRepository.new
        recipe = repo.find(1)

        expect(recipe.id).to eq(1)
        expect(recipe.name).to eq('Spaghetti Bolognese')
        expect(recipe.average_cooking_time).to eq(45)
        expect(recipe.rating).to eq(4)
    end
end