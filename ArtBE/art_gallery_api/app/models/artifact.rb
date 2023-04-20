class Artifact < ApplicationRecord
  belongs_to :artist
  belongs_to :aboriginal_symbol
  belongs_to :art_type
end
