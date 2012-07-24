# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{omniauth-facebook}
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Dodwell"]
  s.date = %q{2012-07-07}
  s.email = ["mark@mkdynamic.co.uk"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "README.md", "Rakefile", "example/Gemfile", "example/Gemfile.lock", "example/config.ru", "lib/omniauth-facebook.rb", "lib/omniauth/facebook.rb", "lib/omniauth/facebook/version.rb", "lib/omniauth/strategies/facebook.rb", "omniauth-facebook.gemspec", "test/helper.rb", "test/support/shared_examples.rb", "test/test.rb"]
  s.homepage = %q{https://github.com/mkdynamic/omniauth-facebook}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Facebook strategy for OmniAuth}
  s.test_files = ["test/helper.rb", "test/support/shared_examples.rb", "test/test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.1.0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1.0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1.0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
