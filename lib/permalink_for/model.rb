# frozen_string_literal: true
module PermalinkFor::Model
  extend ActiveSupport::Concern

  module ClassMethods
    def permalink_for(field, as: :pretty, reverse: false)
      as = as.to_sym
      unless PermalinkFor::PERMALINK_TYPES.key? as
        raise "Unknown permalink type :#{as} (may be :slug or :pretty)"
      end
      include PermalinkFor::PERMALINK_TYPES[as]

      self::ActiveRecord_AssociationRelation.include PermalinkFor::PERMALINK_TYPES[as]::ClassMethods

      config = { target_field: field, reverse: reverse }
      cattr_reader :permalink_configuration
      class_variable_set(:@@permalink_configuration, config)
    end
  end
end
