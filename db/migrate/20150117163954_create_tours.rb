class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.references :show, index: true

      t.timestamps
    end
  end
end
