class AddColumnsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :deadline, :datetime
  end
end
