class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.text :company
      t.text :url

      t.timestamps
    end
  end
end
