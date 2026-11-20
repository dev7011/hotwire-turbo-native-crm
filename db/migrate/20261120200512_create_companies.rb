class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :industry
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
