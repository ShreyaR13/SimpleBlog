class Post < ApplicationRecord
    has_many :comments, dependent: :destroy       #a post can have many comments
                                                  #depedent: :destroy helps deleting post along with the comments under the post
    validates :title, presence: true,
                    length: {minimum: 5}
end
