class RemoveColumnsFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :lat, :float
    remove_column :jobs, :long, :float
    remove_column :jobs, :zone, :string
    add_column :jobs, :latitude, :float
    add_column :jobs, :longitude, :float
    add_column :jobs, :address, :string
  end
end
