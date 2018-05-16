# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint(8)        not null, primary key
#  sub_id     :bigint(8)
#  post_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  
  belongs_to :sub
  belongs_to :post
  
end
