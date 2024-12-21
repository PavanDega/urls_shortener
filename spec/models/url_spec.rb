require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is valid with a valid original_url' do
    url = Url.new(original_url: 'https://example.com')
    expect(url).to be_valid
  end

  it 'is invalid without an original_url' do
    url = Url.new(original_url: nil)
    expect(url).not_to be_valid
  end
end
