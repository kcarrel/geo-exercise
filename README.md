# Geo Exercise API

## How to Run Locally
- Step 1: git clone 
- Step 2: cd into the local repository copy
- Step 3: bundle install
- Step 4: rails s

## Technology Used
- Ruby on Rails 
- RSpec
- PostGIS

## Routes 
* **GET /geocache_objects/${GeocacheObjectId}/items** - get all active items from a given geocache object
* **POST /items** - add a new item
* **PATCH /item/${ItemId}** - update an item's associated geocache object

