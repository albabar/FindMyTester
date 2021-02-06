# frozen_string_literal: true

RSpec.describe Tester, type: :model do
  it { is_expected.to have_and_belong_to_many(:devices) }
  it { is_expected.to have_many(:bugs) }

  let(:iphone_4) { Device.create! description: "iPhone 4" }
  let(:iphone_5) { Device.create! description: "iPhone 5" }
  let(:iphone_6) { Device.create! description: "iPhone 6" }
  let(:tester_1) { Tester.create! first_name: 'A', last_name: 'B', country: 'US' }
  let(:tester_2) { Tester.create! first_name: 'C', last_name: 'D', country: 'US' }
  let(:tester_3) { Tester.create! first_name: 'C', last_name: 'D', country: 'GB' }

  before do
    [iphone_4, iphone_5, iphone_6].each do |device|
      tester_1.devices << device
      tester_2.devices << device
      tester_3.devices << device
    end
  end

  describe '.search' do
    context 'Country="ALL" and Device="iPhone 4"' do
      before do
        4.times { tester_1.bugs.create! device: iphone_4 }
        10.times { tester_2.bugs.create! device: iphone_4 }
      end

      it 'returns sorted results' do
        expect(described_class.search('all', 'iPhone 4').map(&:id)).to eq([tester_2.id, tester_1.id])
      end
    end

    context 'Country="ALL" and Device="iPhone 4" or Device="iPhone 5"' do
      before do
        4.times { tester_1.bugs.create! device: iphone_4 }
        20.times { tester_1.bugs.create! device: iphone_5 }
        10.times { tester_2.bugs.create! device: iphone_4 }
      end

      it 'returns sorted results' do
        expect(described_class.search('all', ['iPhone 4', 'iPhone 5']).map(&:id)).to eq([tester_1.id, tester_2.id])
      end
    end

    context 'Country="US" and Device="ALL"' do
      before do
        4.times { tester_1.bugs.create! device: iphone_6 }
      end

      it 'returns sorted results' do
        expect(described_class.search('US', 'all').map(&:id)).to eq([tester_1.id, tester_2.id])
      end
    end
  end
end
