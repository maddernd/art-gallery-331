class CreateArtifacts < ActiveRecord::Migration[7.0]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.references :artist, null: false, foreign_key: true
      t.references :aboriginal_symbol, null: false, foreign_key: true
      t.references :art_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
