class User < ApplicationRecord
  has_many :user_tokens
end
