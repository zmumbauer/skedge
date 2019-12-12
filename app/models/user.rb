class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:ultimate_manager, :business_manager, :business_employee], multiple: true)                                      ##
  ############################################################################################ 
  # Include default devise modules. Others available are:
  # :lockable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :timeoutable

  # Relations

  belongs_to :organization
  has_many :timeperiods

  # Validations

  validates :first_name, presence: true, length: { minimum: 2, maximum: 30}
  validates :last_name, presence: true, length: { minimum: 2, maximum: 40}
  validates :phone_number, presence: true, numericality: { only_integer: true }

  # TODO: add precision to decimal hourly rate column
  
end
