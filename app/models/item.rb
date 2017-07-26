class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :image_path
  has_many :category_items
  has_many :categories, through: :category_items
end