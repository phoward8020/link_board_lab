class Post < ActiveRecord::Base
  
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 10, 
                              maximum: 100,
                              message: "post title must be between 10 and 100 characters" }

  validates :link,  presence: true,
                    format: URI::regexp(%w(http https))
end