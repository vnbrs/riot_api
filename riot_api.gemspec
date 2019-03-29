
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "riot_api/version"

Gem::Specification.new do |spec|
  spec.name          = "riot_api"
  spec.version       = RiotApi::VERSION
  spec.authors       = ["Vinicius Brasil"]
  spec.email         = ["vnbrs@icloud.com"]

  spec.summary       = "RiotAPI is the coolest Riot Games API gem. Blitzcrank approves!"
  spec.description   = "The RiotAPI is a lightweight gem for accessing the Riot Games API using a cool DSL."
  spec.homepage      = "https://github.com/vnbrs/riot_api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
