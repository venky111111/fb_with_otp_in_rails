class Postcomment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  validates :content, presence: true
    def self.ransackable_associations(auth_object = nil)
    ["likes", "post", "user"]
  end
   def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "post_id", "updated_at", "user_id"]
  end
end
