class Visitor < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :category_visitors, :dependent => :destroy
  accepts_nested_attributes_for :category_visitors, allow_destroy: true, reject_if: :all_blank

  def as_json(options = {})
    super options.merge(:methods => [:user, :category,:category_visitors])
  end
end
