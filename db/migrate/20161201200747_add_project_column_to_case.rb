class AddProjectColumnToCase < ActiveRecord::Migration
  def change
    add_column :cases, :project_url, :string
  end
end
