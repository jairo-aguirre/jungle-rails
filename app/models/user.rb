class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    
    @user =  User.find_by_email(email)&.authenticate(password)
    
    if @user
      @user
    else
      nil
    end
  end
end