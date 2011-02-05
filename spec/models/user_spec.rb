require 'spec_helper'

describe User do
  it { should have_many(:votes) }
  it { should have_many(:votes_for) }
  it { should have_many(:votes_against) }

  context "voting" do
    let(:votable) { mock_model(BlogPost) }
    let(:vote) { mock_model(Vote, :for => true) }
    let(:vote_proxy) { mock('vote proxy') }

    before do
      subject.id = 1
      subject.stub(:votes => vote_proxy)
    end

    it "should create or update Vote" do
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

    it "should allow removing a Vote" do
      vote_proxy.should_receive(:find_by_votable_type_and_votable_id).with('BlogPost', votable.id).and_return(vote)
      vote.should_receive(:destroy)

      subject.remove_vote(votable)
    end

    context "checking vote status" do
      it "should find vote" do
        vote_proxy.should_receive(:for_votable).with(votable).and_return([])
        subject.vote_for_votable(votable).should be_nil
      end

      context "when already voted" do
        before { subject.should_receive(:vote_for_votable).with(votable).and_return(vote) }

        it "voted_on? should be true" do
          subject.voted_on?(votable).should be_true
        end

        it "voted_for? should be true" do
          subject.voted_for?(votable).should be_true
        end

        it "voted_against? should be true" do
          subject.voted_against?(votable).should be_false
        end
      end

      context "when not already voted" do
        before { subject.should_receive(:vote_for_votable).with(votable).and_return(nil) }

        it "voted_on? should be true" do
          subject.voted_on?(votable).should be_false
        end

        it "voted_for? should be true" do
          subject.voted_for?(votable).should be_false
        end

        it "voted_against? should be true" do
          subject.voted_against?(votable).should be_false
        end
      end
    end

  end
end
