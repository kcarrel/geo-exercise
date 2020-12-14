require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'creation' do 
    it 'can be created without associated optional geocache object id' do 
      item = Item.create(name: "Test Item", active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 20))
      expect(item).to be_valid
    end

    it 'cannot be created with a name that is not unique' do 
      item_1 = Item.create(name: "Name Test", active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 20))
      item_2 = Item.create(name: "Name Test", active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 20))
      expect(item_2).to_not be_valid
    end

    it 'cannot be created with a name exceeding 50 characters' do 
      item = Item.create(name: "LongNameLongNameLongNameLongNameLongNameLongNameLongName", active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 20))
      expect(item).to_not be_valid
    end

    it 'cannot be created with a name containing special characters' do 
      item = Item.create(name: "Item Name!", active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 20))
      expect(item).to_not be_valid
    end
  
  end

end
