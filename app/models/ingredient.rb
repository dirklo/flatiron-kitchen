class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :ingredients
    validates :name, presence: true
end
