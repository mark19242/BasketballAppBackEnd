class CreateTrainingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :training_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
