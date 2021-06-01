class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_complete = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_complete}"
  end
end
