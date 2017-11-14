class UsersController < ApplicationController
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis, dependent: :destroy
end
