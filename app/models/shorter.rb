# Cm
class Shorter < ApplicationRecord
  has_many :visitors, dependent: :destroy
  validates :original_url, presence: true
  validates :original_url, format: %r{\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z}ix
  before_create :generate_data

  def check_for_duplicates
    Shorter.find_by(purified_url: purifying)
  end

  def purifying
    original_url.downcase.gsub(%r{(https?:\/\/)|(http?:\/\/)|(www\.)}, '')
  end

  def tracking(data)
    country = data.country || 'unknown'
    visitors.create(ip: data.ip, country: country)
  end

  private

    def generate_data
      self.purified_url = purifying
      self.code = SecureRandom.base58(6)
      generate_data if Shorter.exists?(code: code)
    end
end
