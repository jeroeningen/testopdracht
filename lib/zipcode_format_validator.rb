class ZipcodeFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^[0-9]{4}\s{0,1}[a-zA-Z]{2}$/
      object.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end
end