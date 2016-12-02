class RemoveProjectUrlFromCases < ActiveRecord::Migration
  def change
    remove_column :cases, :project_url
  end
end
