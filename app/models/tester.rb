# frozen_string_literal: true

class Tester < ApplicationRecord
  has_and_belongs_to_many :devices
  has_many :bugs

  def self.search(country, device)
    scope = all
    scope = scope.where(country: country) unless country == 'all'
    return scope.order(bugs_count: :desc) if device == 'all'

    scope = scope.joins(bugs: :device).where('devices.description': device)
    scope.select('testers.*, count(bugs.id) as bugs_count').group(:id).order('count(bugs.device_id) DESC')
  end
end
