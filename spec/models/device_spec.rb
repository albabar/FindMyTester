# frozen_string_literal: true

RSpec.describe Device, type: :model do
  it { is_expected.to have_and_belong_to_many(:testers) }
  it { is_expected.to have_many(:bugs) }
end
