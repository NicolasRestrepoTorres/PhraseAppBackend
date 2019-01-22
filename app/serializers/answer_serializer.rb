class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes, :dislikes, :question_id

end
