class CreateArtifacts < ActiveRecord::Migration[7.0]
  def change
    create_table :artifacts do |t|
      t.string :title
      t.text :description
      t.references :artist, null: false, foreign_key: true
      t.references :art_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
