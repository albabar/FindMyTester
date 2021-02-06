# frozen_string_literal: true

class TestersController < ApplicationController
  def search
    @testers = Tester.search(*search_params)
  end

  private

  def search_params
    params.values_at(:countries, :devices)
  end
end
