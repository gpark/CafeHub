class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessor :sign_up_code
   validates :sign_up_code,
     on: :create,
     presence: true
   validate :check_code_valid,
     on: :create
   validates :name,
     presence: true
  has_one :preference

   def check_code_valid
     errors.add(:sign_up_code, "is incorrect") if sign_up_code.to_s != Setting.sign_up_code.to_s
   end

   def admin?
     admin
   end

end
