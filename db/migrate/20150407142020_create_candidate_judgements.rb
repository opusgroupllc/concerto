class CreateCandidateJudgements < ActiveRecord::Migration
  def change
    create_table :candidate_judgements do |t|
      t.references :user, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.string :judgment

      t.timestamps null: false
    end
  end
end
