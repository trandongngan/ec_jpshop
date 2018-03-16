class EmailFormatValidator < ActiveModel::EachValidator
  EMAIL_REGEXP = /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  def validate_each(record, attribute, value)
    unless value =~ EMAIL_REGEXP
      msg = options[:message]
      msg ||= I18n.t(:email_invalid, :scope => 'errors.messages', :default => "is invalid email format")
      record.errors[attribute] << msg
    end
  end
end
