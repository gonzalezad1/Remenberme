class Article < ActiveRecord::Base
searchable do
  text :question_title, :boost => 5
  text :content, :publish_month
  text :comments do
    comments.map(&:content)
  end
  time :published_at
  string :publish_month
end

def publish_month
  published_at.strftime("%B %Y")
end

end