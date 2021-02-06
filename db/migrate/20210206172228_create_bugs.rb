# frozen_string_literal: true

class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.references :tester, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end

    add_column :testers, :bugs_count, :integer, default: 0
  end
end
