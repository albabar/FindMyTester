# frozen_string_literal: true

class CreateDevicesTesters < ActiveRecord::Migration[6.1]
  def change
    create_table :devices_testers, id: false do |t|
      t.references :tester, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
    end
  end
end
