require 'spec_helper'

describe User do
  it { should have_many(:votes) }
  it { should have_many(:votes_for) }
  it { should have_many(:votes_against) }

  context "voting" do
    let(:votable) { mock_model(BlogPost) }
    let(:vote) { mock_model(Vote) }
    let(:vote_proxy) { mock('vote proxy') }

    it "should create or update Vote" do
      subject.id = 1
      subject.should_receive(:votes).and_return(vote_proxy)
      vote_proxy.should_receive(:find_or_initialize_by_votable_type_and_votable_id).with("BlogPost", votable.id).and_return(vote)
      vote.should_receive(:update_attribute).with(:for, true)

      subject.vote(votable, true)
    end

    it "should allow voting for" do
      subject.should_receive(:vote).with(votable, true)
      subject.vote_for(votable)
    end

    it "should allow voting against" do
      subject.should_receive(:vote).with(votable, false)
      subject.vote_against(votable)
    end
  end
end
