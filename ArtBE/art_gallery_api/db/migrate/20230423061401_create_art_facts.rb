class CreateArtFacts < ActiveRecord::Migration[7.0]
  def change
    create_table :art_facts do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
