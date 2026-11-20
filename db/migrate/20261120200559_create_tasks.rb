class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :company, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :due_at
      t.boolean :completed

      t.timestamps
    end
  end
end
