class Fail < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  
  has_many :comments, as: :commentable
  
  belongs_to :user
  
  default_scope -> { order('created_at DESC') }
  validates :headline, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  acts_as_taggable
  
  # Returns fails from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).fails
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end