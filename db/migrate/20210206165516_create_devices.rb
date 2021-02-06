# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :description, index: { unique: true }

      t.timestamps
    end
  end
end
