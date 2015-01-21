class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date, index: true
      t.references :venue, index: true
      t.text :description
      t.string :link1320

      t.timestamps
    end
  end
end
