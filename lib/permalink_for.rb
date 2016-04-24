require 'permalink_for/pretty_implementation'
require 'permalink_for/slug_implementation'
require 'permalink_for/version'

module PermalinkFor
  extend ActiveSupport::Concern

  PERMALINK_TYPES = {
    slug: SlugImpl,
    pretty: PrettyImpl
  }

  module ClassMethods
    def permalink_for(field, as: :pretty, reverse: false)
      as = as.to_sym
      unless PERMALINK_TYPES.has_key? as
        raise "Unknown permalink type :#{as} (may be :slug or :pretty)"
      end
      include PERMALINK_TYPES[as]

      self::ActiveRecord_AssociationRelation.include PERMALINK_TYPES[as]::ClassMethods

      config = { target_field: field, reverse: reverse }
      cattr_reader :permalink_configuration
      class_variable_set(:@@permalink_configuration, config)
    end
  end
end
