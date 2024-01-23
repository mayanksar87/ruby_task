require 'rest-client'
require 'json'

class Todo
  API_BASE_URL = 'https://jsonplaceholder.typicode.com/todos/'.freeze
  MAX_TODO_COUNT = 20

  def self.fetch_todos

    MAX_TODO_COUNT.times do |index|
      todo_url = "#{API_BASE_URL}#{2 * (index + 1)}"
      response = RestClient.get(todo_url)

      if response.code == 200
        print_todos JSON.parse(response.body)
      else
        puts "Failed to fetch TODO at index #{index + 1}. Status code: #{response.code}"
      end
    end
  end

  def self.print_todos(todo)
    puts "Title: #{todo['title']}"
    puts "Completed: #{todo['completed'] ? 'Yes' : 'No'}"
    puts '-' * 30
  end
end

Todo.fetch_todos

