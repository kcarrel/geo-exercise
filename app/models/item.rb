class Item < ApplicationRecord
  belongs_to :geocache_object, optional: true

  validates :name, uniqueness: true, length: { maximum: 50}, format: { with: /\A[a-zA-Z0-9 ]+\z/,
    message: "only allows letters, numbers and spaces" }

  def active?
    return true if self.active_at < DateTime.now && self.inactive_at > DateTime.now
    false
  end
  
end
