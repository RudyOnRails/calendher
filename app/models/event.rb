class Event < ActiveRecord::Base
  attr_accessible :name, :date, :description, :user_id, :recipient_id

  belongs_to :user
  belongs_to :recipient

  def self.add_holiday(user_id, recipient_id, name, desc, date)
  	Event.create(user_id: user_id, recipient_id: recipient_id, name: name, description: desc, date: date)
  end

end
