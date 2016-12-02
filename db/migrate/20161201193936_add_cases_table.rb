class AddCasesTable < ActiveRecord::Migration
  def change
    create_table :cases do |t|
    t.integer :user_id
    t.string :brand
    t.string :mockup
    t.string :medium
    end
  end
end
