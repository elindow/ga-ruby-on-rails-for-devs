class PValidator < ActiveModel::Validator
  def validate(record)
	#puts "#{}"
    unless record.employees_count.nil? || record.employees_count > -1 
      record.errors[:employees_count] << 'Count of employees must be positive!'
    end
  end
end