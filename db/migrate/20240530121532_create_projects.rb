class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.decimal :min_per_hour_price, precision: 10, scale: 2
      t.decimal :max_per_hour_price, precision: 10, scale: 2
      t.decimal :min_total_price, precision: 10, scale: 2
      t.decimal :max_total_price, precision: 10, scale: 2
      t.text :description
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
