class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: {in: (["Fiction", "Non-Fiction"])}
    validate :title_validates_clickbait

    OPTIONS = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def title_validates_clickbait
        if OPTIONS.none? { |option| option.match(title)} 
            errors.add(:title, "Need to add more for clickbait")
        end
    end
end
