# frozen_string_literal: true

require_relative 'lib/RDC/version'

Gem::Specification.new do |spec|
  spec.name          = 'RDC'
  spec.version       = RDC::VERSION
  spec.authors       = %w[davidrichey aditya-kapoor]
  spec.email         = ['daveyrichey@gmail.com', 'adityakapoor.mait@gmail.com']

  spec.summary       = 'Ruby gem that wraps restaurants.com API'
  spec.description   = 'Ruby gem that wraps restaurants.com API'
  spec.homepage      = 'https://github.com/memberhubteam/RDC'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/memberhubteam/RDC'
  spec.metadata['changelog_uri'] = 'https://github.com/memberhubteam/RDC/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'net-sftp', '3.0.0'
  spec.add_dependency 'rubyzip'
end
