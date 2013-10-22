class FailVote < ActiveRecord::Base
  belongs_to :fail
  belongs_to :user

  validates_uniqueness_of :fail_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "is the author of the fail" if fail.user_id == user_id
  end
end