require 'rails_helper'

RSpec.describe "Items", type: :request do
    let(:geocache_object_1) do
        GeocacheObject.create!(
            name: "Geocache Object Test 1",
            coordinate: "POINT(#{114.2219923} #{22.3129115})",
        )
    end

     let(:geocache_object_2) do
        GeocacheObject.create!(
            name: "Geocache Object Test 2",
            coordinate: "POINT(#{114.2219923} #{22.3129115})",
        )
    end

    let(:item) do 
        Item.create!(
            name: "Test Update Name",
            geocache_object_id: geocache_object_2.id,
            active_at: DateTime.now,
            inactive_at: DateTime.new(2021,02,9)
        )
    end

    let(:inactive_item) do 
        Item.create!(
            name: "Test Inactive Update Name",
            geocache_object_id: geocache_object_1.id,
            active_at: DateTime.new(2020, 01, 9),
            inactive_at: DateTime.new(2020, 8, 9)
        )
    end

    let(:item_3) do 
        Item.create!(
            name: "Test Item 3",
            geocache_object_id: geocache_object_1.id,
            active_at: DateTime.new(2020, 01, 9),
            inactive_at: DateTime.new(2021, 8, 9)
        )
    end

    let(:item_4) do 
        Item.create!(
            name: "Test Full Geocache Name",
            geocache_object_id: geocache_object_2.id,
            active_at: DateTime.new(2020, 01, 9),
            inactive_at: DateTime.new(2021, 8, 9)
        )
    end

    it "creates an Item" do
        headers = { "ACCEPT" => "application/json" }
        post "/items", :params => { :item => {:name => "Test Create Item", geocache_object_id: geocache_object_1.id, active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 02)} }, :headers => headers
        expect(response).to have_http_status(:created)
    end

    it "moves an active Item to a new geocache" do
        headers = { "ACCEPT" => "application/json" }
        put "/items/#{item.id}", :params => { :item => {geocache_object_id: geocache_object_1.id}}, :headers => headers
        expect { item.reload }.to change(item, :geocache_object_id).to(geocache_object_1.id)
    end

    it "cannot move an inactive Item to a new geocache" do
        headers = { "ACCEPT" => "application/json" }
        put "/items/#{inactive_item.id}", :params => { :item => {geocache_object_id: geocache_object_2.id}}, :headers => headers
        expect { inactive_item.reload }.to_not change(inactive_item, :geocache_object_id)
    end

    it "cannot move an active Item to a Geocache Object containing 3 or more items" do 
        headers = { "ACCEPT" => "application/json" }
        put "/items/#{item.id}", :params => { :item => {geocache_object_id: geocache_object_1.id}}, :headers => headers
        expect { inactive_item.reload }.to_not change(inactive_item, :geocache_object_id)
    end


end
