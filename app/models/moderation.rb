class Moderation < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def as_json(options = {})
    super options.merge(:methods => [:user, :category])
  end
end
