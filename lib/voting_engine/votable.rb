module VotingEngine
  module Votable
    extend ActiveSupport::Concern

    module ClassMethods
      def votable(opts={})
        include VotableInstanceMethods

        has_many :votes, :as => :votable
        has_many :votes_for, :as => :votable, :conditions => {:for => true}, :class_name => "Vote"
        has_many :votes_against, :as => :votable, :conditions => {:for => false}, :class_name => "Vote"
      end
    end # ClassMethods

    module VotableInstanceMethods
      def voted_by?(voter)
        votes.for_voter(voter).first.present?
      end

      def update_vote_score
        update_attribute(:vote_score, vote_ci_lower_bound)
      end

      private

      # From http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
      def vote_ci_lower_bound(pos = votes_for.count, n = votes.count, power = 0.10)
        return 0 if n.zero?

        z = ::Rubystats::NormalDistribution.new.icdf(1-power/2)
        phat = 1.0*pos/n
        (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
      end

    end # VotableInstanceMethods
  end # Votable
end # VotableEngine

ActiveRecord::Base.class_eval { include VotingEngine::Votable }
