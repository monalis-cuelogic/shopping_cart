class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  before_validation :set_default_role
  #after_validation :check_current_user
  belongs_to :role
  validates :name, presence: true
  protected
  def set_default_role
    binding.pry
  	role=Role.find_by_name("customer")
    self.role_id = role.id
  end

  # def check_current_user
  #   binding.pry
  #   role=Role.find_by_name("admin")
  #   if self.name="admin"
  #     redirect_to brands_show_path
  #   else
  #     render home_welcome_path
      
  #   end
      
  # end

end
