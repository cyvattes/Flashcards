class User < ActiveRecord::Base
  has_many :rounds
  has_and_belongs_to_many :decks
end
