class CreateProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training_session, null: false, foreign_key: true
      t.text :progress_data

      t.timestamps
    end
  end
end
