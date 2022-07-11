class User < ApplicationRecord
	require "securerandom"
	
	has_many :todos, dependent: :destroy
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :name, presence: true
end
