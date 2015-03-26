class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.integer :population
      t.string :title
      t.timestamps
    end
  end
end
