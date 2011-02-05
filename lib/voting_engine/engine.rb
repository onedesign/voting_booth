module VotingEngine
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.helper(VotesHelper)
    end
  end
end
