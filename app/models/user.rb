class User < ActiveRecord::Base

  has_many :cats, foreign_key: :owner_id
end
