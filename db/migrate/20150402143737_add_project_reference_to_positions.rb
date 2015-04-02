class AddProjectReferenceToPositions < ActiveRecord::Migration
  def change
    add_reference :positions, :project, index: true, foreign_key: true
  end
end
