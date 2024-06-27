class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :feedback_by, null: false, foreign_key: { to_table: :users }
      t.references :feedbackable, polymorphic: true, null: false
      t.integer :rating, default: 2
      t.string :description

      t.timestamps
    end
  end
end
