module VotesHelper
  def vote_for_path(votable)
    vote_path(vote_options(votable).merge(:vote => 'for'))
  end

  def vote_against_path(votable)
    vote_path(vote_options(votable).merge(:vote => 'against'))
  end

  private

  def vote_options(votable)
    { :votable_type => votable.class.to_s.underscore, :votable_id => votable.id }
  end
end
