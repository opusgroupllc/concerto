class AddBodyToCandidateComments < ActiveRecord::Migration
  def change
    add_column :candidate_comments, :body, :text
  end
end
