class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:recipes) do |r|
      r.string :name
    end
    create_table(:ingredients) do |i|
      i.string :name
    end
    create_table(:instructions) do |i|
      i.integer :recipe_id
      i.integer :order_number
      i.string :description
    end
    create_table(:tags) do |t|
      t.string :name
    end
    create_table(:recipes_tags) do |r|
      r.integer :recipe_id
      r.integer :tag_id
    end
    create_table(:recipes_ingredients) do |r|
      r.integer :recipe_id
      r.integer :ingredient_id
    end
  end
end
