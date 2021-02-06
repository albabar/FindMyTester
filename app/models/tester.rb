# frozen_string_literal: true

class Tester < ApplicationRecord
  has_and_belongs_to_many :devices
  has_many :bugs

  def self.search(countries: [], devices: [])
    scope = all
    scope = scope.where(country: countries.reject(&:blank?)) if countries.any?(&:present?)
    return scope.order(bugs_count: :desc) if devices.all?(&:blank?)

    scope = scope.joins(bugs: :device).where('devices.description': devices.reject(&:blank?))
    scope.select('testers.*, count(bugs.id) as bugs_count').group(:id).order('count(bugs.device_id) DESC')
  end
end
