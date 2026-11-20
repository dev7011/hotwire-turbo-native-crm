class CreateDeals < ActiveRecord::Migration[7.2]
  def change
    create_table :deals do |t|
      t.references :company, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.string :title
      t.decimal :value
      t.string :stage
      t.date :expected_close_date

      t.timestamps
    end
  end
end
