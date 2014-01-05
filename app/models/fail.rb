class Fail < ActiveRecord::Base
  belongs_to :user
  has_many :fail_votes
  has_many :comments, as: :commentable

  default_scope -> { order('created_at DESC') }
  validates :headline, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  def self.by_votes
    select('fails.*, coalesce(value, 0) as votes').
    joins('left join fail_votes on fail_id=fails.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || fail_votes.sum(:value)
  end
  
  # Returns fails from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
  def to_param
    "#{id}-#{headline}".parameterize
  end
  
  def self.text_search(query)
    if query.present?
      where("name @@ :q or content @@ :q", q: query)
    else
      scoped
    end
  end
end