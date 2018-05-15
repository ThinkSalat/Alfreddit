# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates_presence_of :title, :sub_id, :author_id
  
  belongs_to :sub
  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
    
    
end
