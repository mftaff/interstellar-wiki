class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  before_save { self.private ||= 'false'}
  
  def collaborator_for(user)
    collaborators.find_by(user_id: user.id)
  end
end
