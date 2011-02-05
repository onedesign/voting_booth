require 'spec_helper'

describe User do
  it { should have_many(:votes) }
  it { should have_many(:votes_for) }
  it { should have_many(:votes_against) }
end

