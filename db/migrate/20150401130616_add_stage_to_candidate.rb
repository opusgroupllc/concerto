class AddStageToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :stage, :string
  end
end
