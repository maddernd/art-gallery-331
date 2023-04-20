class AboriginalTribe < ApplicationRecord
    has_many :aboriginal_symbols
    has_many :artists
  end
  