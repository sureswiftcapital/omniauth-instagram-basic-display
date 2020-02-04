$LOAD_PATH.push File.expand_path("lib", __dir__)
require "omniauth/instagram-basic-display/version"

Gem::Specification.new do |s|
  s.name = "omniauth-instagram-basic-display"
  s.version = OmniAuth::InstagramBasicDisplay::VERSION
  s.authors = ["Chad Jablonski"]
  s.email = %w[chad@meetedgar.com]
  s.summary = "Instagram Basic Display API OAuth2 Strategy for OmniAuth"
  s.homepage =
    "https://github.com/roederstudios/omniauth-instagram-basic-display"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables =
    `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = %w[lib]

  s.add_runtime_dependency "omniauth-oauth2", "~> 1.2"

  s.add_development_dependency "minitest"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rake"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-config-prettier"
end
