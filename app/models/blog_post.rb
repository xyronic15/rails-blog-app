class BlogPost < ApplicationRecord
    has_rich_text :content

    # validate the title and the body with 
    validates :title, :content, presence: true

    # scope for the blog posts
    scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
    scope :draft, -> { where(published_at: nil) }
    scope :published, -> { where("published_at <= ?", Time.current) }
    scope :scheduled, -> { where("published_at > ?", Time.current) }

    # check if it is still a draft based on whether or not ther is a published date
    def draft?
        published_at.nil?
    end

    # check if it is a published post based on whether or not the published date is in the past
    def published?
        published_at? && published_at <= Time.current
    end

    # check if a post is scheduled based on whether or not the published date is in the future
    def scheduled?
        published_at? && published_at > Time.current
    end
end
