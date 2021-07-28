class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, :uniqueness => {:case_sensitive => false }
  validates :name, presence: true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end  
        
end
