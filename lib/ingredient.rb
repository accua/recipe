class Ingredient < ActiveRecord::Base
  has_many :prep_lists
  has_many :recipes, through: :prep_lists 
end
