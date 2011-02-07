# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{voting_booth}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Hodos"]
  s.date = %q{2011-02-07}
  s.description = %q{A Rails 3 Engine that provides voting functionality across multiple models.}
  s.email = %q{danhodos@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.mdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.mdown",
    "Rakefile",
    "VERSION",
    "app/controllers/votes_controller.rb",
    "app/helpers/votes_helper.rb",
    "app/models/vote.rb",
    "config/routes.rb",
    "lib/generators/voting_booth/votable/templates/votable_migration.rb.erb",
    "lib/generators/voting_booth/votable/votable_generator.rb",
    "lib/generators/voting_booth/votes/templates/votes_migration.rb",
    "lib/generators/voting_booth/votes/votes_generator.rb",
    "lib/voting_booth.rb",
    "lib/voting_booth/engine.rb",
    "lib/voting_booth/votable.rb",
    "lib/voting_booth/voter.rb",
    "spec/controllers/votes_controller_spec.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/models/blog_post.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/001_create_votes.rb",
    "spec/dummy/db/migrate/002_create_blog_posts.rb",
    "spec/dummy/db/migrate/003_make_blog_posts_votable.rb",
    "spec/dummy/db/migrate/004_create_users.rb",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/public/javascripts/application.js",
    "spec/dummy/public/javascripts/controls.js",
    "spec/dummy/public/javascripts/dragdrop.js",
    "spec/dummy/public/javascripts/effects.js",
    "spec/dummy/public/javascripts/prototype.js",
    "spec/dummy/public/javascripts/rails.js",
    "spec/dummy/public/stylesheets/.gitkeep",
    "spec/dummy/script/rails",
    "spec/helpers/votes_helper_spec.rb",
    "spec/integration/navigation_spec.rb",
    "spec/models/blog_post_spec.rb",
    "spec/models/user_spec.rb",
    "spec/models/vote_spec.rb",
    "spec/spec_helper.rb",
    "voting_booth.gemspec"
  ]
  s.homepage = %q{http://github.com/onedesign/voting_booth}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Rails 3 Engine that provides voting functionality across multiple models.}
  s.test_files = [
    "spec/controllers/votes_controller_spec.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/models/blog_post.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/001_create_votes.rb",
    "spec/dummy/db/migrate/002_create_blog_posts.rb",
    "spec/dummy/db/migrate/003_make_blog_posts_votable.rb",
    "spec/dummy/db/migrate/004_create_users.rb",
    "spec/helpers/votes_helper_spec.rb",
    "spec/integration/navigation_spec.rb",
    "spec/models/blog_post_spec.rb",
    "spec/models/user_spec.rb",
    "spec/models/vote_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.3"])
      s.add_runtime_dependency(%q<rubystats>, ["~> 0.2.3"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.3"])
      s.add_dependency(%q<rubystats>, ["~> 0.2.3"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.3"])
    s.add_dependency(%q<rubystats>, ["~> 0.2.3"])
  end
end
