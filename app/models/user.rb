# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  identification  :string
#  name            :string
#  last_name       :string
#  user_name       :string
#  email           :string
#  password_digest :string
#  birth_date      :date
#  status          :boolean          default(TRUE)
#  phone           :string
#  rol_id          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  belongs_to :rol
  has_secure_password

  validates :identification, presence: true, uniqueness: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :rol_id, presence: true
end
