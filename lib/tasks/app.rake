namespace :app do
  
  task :create_sample_data => :environment do
    geocache1 = GeocacheObject.create(name: "Hidden Location", coordinate: "POINT(#{114.2219923} #{22.3129115})")
    geocache2 = GeocacheObject.create(name: "Mysterious Location", coordinate: "POINT(#{114.2219923} #{22.3129115})")
    Item.create(name: "Item 1", geocache_object_id: geocache1.id, active_at: DateTime.now, inactive_at: DateTime.new(2021,01,9))
    Item.create(name: "Item 2", geocache_object_id: geocache1.id, active_at: DateTime.now, inactive_at: DateTime.new(2021,01,9))
    Item.create(name: "Item 3", geocache_object_id: geocache1.id, active_at: DateTime.now, inactive_at: DateTime.new(2021,01,9))
    Item.create(name: "Item 4", geocache_object_id: geocache2.id, active_at: DateTime.now, inactive_at: DateTime.new(2021,01,9))
  end

end