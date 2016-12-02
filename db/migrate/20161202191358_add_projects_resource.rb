class AddProjectsResource < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :url
      t.integer :case_id
      t.integer :user_id
    end
  end
end
