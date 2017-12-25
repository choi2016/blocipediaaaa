class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :wikis
  has_many :collaborators, dependent: :destroy


  after_initialize :initialize_role
  
  def self.going_public(user)
    @wikis = user.wikis.where(private: true)
    @wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
  end

  private

  def initialize_role
    self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]
end
