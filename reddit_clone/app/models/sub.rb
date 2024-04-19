# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post

    
        
end
