require 'rails_helper'

RSpec.describe "GeocacheObjects", type: :request do
   let(:geocache_object_1) do
        GeocacheObject.create!(
            name: "Geocache Object Test 1",
            coordinate: "POINT(#{114.2219923} #{22.3129115})",
        )
    end

    it "returns a list of active items in a given geocache" do
        headers = { "ACCEPT" => "application/json" }
        post "/items", :params => { :item => {:name => "Test Active Item", geocache_object_id: geocache_object_1.id, active_at: DateTime.now, inactive_at: DateTime.new(2021, 01, 02)} }, :headers => headers
        post "/items", :params => { :item => {:name => "Test Inactive Item", geocache_object_id: geocache_object_1.id, active_at: DateTime.new(2020, 1, 2), inactive_at: DateTime.new(2020, 2, 22)} }, :headers => headers
        get "/geocache_objects/#{geocache_object_1.id}/items", :headers => headers
        expect(response).to have_http_status(201)
    end
end
