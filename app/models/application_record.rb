class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    def evaluate_result(input, message)
      if (input.length == 0) or (input == nil)
          return "N/A #{message}" 
      else
          return input
      end
    end
end
