class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column "bakaid", :string, :limit => 10, :default => "", :null => false
      t.column "body", :text
      t.column "reception_id", :integer
    end
  end

  def self.down
    drop_table :entries
  end
end
