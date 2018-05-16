# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates_presence_of :title, :author_id
  
  belongs_to :author,
  class_name: :User,
  foreign_key: :author_id,
  primary_key: :id
  
  has_many :comments
  
  has_and_belongs_to_many :subs
  
end
