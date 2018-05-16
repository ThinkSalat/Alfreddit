# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  
  validates_presence_of :title, :description, :moderator_id
  validates :title, uniqueness: true
  
  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: :User
  
  has_and_belongs_to_many :posts
  
end
