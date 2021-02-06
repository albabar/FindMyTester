# frozen_string_literal: true

RSpec.describe Bug, type: :model do
  it { is_expected.to belong_to(:tester).counter_cache(true) }
  it { is_expected.to belong_to(:device) }
end
