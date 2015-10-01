class Movement < ActiveRecord::Base
  belongs_to :account
  delegate :entity, :to => :account

  validates :account, presence: true
end
