class Todo < ActiveRecord::Base
  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.order_by_due_date
    order(:due_date)
  end

  def self.order_by_id
    order(:id)
  end

  def self.completed
    where(completed: true)
  end

  def self.add_task(h)
    create!(todo_text: h[:todo_text], due_date: (Date.today + h[:due_in_days]), completed: false)
  end

  def self.mark_as_complete(task_id)
    task = find(task_id)
    task.update(completed: true)
  end
end
