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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
