class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_many :prep_lists
  has_many :ingredients, through: :prep_lists
  has_many :instructions
end
