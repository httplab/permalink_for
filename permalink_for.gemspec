# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'permalink_for/version'

Gem::Specification.new do |spec|
  spec.name          = 'permalink_for'
  spec.version       = PermalinkFor::VERSION
  spec.authors       = %w(rainrb kovalevsky)
  spec.email         = ['dev@httplab.ru']

  spec.summary       = 'Slugs for ActiveRecord Models'
  spec.description   = 'Simple alternative to FriendlyId.'
  spec.homepage      = 'https://github.com/httplab/permalink_for'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'
  spec.add_dependency 'activesupport'
end
