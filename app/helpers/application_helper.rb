# frozen_string_literal: true

module ApplicationHelper
  def countries_list
    # a good place to memoize/cache
    Tester.pluck(:country).uniq
  end

  def devices_list
    # a good place to memoize/cache
    Device.pluck(:description)
  end
end
