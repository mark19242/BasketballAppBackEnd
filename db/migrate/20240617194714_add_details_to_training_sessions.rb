class AddDetailsToTrainingSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :training_sessions, :date, :date
    add_column :training_sessions, :time, :string
    add_column :training_sessions, :status, :string
  end
end
