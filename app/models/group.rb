class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, through: :memberships, source: :users
  has_many :memberships

  validates :name, length: {minimum: 5}
  validates :description, length: {minimum: 10}

  def self.show_page
    self.joins(:memberships).select("COUNT('memberships.user_id') as count", "groups.name", "groups.description", "groups.user_id", "groups.id").group("memberships.group_id")
  end
end
