class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }, uniqueness: true
end
