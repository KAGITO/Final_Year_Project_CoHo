class Question < ActiveRecord::Base
	belongs_to :user
	has_many :tags 
  has_many :answers
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 10 }
	validates :content, presence: true, length: { maximum: 1000 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

	
end
