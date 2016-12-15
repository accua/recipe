require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  erb(:index)
end

get('/recipes/new') do
  erb(:add_recipe)
end

post("/recipes") do
  @recipe = Recipe.create(name: params["recipe"])
  ingredients = params["ingredient"]
  unit_amounts = params["unit_amount"]
  instructions = params["instruction"]
  tags = params["tag"]
  counter1 = 0
  counter2 = 1
  ingredients.each do |ing|
    new_ing = Ingredient.create(name: ing)
    new_prep = PrepList.create(recipe_id: @recipe.id, ingredient_id: new_ing.id, unit_amount: unit_amounts[counter1].to_i)
    counter1 += 1
  end
  instructions.each do |inst|
    @recipe.instructions.create(recipe_id: @recipe.id, order_number: counter2, description: inst)
    counter2 += 1
  end
  tags.each do |t|
    @recipe.tags.create(name: t)
  end
  if @recipe.save
    redirect("/")
  else
    erb(:add_recipe)
  end
end

get("/recipes/:id") do
  @recipe = Recipe.find(params["id"].to_i)
  erb :recipe
end

patch '/recipes/:id' do
  @recipe = Recipe.find(params["id"].to_i)
  recipe_name = params["recipe"]
  ingredients = params["ingredient"]
  unit_amounts = params["unit_amount"]
  instructions = params["instruction"]
  tags = params["tag"]
  if params["recipe"] == ''
    recipe_name = @recipe.name
  else
    @recipe.update(name: recipe_name)
  end
  if params["ingredient"] == ''
    ingredients = @recipe.ingredients
  else
    counter1 = 0
    ingredients.each do |ing|
      new_ing = Ingredient.create(name: ing)
      new_prep = PrepList.create(recipe_id: @recipe.id, ingredient_id: new_ing.id, unit_amount: unit_amounts[counter1].to_i)
      counter1 += 1
    end
  end
  if instructions = ''
    instruction = @recipe.instructions
  else
    counter2 = 1
    instructions.each do |inst|
      @recipe.instructions.create(recipe_id: @recipe.id, order_number: counter2, description: inst)
      counter2 += 1
    end
  end
  if tags = ''
    tags = @recipe.tags
  else
    tags.each do |t|
      @recipe.tags.create(name: t)
    end
  end
  if @recipe.save
    redirect("/")
  else
    erb(:add_recipe)
  end
end
