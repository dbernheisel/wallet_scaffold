class Entity < ActiveRecord::Base
  has_many :accounts
  has_many :movements, through: :accounts

  def accounts_balance
    accounts.reduce(0){ |sum, a| sum += a.total }
  end

  def biggest_debit
    m = movements.min_by { |m| m.amount < 0 }
    return nil if m.nil?
    m.amount > 0 ? (return nil) : (return m)
  end

  def amount_spent_prior_month
    movements.where('? = date(movements.created_at, \'start of month\', \'-1 month\')', (Time.now.month - 1.month).to_s).reduce(0){ |sum, m| sum += m.total }.abs
  end

  def amount_spent_current_month
    movements.where('? = strftime(\'%m\', movements.created_at)', Time.now.month.to_s).reduce(0){ |sum, m| sum += m.amount }.abs
  end

  def movements_count_current_month
    movements.where('? = strftime(\'%m\', movements.created_at)', Time.now.month.to_s).count
  end

  def movements_count_prior_month
    movements.where('? = date(movements.created_at, \'start of month\', \'-1 month\')', (Time.now.month - 1.month).to_s).count
  end

  def biggest_debit_in_current_month
    m = movements.where('amount < 0').where('? = strftime(\'%m\', movements.created_at)', Time.now.month.to_s).min_by { |m| m.amount }
    return nil if m.nil?
    m.amount > 0 ? (return nil) : (return m)
  end

  def biggest_credit
    movements.max_by { |m| m.amount }.abs
  end

  def biggest_debitor
    debits = movements.select { |m| m.amount < 0 }
    debitors = debits.group_by { |m| m.other_party }
    return {name: nil, amount: nil} if debitors.length == 0
    debitor = debitors.max_by {|k,v| v.reduce(0) { |sum,d| sum += d.amount } }
    {
      name: debitor[0],
      amount: debitor[1].reduce(0) { |sum,d| sum += d.amount }.abs
    }
  end
end
