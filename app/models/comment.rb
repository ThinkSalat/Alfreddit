# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  content           :string           not null
#  author_id         :integer          not null
#  post_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord
  validates :content, :author_id, presence: true
  
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  
  belongs_to :post  
  
  has_many :child_comments,
  foreign_key: :parent_comment_id,
  primary_key: :id,
  class_name: :Comment
  
  belongs_to :parent_comment,
  foreign_key: :parent_comment_id,
  primary_key: :id,
  class_name: :Comment,
  optional: true
  
  
  end
