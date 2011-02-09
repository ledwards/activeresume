class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :profile
  has_many :employments
  has_many :educations
  has_many :projects
  has_many :publications

  before_validation :create_profile

  def create_profile
    self.profile ||= Profile.new(:email => self.email)
  end

  def display_name
    profile.first_name.present? ? "#{profile.first_name} #{profile.last_name}".strip : email
  end

end
