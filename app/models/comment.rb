class Comment < ApplicationRecord
  belongs_to :user

  validate :one_comment

  private

    def one_comment
      if Comment.exists?(movie_id: movie_id, user_id: user_id)
        errors.add(:user_id, 'User already commented movie')
      end
    end

end