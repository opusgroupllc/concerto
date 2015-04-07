class AddAasmStateToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :aasm_state, :string
  end
end
