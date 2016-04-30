class Cat < ActiveRecord::Base

  has_many :winning_votes, foreign_key: :winner_id, class_name: 'Vote'
  has_many :losing_votes, foreign_key: :loser_id, class_name: 'Vote'
  belongs_to :owner, class_name: 'User'

  validates :url, :thumbnail_url, presence: true
  validates :name, presence: { message: "cannot be blank" }
  validates :terms_accepted, inclusion: {in: [true], message: "cannot be unchecked"}

  validate :limit_five_cats

  def update_elo_score(opponent, win)
    k_factor = 32
    actual_score = win ? 1 : 0

    my_score = self.elo_score
    opponent_score = opponent.elo_score
    score_differential = opponent_score - my_score
    expected_score = 1.0 / (1 + 10 **( (1.0 * score_differential) / 400))

    updated_score = my_score + k_factor * (actual_score - expected_score)
    self.elo_score = updated_score.to_i
    self.save!
  end

  private

  def limit_five_cats
    previous_count = self.owner.cats.count
    if previous_count >= 5
      errors[:base] << "Sorry, you cannot submit more than 5 cats!"
    end

  end


end
