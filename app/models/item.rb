class Item < ApplicationRecord
  belongs_to :geocache_object, optional: true
end
