class CreateActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :activities do |t|
      t.references :company, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true
      t.string :activity_type
      t.string :subject
      t.text :description
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
