class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  before_validation :set_default_role
  belongs_to :role
  has_many :carts
  validates :name, presence: true
  protected
  def set_default_role
  	role=Role.find_by_name("customer")
    self.role_id = role.id
  end
end
