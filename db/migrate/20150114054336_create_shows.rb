class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
