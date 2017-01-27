class Role < ApplicationRecord
  has_many :users
  def to_s
    user_role
  end
end
