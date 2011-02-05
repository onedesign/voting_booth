require 'spec_helper'

shared_examples_for 'a voting response' do
  it { should respond_with(:success) }
  it { should assign_to(:voter).with(voter) }
  it { should assign_to(:votable).with(votable) }
  it { should respond_with_content_type(:json) }
  it { response.body.should == votable.votes_count.to_s }
end

describe VotesController do
  let(:votable) { mock_model(BlogPost, :votes_count => 1) }
  let(:voter) { mock_model(User) }

  context "routing" do
    it { should route(:post, "/voting_engine/blog_post/1").to(:action => :create, :votable_type => 'blog_post', :votable_id => 1) }
    it { should route(:delete, "/voting_engine/blog_post/1").to(:action => :destroy, :votable_type => 'blog_post', :votable_id => 1) }
  end

  context "when voter is not available" do
    before { subject.stub(:voter).and_return(nil) }

    context "creating a vote" do
      before { post :create, :votable_type => 'blog_post', :votable_id => '1' }
      it { should respond_with(400) }
    end

    context "destroying a vote" do
      before { delete :destroy, :votable_type => 'blog_post', :votable_id => '1' }
      it { should respond_with(400) }
    end
  end

  context "when voter is available" do
    before do
      BlogPost.should_receive(:find).with('1').and_return(votable)
      subject.stub(:current_user).and_return(voter)
      votable.stub(:reload).and_return(votable)
    end

    context "POST to 'create'" do
      before do
        voter.should_receive(:vote).with(votable, false)
        post :create, :votable_type => 'blog_post', :votable_id => '1'
      end
      it_should_behave_like 'a voting response'
    end

    context "DELETE to 'destroy'" do
      before do
        voter.should_receive(:remove_vote).with(votable)
        delete :destroy, :votable_type => 'blog_post', :votable_id => '1'
      end
      it_should_behave_like 'a voting response'
    end
  end
end