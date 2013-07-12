class List < ActiveRecord::Base
  has_many :tasks
  validates :name, uniqueness: true

  def add_task(description)
    Task.create(list_id: self.id, description: description, status: 'not complete')
  end
end
