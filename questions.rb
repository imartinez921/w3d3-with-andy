require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
include Singleton #modules go within the class definition
# should be INCLUDE with Class Name capitalized but not a string

  def initialize
    super('questions.db') #calling super to Database class initialize
    self.type_translation = true #matches output data types to schema structure
    self.results_as_hash = true #returns output as a hash
  end


end


class User
  attr_accessor :id, :fname, :lname
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        users
      WHERE 
        users.id = ?
      SQL
    data.map {|datum| User.new(datum)}
  end

  def initialize(data)
    @id = data['id']
    @fname = data['fname']
    @lname = data['lname']
  end
end


class Question 
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions
      WHERE 
        questions.id = ?
      SQL
    data.map {|datum| Question.new(datum)}  
  end

  def self.find_by_author_id(associated_author)
    data = QuestionsDatabase.instance.execute(<<-SQL, associated_author)
      SELECT
        *
      FROM 
        questions
      WHERE 
        associated_author = ?
      SQL
    data.map {|datum| Question.new(datum)}  
  end

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @body = data['body']
    @associated_author = data['associated_author']
  end


end



class Reply

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        replies
      WHERE 
        replies.id = ?
      SQL
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        replies
      WHERE 
        user_id = ?
      SQL
    data.map {|datum| Reply.new(datum)}  
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        replies
      WHERE 
        question_id = ?
      SQL
    data.map {|datum| Reply.new(datum)}  
  end


  def initialize(data)
    @id = data['id']
    @question_id = data['question_id']
    @parent_reply = data['parent_reply']
    @user_id = data['user_id']
    @body = data['body']
  end

end


class Question_Follow
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions_follows
      WHERE 
        questions_follows.id = ?
      SQL
    data.map {|datum| Question_Follow.new(datum)}
  end

  def initialize(data)
    @id = data['id']
    @user_id = data['user_id']
    @question_id = data['question_id']
  end

end


class Question_Like
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions_likes
      WHERE 
        questions_likes.id = ?
      SQL
    data.map {|datum| Question_Like.new(datum)}  end

  def initialize(data)
    @id = data['id']
    @user_id = data['user_id']
    @question_id = data['question_id']
  end
end
