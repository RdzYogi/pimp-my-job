class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.text :description
      t.float :lat
      t.float :long
      t.string :zone
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
