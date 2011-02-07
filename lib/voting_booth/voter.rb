module VotingBooth
  module Voter
    extend ActiveSupport::Concern

    module ClassMethods
      def voter(opts={})
        include VoterInstanceMethods

        has_many :votes, :as => :voter
        has_many :votes_for, :as => :voter, :conditions => {:for => true}, :class_name => "Vote"
        has_many :votes_against, :as => :voter, :conditions => {:for => false}, :class_name => "Vote"
      end
    end

    module VoterInstanceMethods
      def vote(votable, value)
        votes.find_or_initialize_by_votable_type_and_votable_id(votable.class.to_s, votable.id).tap do |vote|
          vote.update_attribute(:for, value)
        end
      end

      def vote_for(votable); vote(votable, true); end
      def vote_against(votable); vote(votable, false); end

      def remove_vote(votable)
        votes.find_by_votable_type_and_votable_id(votable.class.to_s, votable.id).try(:destroy)
      end

      def voted_for?(votable)
        true == vote_for_votable(votable).try(:for)
      end

      def voted_against?(votable)
        false == vote_for_votable(votable).try(:for)
      end

      def voted_on?(votable)
        vote_for_votable(votable).present?
      end

      def vote_for_votable(votable)
        votes.for_votable(votable).first
      end

    end # VoterInstanceMethods
  end # Voter
end # VotingBooth

ActiveRecord::Base.class_eval { include VotingBooth::Voter }
