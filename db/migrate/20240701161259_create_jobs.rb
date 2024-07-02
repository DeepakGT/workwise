class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :job_category, null: false, foreign_key: true
      t.decimal :hourly_price, precision: 10, scale: 2
      t.decimal :monthly_salary, precision: 10, scale: 2
      t.string :experience
      t.string :job_type
      t.text :description
      t.references :uploader, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
