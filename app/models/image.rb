class Image < ApplicationRecord
  belongs_to :breed
  # Ensure an image URL is present and not empty
  validates :url, presence: true

  # Ensure the associated breed exists
  validates :breed_id, presence: true
end
