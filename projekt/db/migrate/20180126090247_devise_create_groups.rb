# frozen_string_literal: true

class DeviseCreateGroups < ActiveRecord::Migration[5.1]
  def self.up
    create_table(:group) do |t|
      t.string :title,              :null => false, :default => ""
      t.integer  :group_id, :default => 0
      t.timestamps
    end
  end
end
