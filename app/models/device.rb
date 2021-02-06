# frozen_string_literal: true

class Device < ApplicationRecord
  has_and_belongs_to_many :testers
  has_many :bugs
end
