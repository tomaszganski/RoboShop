class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0.0 }
  validates :category, presence: true

  # montowanie uploadera, photo przechowuje ściezke pliku
  # ProductPhotoUploader - klasa która obsługuje uploader

  mount_uploader :photo, ProductPhotoUploader

end
