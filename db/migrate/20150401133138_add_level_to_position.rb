class AddLevelToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :level, :string
  end
end
