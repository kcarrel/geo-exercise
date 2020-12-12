class CreateGeocacheObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :geocache_objects do |t|
      t.string :name
      t.st_point :coordinate, geographic: true

      t.timestamps
    end
    add_index :geocache_objects, :coordinate, using: :gist
  end
end
