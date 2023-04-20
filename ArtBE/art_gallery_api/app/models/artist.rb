class Artist < ApplicationRecord
    belongs_to :aboriginal_tribe
    has_many :artifacts
  end
  