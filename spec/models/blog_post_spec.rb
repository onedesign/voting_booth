require 'spec_helper'

describe BlogPost do
  it { should have_many(:votes) }
  it { should have_many(:votes_for) }
  it { should have_many(:votes_against) }

  context "voted on" do
    let(:voter) { mock_model(User) }
    let(:vote) { mock_model(Vote) }
    let(:vote_proxy) { mock('vote proxy') }

    before { subject.stub(:votes).and_return(vote_proxy) }

    it "should return true if the voter voted on this" do
      vote_proxy.should_receive(:for_voter).with(voter).and_return([vote])
      subject.voted_by?(voter).should be_true
    end

    it "should return false if the voter did not vote on this" do
      vote_proxy.should_receive(:for_voter).with(voter).and_return([])
      subject.voted_by?(voter).should be_false
    end
  end
end
