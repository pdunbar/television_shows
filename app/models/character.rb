class Character < ActiveRecord::Base
  validates :character, presence: true, uniqueness: { scope: :actor }
  validates :actor, presence: true
end
