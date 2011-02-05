class MakeBlogPostsVotable < ActiveRecord::Migration
  def self.up
    change_table :blog_posts do |table|
      table.integer :votes_count, :default => 0
      table.float :vote_score, :default => 0.0
    end
  end

  def self.down
    change_table :blog_posts do |table|
      table.remove :votes_count, :vote_score
    end
  end
end
