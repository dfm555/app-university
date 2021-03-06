# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  partial_one :decimal(, )
#  partial_two :string
#  final       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Score < ActiveRecord::Base
  validates :partial_one, presence: true
  validates :partial_two, presence: true
  validates :final, presence: true
end