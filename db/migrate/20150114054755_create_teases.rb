class CreateTeases < ActiveRecord::Migration
  def change
    create_table :teases do |t|
      t.references :song, index: true
      t.references :show_song, index: true

      t.timestamps
    end
  end
end
