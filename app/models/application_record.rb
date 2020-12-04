class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def class_to_s
    self.class.to_s.downcase
  end
end
