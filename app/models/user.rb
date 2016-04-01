class User < ActiveRecord::Base

  has_many :cats, foreign_key: :owner_id

  def to_param
    self.username
  end
end
