class CreateReceptions < ActiveRecord::Migration
  def self.up
    create_table :receptions do |t|
      t.column "create_time", :datetime
      t.column "access_time", :datetime
    end
  end

  def self.down
    drop_table :receptions
  end
end
