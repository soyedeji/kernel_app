class Breed < ApplicationRecord
  has_many :images, dependent: :destroy

  # Add any validations if applicable
  validates :name, presence: true, uniqueness: true
end
