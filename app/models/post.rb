class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]
    
    def is_clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    end
    # def is_clickbait?
    #     clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    #     binding.pry
    #     (self.title.split & clickbait).any? ? true : errors.add(:title, "must be clickbait" )
    # end
end