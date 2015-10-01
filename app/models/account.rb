class Account < ActiveRecord::Base
  belongs_to :entity
  has_many :movements

  validates :entity, presence: true

  def total
    return 0 if movements.count == 0
    movements.sum(:amount)
  end

  def account_with_entity_name
    "#{entity.name} - #{name}"
  end

end
