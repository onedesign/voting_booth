require 'spec_helper'

describe Vote do
  it { should belong_to(:voter) }
  it { should belong_to(:votable) }

  it { should validate_presence_of(:voter) }
  it { should validate_presence_of(:votable) }

  context "scopes" do
    let(:votable) { mock_model(BlogPost) }
    let(:voter) { mock_model(User) }
    let(:vote) { mock_model(Vote) }

    it "should find for_votable" do
      where_hash = { :votable_type => 'BlogPost', :votable_id => votable.id }
      Vote.for_votable(votable).where_values_hash.should == where_hash
    end

    it "should find for_voter" do
      where_hash = { :voter_type => 'User', :voter_id => voter.id }
      Vote.for_voter(voter).where_values_hash.should == where_hash
    end

    it "should find for_voter_and_votable" do
      where_hash = Vote.for_voter(voter).where_values_hash
      where_hash.merge!(Vote.for_votable(votable).where_values_hash)
      Vote.for_voter_and_votable(voter, votable).where_values_hash.should == where_hash
    end

    it "should only return a single item for_voter_and_votable" do
      Vote.for_voter_and_votable(voter, votable).limit_value.should == 1
    end
  end
end
