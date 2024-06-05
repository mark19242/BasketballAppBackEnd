class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :training_session
end
