class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :MachineName
      t.string :APIKey
      t.string :UserID
      t.string :method
      t.integer :method_time
      t.boolean :method_success
      t.datetime :recadd

      t.timestamps
    end
  end
end
