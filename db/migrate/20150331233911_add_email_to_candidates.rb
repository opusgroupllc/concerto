class AddEmailToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :email, :string
  end
end
