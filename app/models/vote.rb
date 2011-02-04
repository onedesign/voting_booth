class Vote < ActiveRecord::Base
  belongs_to :voter, :polymorphic => true
  belongs_to :votable, :polymorphic => true, :counter_cache => true

  validates_presence_of :votable, :voter
end
