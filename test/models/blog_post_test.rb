require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test if a draft method returns true if it is a draft
  test "draft? returns true if draft" do
    # binding.irb # opens the console so that ou can rub other code anytime during the test
    assert blog_posts(:draft).draft?
  end

  # test if a draft method returns false if it is a published post
  test "draft? returns false if published" do
    refute blog_posts(:published).draft?
  end

  # test if a draft method returns false if it is a scheduled post
  test "draft? returns false if scheduled" do
    refute blog_posts(:scheduled).draft?
  end

  # test if a published method returns true if it is a published post
  test "published? returns true if published" do
    assert blog_posts(:published).published?
  end

  # test if a published method returns false if it is a draft
  test "published? returns false if draft" do
    refute blog_posts(:draft).published?
  end

  # test if a published method returns false if it is scheduled
  test "published? returns false if scheduled" do
    refute blog_posts(:scheduled).published?
  end

  # test if a scheduled method returns true if it is a scheduled post
  test "scheduled? returns true if scheduled" do
    assert blog_posts(:scheduled).scheduled?
  end

  # test if a scheduled method returns false if it is a draft
  test "scheduled? returns false if draft" do
    refute blog_posts(:draft).scheduled?
  end
  
  # test if a scheduled method returns false if it is published
  test "scheduled? returns false if published" do
    refute blog_posts(:published).scheduled?
  end

end
