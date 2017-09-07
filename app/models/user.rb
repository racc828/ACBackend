class User < ApplicationRecord
   has_secure_password
   has_many :collaborators
   has_many :projects, through: :collaborators
 end
