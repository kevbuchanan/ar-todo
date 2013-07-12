class List < ActiveRecord::Base
  has_many :tasks
  validates :name, uniqueness: true

  def add_task(description)
    Task.create(lists_id: self.id, description: description, status: 'not complete')
  end

  def delete_task
  end
end
