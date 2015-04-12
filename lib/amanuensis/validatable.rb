module Amanuensis
  class ValidationError < StandardError

    def initialize(klass)
      @klass = klass
    end

    def message
      "Please make sure you correclty set all the required fields for #{@klass}, read the documentation here: http://alaibe.github.io/amanuensis/"
    end
  end

  module Validatable
    extend ActiveSupport::Concern

    module ClassMethods
      def validate_presence_of(*attributes)
        @attributes = attributes
      end

      def valid!
        valid = attributes.map do |attribute|
          config[attribute].present?
        end.all?

        raise ValidationError, self.name.demodulize if !valid
      end

      def attributes
        @attributes ||= []
      end
    end
  end
end
