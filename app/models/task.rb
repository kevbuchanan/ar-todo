class Task < ActiveRecord::Base
  belongs_to :list

  def complete
    self.update_attribute(:status , "complete")  
  end
end
