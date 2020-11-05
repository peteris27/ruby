class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :username, :email

    # validates :name, :presence => true,
    #                   :uniqueness => true
    # validates :surname, :presence => true,
    #                     :uniqueness => true
    # validates :username, :presence => true,
    #                      :uniqueness => true
    # validates :email,    :presence => true,
    #                      :uniqueness => true
    # validates :password_digest, presence: true

end
