class AddPublishAtToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :published_at, :datetime
  end
end
