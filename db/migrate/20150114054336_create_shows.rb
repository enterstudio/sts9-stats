class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date, index: true
      t.text :description

      t.timestamps
    end
  end
end
