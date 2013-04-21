class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :date, :datetime
    add_column :events, :user_id, :integer
    add_column :events, :recipient_id, :integer
  end
end
