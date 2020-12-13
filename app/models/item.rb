class Item < ApplicationRecord
  belongs_to :geocache_object, optional: true

  validates :name, uniqueness: true, length: { maximum: 50}, format: { with: /\A[a-zA-Z0-9 ]+\z/,
    message: "only allows letters, numbers and spaces" }
end
