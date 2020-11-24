# -*- encoding: utf-8 -*-
# stub: azure-storage 0.15.0.preview ruby lib

Gem::Specification.new do |s|
  s.name = "azure-storage".freeze
  s.version = "0.15.0.preview"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Microsoft Corporation".freeze]
  s.date = "2017-11-17"
  s.description = "Microsoft Azure Storage Client Library for Ruby".freeze
  s.email = "ascl@microsoft.com".freeze
  s.homepage = "http://github.com/azure/azure-storage-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Official Ruby client library to consume Azure Storage services".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<azure-core>.freeze, ["~> 0.1"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.10"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6", ">= 1.6.8"])
      s.add_development_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
    else
      s.add_dependency(%q<azure-core>.freeze, ["~> 0.1"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.10"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6", ">= 1.6.8"])
      s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.7"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<azure-core>.freeze, ["~> 0.1"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.10"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6", ">= 1.6.8"])
    s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.7"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
  end
end
