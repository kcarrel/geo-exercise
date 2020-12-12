class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :geocache_object, null: true, foreign_key: true
      t.datetime :active_at
      t.datetime :inactive_at

      t.timestamps
    end
  end
end
