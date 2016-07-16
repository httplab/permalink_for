# frozen_string_literal: true
module PermalinkFor::PrettyImpl
  extend ActiveSupport::Concern

  def to_param
    return id if new_record?
    target_field_value = send(permalink_configuration[:target_field])
    arr = [id, I18n.transliterate(target_field_value).parameterize]
    arr.reject!(&:blank?)
    permalink_configuration[:reverse] && arr.reverse!
    arr.join(PermalinkFor::DELIMETER)
  end

  module ClassMethods
    def find(id)
      position = permalink_configuration[:reverse] ? :last : :first
      id = id.split(PermalinkFor::DELIMETER).send(position).to_i if id.is_a?(String)
      super(id)
    end
  end
end
