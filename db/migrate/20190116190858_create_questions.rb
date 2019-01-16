class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question_content
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
