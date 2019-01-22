 #This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



articles = Article.create([{ title: "Calling a function of a module by using it's name (a string)", language: 'en', topic: 'Programming', content: "What is the best way to go about calling a function given a string with the function's name in a Python program. For example, let's say that I have a module foo, and I have a string whose contents are \"bar\". What is the best way to go about calling foo.bar()?", original_language: "en"},
                          { title: "How can I rename a database column in a Ruby on Rails migration?",  language: 'en', topic: 'Programming', content: "xxx", original_language: "en"}]),


questions = Question.create([{ title: "How can I do that?", content: "The problem that I have is that I don't understand how to do that.", likes: 5, dislikes: 1, article_id: 1},
                          { title: "Help?", content: "Me too, that's exactly the problem that I have", likes: 1, dislikes: 10, article_id: 1}]),
answers = Answer.create([{ title: "Just do it the way it is explained", content: "You just need to solve the problem by understanding how to do that, go for it!", likes: 5, dislikes: 1, question_id: 1},
                          { title: "Right", content: "Altough I'm answering literally the same thing, I'm agree that you need to understand what you're not understanding currently.", likes: 1, dislikes: 10, question_id: 1}])
