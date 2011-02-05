class VotesController < ApplicationController
  before_filter :require_voter

  def create
    voter.vote(votable, vote_for?)
    render_votes(votable)
  end

  def destroy
    voter.remove_vote(votable)
    render_votes(votable)
  end

  private

  # In theory, this should be a 401. But that generally pops up an in-browser
  # prompt for username and password. And we don't want that.
  def require_voter
    render :nothing => true, :status => 400 and return if voter.nil?
  end

  def render_votes(votable)
    render :json => votable.reload.votes_count.to_json
  end

  def voter
    @voter ||= instance_eval(&VotingEngine.find_voter_block)
  end

  def votable
    @votable ||= votable_class.find(params[:votable_id])
  end

  def votable_class
    params[:votable_type].classify.constantize
  end

  def vote_for?
    return true if VotingEngine.positive_votes_only
    'for' == params[:vote]
  end
end
