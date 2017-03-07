class Wiki < ActiveRecord::Base
  belongs_to :user
  before_save { self.private ||= 'false'}
end
