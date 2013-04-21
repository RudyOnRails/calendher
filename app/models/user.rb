class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  after_create :send_welcome_email

  has_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  before_validation :create_password
  before_save :downcase_email
  after_create :add_holidays

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def create_password
    self.token = (0...4).map{(rand(9))}.join
    self.password = self.token
  end
  def downcase_email
    self.email = self.email && self.email.downcase
  end

  def add_holidays
    Event.add_holiday(self.id, nil, "Mother's Day", nil, "2013-05-12")
    Event.add_holiday(self.id, nil, "Valentine's Day", nil, "2013-02-14")
  end

  private

    def send_welcome_email
      UserMailer.welcome_email(self).deliver
    end

end
