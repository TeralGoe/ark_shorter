# Cm
class Visitor < ApplicationRecord
  belongs_to :shorter
  validates :ip, presence: true
  validates :country, presence: true
end
