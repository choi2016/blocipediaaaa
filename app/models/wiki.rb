class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators
  
  after_initialize :initialize_role

  private

  def initialize_role
    self.private = false if self.private.nil?
  end
end
