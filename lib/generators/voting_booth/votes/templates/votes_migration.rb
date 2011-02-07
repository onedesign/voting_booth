class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :voter_id, :votable_id, :null => false
      t.string :voter_type, :votable_type, :null => false
      t.boolean :for, :null => false
      t.timestamps
    end
    add_index :votes, [ :voter_id, :voter_type ]
    add_index :votes, [ :votable_id, :votable_type ]
  end

  def self.down
    drop_table :votes
  end
end
