# frozen_string_literal: true
module PermalinkFor::Model
  extend ActiveSupport::Concern

  included do
    class_attribute :permalink_configuration
  end

  module ClassMethods
    def permalink_for(field, as: :pretty, reverse: false)
      as = as.to_sym
      PermalinkFor::PERMALINK_TYPES.key?(as) || raise(PermalinkFor::InvalidTypeError.new(as))
      include PermalinkFor::PERMALINK_TYPES[as]

      self::ActiveRecord_AssociationRelation.include(PermalinkFor::PERMALINK_TYPES[as]::ClassMethods)

      self.permalink_configuration = { target_field: field, reverse: reverse }.freeze
    end
  end
end
