class Character < ActiveRecord::Base
  belongs_to :television_shows

  validates :character, presence: true, uniqueness: { scope: :actor, message: "character already exists" }
  validates :actor, presence: true
end
