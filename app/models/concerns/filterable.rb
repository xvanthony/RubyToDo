module Filterable
    extend ActiveSupport::Concern
  
    module ClassMethods
      def filter_by_params(params)
        results = self.all
        params.each do |key, value|
          next unless self.column_names.include?(key.to_s)
          results = results.where(key => value)
        end
        results
      end
    end
  end
  