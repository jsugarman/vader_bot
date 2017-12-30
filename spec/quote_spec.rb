require './lib/quote'

RSpec.describe Quote do
  subject { described_class }

  it { is_expected.to respond_to :quotes }
  it { is_expected.to respond_to :random }
  it { is_expected.to respond_to :filter }

  describe '.quotes' do
    subject { described_class.quotes }

    it 'returns a hash' do
      is_expected.to be_a Hash
    end

    it 'returns values wrapped in SSML speech tags' do
      subject.each do |category, quotes|
        expect(subject[category].first).to match(/<speak>.*<\/speak>/)
      end
    end

    it 'returns values wrapped in SSML low prosody tags to sound vader\'ish' do
      subject.each do |category, quotes|
        expect(subject[category].first).to match(/<speak><prosody pitch=\"low\">.*<\/prosody><\/speak>/)
      end
    end
  end

  describe '.random' do
    subject { described_class.random }

    it 'returns a quote' do
      is_expected.to be_a String
    end

    it 'returns an SSML wrapped string' do
      is_expected.to match(/<speak>.*<\/speak>/)
    end
  end

  describe '.filter' do
    subject { described_class.filter([:love, :hate]) }

    it 'returns quotes' do
      is_expected.to be_a Hash
    end

    it 'returns only requested keys' do
      is_expected.to include(:love, :hate)
      is_expected.to_not include(:positive, :negative, :other)
    end
  end
end