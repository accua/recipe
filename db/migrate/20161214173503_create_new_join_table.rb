class CreateNewJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:prep_list) do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_amount
    end
  end
end
