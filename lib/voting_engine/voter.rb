module VotingEngine
  module Voter
    extend ActiveSupport::Concern

    module ClassMethods
      def voter(opts={})
        has_many :votes, :as => :voter
        has_many :votes_for, :as => :voter, :conditions => {:for => true}, :class_name => "Vote"
        has_many :votes_against, :as => :voter, :conditions => {:for => false}, :class_name => "Vote"
      end
    end
  end # Voter
end # VotingEngine

ActiveRecord::Base.class_eval { include VotingEngine::Voter }
