# frozen_string_literal: true
require 'active_support/concern'

module PermalinkFor
  require 'permalink_for/pretty_impl'
  require 'permalink_for/slug_impl'
  require 'permalink_for/model'
  require 'permalink_for/version'

  PERMALINK_TYPES = {
    slug: SlugImpl,
    pretty: PrettyImpl
  }.freeze
end
