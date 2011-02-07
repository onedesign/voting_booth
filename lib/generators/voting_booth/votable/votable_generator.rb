require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module VotingBooth
  class VotableGenerator < Rails::Generator::NamedBase
    desc "Makes a specified model, e.g. BlogPost, votable."
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    class << self
      delegate :next_migration_number, :to => ActiveRecord::Generators::Base
    end

    def create_migration_file
      migration_template "votable_migration.rb.erb", "db/migrate/make_#{plural_name}_votable.rb"
    end
  end # VotableGenerator
end # VotingBooth

