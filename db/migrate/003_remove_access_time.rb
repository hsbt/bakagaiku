class RemoveAccessTime < ActiveRecord::Migration
  def self.up
    remove_column(:receptions , "access_time")
  end

  def self.down
    add_column(:receptions , "access_time", :datetime)
  end
end
