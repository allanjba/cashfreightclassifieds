# -*- encoding: utf-8 -*-
# stub: azure-storage-common 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "azure-storage-common".freeze
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Microsoft Corporation".freeze]
  s.date = "2020-03-10"
  s.description = "Microsoft Azure Storage Common Client Library for Ruby".freeze
  s.email = "ascl@microsoft.com".freeze
  s.homepage = "http://github.com/azure/azure-storage-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Official Ruby client library to consume Azure Storage Common service".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 1.0.0.rc1"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.10.4"])
      s.add_development_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.9", ">= 0.9.11"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 1.0"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 1.0.0.rc1"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10.4"])
      s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.7"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.9", ">= 0.9.11"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 1.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 1.0.0.rc1"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10.4"])
    s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.7"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9", ">= 0.9.11"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
  end
end
