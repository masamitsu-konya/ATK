# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails3_acts_as_paranoid}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Goncalo Silva"]
  s.date = %q{2012-05-16 00:00:00.000000000Z}
  s.description = %q{Active Record (~>3.2) plugin which allows you to hide and restore records without actually deleting them. Check its GitHub page for more in-depth information.}
  s.email = ["goncalossilva@gmail.com"]
  s.files = ["lib/acts_as_paranoid/associations.rb", "lib/acts_as_paranoid/core.rb", "lib/acts_as_paranoid/relation.rb", "lib/acts_as_paranoid/validations.rb", "lib/rails3_acts_as_paranoid.rb", "LICENSE", "README.markdown"]
  s.homepage = %q{https://github.com/goncalossilva/rails3_acts_as_paranoid}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rails3_acts_as_paranoid}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Active Record (~>3.2) plugin which allows you to hide and restore records without actually deleting them.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.2"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.2"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.2"])
  end
end
