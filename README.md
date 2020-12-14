# Geo Exercise API

## How to Run Locally
- Step 1: git clone git@github.com:kcarrel/geo-exercise.git
- Step 2: cd into the local repository copy
- Step 3: bundle install
- Step 4: rails s to start server

## How to Run Tests
- Step 1: While in the local repository copy run 'rspec ./spec/models/item_spec.rb' to run the model tests for Item.
- Step 2: While in the local repository copy run 'rspec ./spec/controllers/item_spec.rb' to run the controller tests for Item.

## Technology Used
- Ruby on Rails 
- RSpec
- PostGIS

## Routes 
* **GET /geocache_objects/${GeocacheObjectId}/items** - get all active items from a given geocache object
* **POST /items** - add a new item
* **PATCH /item/${ItemId}** - update an item's associated geocache object

