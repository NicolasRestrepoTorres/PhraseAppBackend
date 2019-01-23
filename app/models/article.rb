class Article < ApplicationRecord
  has_many :questions,  dependent: :destroy

end
