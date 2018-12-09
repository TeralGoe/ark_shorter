# Cm
class Shorter < ApplicationRecord
  has_many :visitors, dependent: :destroy
  validates :original_url, presence: true
  validates :original_url, format: %r{\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z}ix
end
