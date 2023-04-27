class CreateAboriginalSymbols < ActiveRecord::Migration[7.0]
  def change
    create_table :aboriginal_symbols do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
