class AddArtFactToArtifacts < ActiveRecord::Migration[7.0]
  def change
    add_reference :artifacts, :art_fact, foreign_key: true
  end
end
