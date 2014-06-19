class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :character, presence: true, uniqueness: { scope: :character, message: "character already exists" }
  validates :actor, presence: true
  validates :television_show_id, presence: true
end
