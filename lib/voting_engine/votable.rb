module VotingEngine
  module Votable
    extend ActiveSupport::Concern

    module ClassMethods
      def votable(opts={})
        has_many :votes, :as => :votable
        has_many :votes_for, :as => :votable, :conditions => {:for => true}, :class_name => "Vote"
        has_many :votes_against, :as => :votable, :conditions => {:for => false}, :class_name => "Vote"
      end
    end # ClassMethods
  end # Votable
end # VotableEngine

ActiveRecord::Base.class_eval { include VotingEngine::Votable }
