require_relative '../data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true, unique: true,
            messages: {
              presence: "We need your username",
              is_unique: "That username is already registered"
            }
  property :email, String, required: true, :format => :email_address, unique: true,
            messages: {
              presence: "We need your email address",
              is_unique: "Email address is already registered",
              format: "Please make sure to enter your email address in the right format"
  }

  property :password_digest, Text, required: true


  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
