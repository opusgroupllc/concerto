class FixSpellingJudgementCandidateJudgements < ActiveRecord::Migration
  def change
    remove_column :candidate_judgements, :judgment
    add_column :candidate_judgements, :judgement, :string
  end
end
