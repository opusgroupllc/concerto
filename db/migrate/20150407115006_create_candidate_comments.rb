class CreateCandidateComments < ActiveRecord::Migration
  def change
    create_table :candidate_comments do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :state

      t.timestamps null: false
    end
  end
end
