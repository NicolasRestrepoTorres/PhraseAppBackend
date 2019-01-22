class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.string :topic
      t.string :section
      t.text :content, null: false
      t.string :language, null: false
      t.string :original_language

      t.timestamps
    end
  end
end
