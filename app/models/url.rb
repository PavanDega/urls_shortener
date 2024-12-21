class Url < ApplicationRecord
    validates :original_url, presence: true, format: URI::regexp(%w[http https])
    validates :short_url, uniqueness: true
  
    before_create :generate_short_url
  
    private
  
    def generate_short_url
      self.short_url = SecureRandom.alphanumeric(6) while Url.exists?(short_url: short_url)
    end
  end
  