class PValidator < ActiveModel::Validator
  def validate(record)
	puts "starting p_validator"
    unless true #record.employees_count > 0
      record.errors[:employees_count] << 'Count of employees must be positive!'
    end
  end
end