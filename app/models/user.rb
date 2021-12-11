class User < ApplicationRecord
    has_secure_password
    # validates_presence_of :full_name,:message => "Please Provide Full Name"
    # validates_presence_of :email,:message => "Please Provide Email"
    # validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
    # validates :email, presence: true, uniqueness: true
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :password,
    # length: { minimum: 6 }
end
