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

  context "update_vote_score" do
    it "should update based on the lower bound of the confidence interval" do
      subject.should_receive(:vote_ci_lower_bound).and_return(0.7)
      subject.should_receive(:update_attribute).with(:vote_score, 0.7)
      subject.update_vote_score
    end

    it "should determine confidence interval using math!" do
      subject.send(:vote_ci_lower_bound, 20, 20, 0.10).should be_within(0.001).of(0.881)
      subject.send(:vote_ci_lower_bound, 10, 20, 0.10).should be_within(0.001).of(0.327)
    end
  end
end
