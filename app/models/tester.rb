# frozen_string_literal: true

class Tester < ApplicationRecord
  has_and_belongs_to_many :devices
end
