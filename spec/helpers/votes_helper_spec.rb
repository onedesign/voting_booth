require 'spec_helper'

describe VotesHelper do
  let(:votable) { mock_model(BlogPost) }

  it "should create vote_for_path" do
    vote_for_path(votable).should == "/voting_booth/blog_post/#{votable.id}?vote=for"
  end

  it "should create vote_against_path" do
    vote_against_path(votable).should == "/voting_booth/blog_post/#{votable.id}?vote=against"
  end
end
