# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  admin                  :boolean          default("f")
#  preference_id          :integer
#

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
