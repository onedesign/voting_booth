require 'spec_helper'

describe BlogPost do
  it { should have_many(:votes) }
  it { should have_many(:votes_for) }
  it { should have_many(:votes_against) }
end
