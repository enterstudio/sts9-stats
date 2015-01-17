class CreateShowSets < ActiveRecord::Migration
  def change
    create_table :show_sets do |t|
      t.string :type
      t.references :show, index: true
      t.integer :order

      t.timestamps
    end
  end
end
