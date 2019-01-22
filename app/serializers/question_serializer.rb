class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes, :dislikes, :article_id
  has_many :answers
end
