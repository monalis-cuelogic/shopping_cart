class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  before_validation :set_default_role
  belongs_to :role
  validates :name, presence: true
  protected
  def set_default_role
  	binding.pry
  	role=Role.find_by_name("customer")
  	binding.pry
    self.role_id = role.id
  end
end
