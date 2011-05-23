Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.2.0"
  s.date = "2011-05-23"

  # Gem Details
  s.name = "compass-lucid-grid"
  s.authors = ["Yifei Zhang"]
  s.summary = %q{A Compass/SASS grid for developers who love semantics.}
  s.description = %q{A Compass/SASS grid that outputs lean, semantic stylesheets. Avoids CSS repetition on SASS compilation and reduces the need for wrapper <div>s.}
  s.email = "yz@yifei.co"
  s.homepage = "https://github.com/ezYZ/lucid"
  s.license = "MIT"

  # Gem Files
  s.files = %w(README.md)
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")
  s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  s.rubygems_version = %q{1.3.6}
  s.requirements = "SASS, Compass Framework"
  s.add_dependency("compass", [">= 0.11"])
end
