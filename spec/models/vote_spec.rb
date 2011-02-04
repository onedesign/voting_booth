require 'spec_helper'

describe Vote do
  it { should belong_to(:voter) }
  it { should belong_to(:votable) }

  it { should validate_presence_of(:voter) }
  it { should validate_presence_of(:votable) }
end
