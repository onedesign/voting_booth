module VotingEngine
  require 'voting_engine/engine' if defined?(Rails)
  require 'voting_engine/votable' if defined?(ActiveRecord)
  require 'voting_engine/voter' if defined?(ActiveRecord)

  # Specifies how the VotesController will try to find the voter. You may want
  # to override this if, for instance, you are using devise with an Admin model
  # and namespace. Default: current_user
  mattr_accessor :find_voter_block
  self.find_voter_block = lambda { current_user }

  # Specifies whether only allowing positive votes will be allowed. Useful if
  # you want to use this Engine as a favoriting/liking solution. Default:
  # false.
  mattr_accessor :positive_votes_only
  self.positive_votes_only = false
end
