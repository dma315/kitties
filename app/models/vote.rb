class Vote < ActiveRecord::Base
  validates :winner_id, presence: true
  validates :loser_id, presence: true

  belongs_to :winner, class_name: 'Cat'
  belongs_to :loser, class_name: 'Cat'
end
