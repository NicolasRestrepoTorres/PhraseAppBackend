class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :topic, :section, :content, :language, :original_language
  has_many :questions
end
