class AddStateToCandidateJudgements < ActiveRecord::Migration
  def change
    add_column :candidate_judgements, :state, :string
  end
end
