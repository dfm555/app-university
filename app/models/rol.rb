# == Schema Information
#
# Table name: rols
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rol < ActiveRecord::Base
  has_one :user
  validates :name, presence: true, uniqueness: true
end
