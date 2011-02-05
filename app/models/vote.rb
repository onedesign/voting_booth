class Vote < ActiveRecord::Base
  belongs_to :voter, :polymorphic => true
  belongs_to :votable, :polymorphic => true, :counter_cache => true

  validates_presence_of :votable, :voter

  after_save :update_vote_score
  after_destroy :update_vote_score
  delegate :update_vote_score, :to => :votable

  scope :for_votable, lambda {|votable|
    where :votable_type => votable.class.to_s, :votable_id => votable.id
  }

  scope :for_voter, lambda {|voter|
    where :voter_type => voter.class.to_s, :voter_id => voter.id
  }

  scope :for_voter_and_votable, lambda {|voter,votable|
    for_votable(votable).for_voter(voter).limit(1)
  }

end
