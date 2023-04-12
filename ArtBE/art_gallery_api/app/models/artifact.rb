class Artifact < ApplicationRecord
  belongs_to :artist
  belongs_to :art_type
end
