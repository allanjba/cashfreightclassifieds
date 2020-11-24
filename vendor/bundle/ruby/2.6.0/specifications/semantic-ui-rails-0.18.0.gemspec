# -*- encoding: utf-8 -*-
# stub: semantic-ui-rails 0.18.0 ruby lib

Gem::Specification.new do |s|
  s.name = "semantic-ui-rails".freeze
  s.version = "0.18.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["nd0ut".freeze]
  s.date = "2014-08-07"
  s.description = "UI is the vocabulary of the web".freeze
  s.email = ["nd0ut.me@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Semantic empowers designers and developers by creating a language for sharing UI".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<less-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<binding_of_caller>.freeze, [">= 0"])
      s.add_development_dependency(%q<git>.freeze, [">= 0"])
    else
      s.add_dependency(%q<less-rails>.freeze, [">= 0"])
      s.add_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<binding_of_caller>.freeze, [">= 0"])
      s.add_dependency(%q<git>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<less-rails>.freeze, [">= 0"])
    s.add_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<binding_of_caller>.freeze, [">= 0"])
    s.add_dependency(%q<git>.freeze, [">= 0"])
  end
end
