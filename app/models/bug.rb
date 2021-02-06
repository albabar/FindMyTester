# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :tester, counter_cache: true
  belongs_to :device
end
