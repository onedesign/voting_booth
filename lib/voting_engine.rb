module VotingEngine
  require 'voting_engine/engine' if defined?(Rails)
  require 'voting_engine/votable' if defined?(ActiveRecord)
end
