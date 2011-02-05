Rails.application.routes.draw do
  scope '/voting_engine' do
    match ":votable_type/:votable_id", :as => :vote, :to => "votes#create", :via => [:post, :put]
    match ":votable_type/:votable_id", :as => :vote, :to => "votes#destroy", :via => :delete
  end
end
