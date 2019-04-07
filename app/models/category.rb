class Category < ApplicationRecord
  #kategoria posiada wiele produktów
  has_many products

  #Uniemożliwia dodanie kategorii o pustej nazwie
  vaildates :name, presence: true

end
