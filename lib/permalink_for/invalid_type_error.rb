# frozen_string_literal: true

class PermalinkFor::InvalidTypeError < StandardError

  def initialize(type)
    @type = type
  end

  def message
    "Unknown permalink type :#{as} (may be: #{PermalinkFor::PERMALINK_TYPES.keys.join(', ')})"
  end

end
