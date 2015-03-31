class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :github_url

      t.timestamps null: false
    end
  end
end
