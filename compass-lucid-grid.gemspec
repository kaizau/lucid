Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.1.1"
  s.date = "2011-05-21"

  # Gem Details
  s.name = "compass-lucid-grid"
  s.authors = ["Yifei Zhang"]
  s.summary = %q{A Compass/SASS grid for developers who love semantics.}
  s.description = %q{A Compass/SASS grid for developers who love semantics.}
  s.email = "yz@yifei.co"
  s.homepage = "https://github.com/ezYZ/lucid"

  # Gem Files
  s.files = %w(README.md)
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")
  s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  s.rubygems_version = %q{1.3.6}
  s.add_dependency("compass", [">= 0.11"])
end
