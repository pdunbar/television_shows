class TelevisionShow < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :network }
  validates :network, presence: true
end
