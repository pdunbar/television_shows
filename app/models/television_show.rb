class TelevisionShow < ActiveRecord::Base
  has_many :characters, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :network }
  validates :network, presence: true
end
