class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :title
      t.text :content
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.string :language, null: false, default: "en"
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
