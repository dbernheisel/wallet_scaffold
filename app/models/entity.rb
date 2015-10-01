class Entity < ActiveRecord::Base
  has_many :accounts
  has_many :movements, through: :accounts

  def accounts_balance
    accounts.reduce(0){ |sum, a| sum += a.total }
  end
end
