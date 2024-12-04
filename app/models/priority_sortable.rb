module PrioritySortable
    extend ActiveSupport::Concern

    included do
      before_save :set_default_priority
    end

    PRIORITY_SCORES = {
      "High" => 3,
      "Medium" => 2,
      "Low" => 1
    }.freeze

    def set_default_priority
      self.priority ||= "Medium"
    end

    def urgency_score
      PRIORITY_SCORES[priority] || 0
    end

    module ClassMethods
      def sort_by_priority(custom_logic = nil)
        all.sort_by do |todo|
          custom_logic ? custom_logic.call(todo) : -todo.urgency_score
        end
      end
    end
end
