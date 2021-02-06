# frozen_string_literal: true

RSpec.describe Tester, type: :model do
  it { is_expected.to have_and_belong_to_many(:devices) }
  it { is_expected.to have_many(:bugs) }
end
