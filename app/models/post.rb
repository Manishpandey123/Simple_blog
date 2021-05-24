class Post < ApplicationRecord
    has_one_attached :profile_image
    has_rich_text :body
end
