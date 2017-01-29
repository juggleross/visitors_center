class Visitor < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def as_json(options = {})
    # super(options.merge(include: :user))
    super options.merge(:methods => [:user, :category])
  end
end
