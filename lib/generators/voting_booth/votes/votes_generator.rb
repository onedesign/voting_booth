require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module VotingBooth
  class VotesGenerator < Rails::Generator::Base
    desc "Creates the Votes table. Only needs to be run once."
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    class << self
      delegate :next_migration_number, :to => ActiveRecord::Generators::Base
    end

    def create_migration_file
      migration_template "votes_migration.rb", "db/migrate/create_votes.rb"
    end
  end # VotesGenerator
end # VotingBooth
