# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{httpauth}
  s.version = "0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Manfred Stienstra"]
  s.cert_chain = nil
  s.date = %q{2006-09-04}
  s.description = %q{HTTPauth is a library supporting the full HTTP Authentication protocol as specified in RFC 2617; both Digest Authentication and Basic Authentication.}
  s.email = %q{manfred@fngtps.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["README", "LICENSE", "Rakefile", "lib/httpauth", "lib/httpauth.rb", "lib/httpauth/basic.rb", "lib/httpauth/constants.rb", "lib/httpauth/digest.rb", "lib/httpauth/exceptions.rb", "examples/client_digest_secure", "examples/server_digest_secure"]
  s.homepage = %q{http://httpauth.rubyforge.org}
  s.rdoc_options = ["--quiet", "--title", "HTTPAuth - A Ruby library for creating, parsing and validating HTTP authentication headers", "--opname", "index.html", "--line-numbers", "--main", "README", "--charset", "utf-8", "--inline-source", "--exclude", "^(examples|test)\\/"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.0")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Library for the HTTP Authentication protocol (RFC 2617)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
