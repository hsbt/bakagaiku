class AddTimeStampsAllTable < ActiveRecord::Migration
  def up
    remove_column :receptions, :create_time
    add_column :entries, :created_at, :datetime
    add_column :entries, :updated_at, :datetime
    add_column :receptions, :created_at, :datetime
    add_column :receptions, :updated_at, :datetime
  end

  def down
    add_column :receptions, :create_time, :datetime
    remove_column :entries, :created_at
    remove_column :entries, :updated_at
    remove_column :receptions, :created_at
    remove_column :receptions, :update_at
  end
end
