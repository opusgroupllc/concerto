class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :point_of_contact
      t.string :poc_email
      t.string :client
      t.string :location

      t.timestamps null: false
    end
  end
end
