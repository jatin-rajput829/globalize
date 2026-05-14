module Globalize
  module AttributeMethods
    module Serialization
      def serialize(attr_name, **options)
        if respond_to?(:globalize_serialized_attributes) &&
           respond_to?(:globalize_serialized_attributes=)

          self.globalize_serialized_attributes ||= {}

          self.globalize_serialized_attributes =
            globalize_serialized_attributes.dup

          self.globalize_serialized_attributes[attr_name] = options
        end

        super(attr_name, **options)
      end
    end
  end
end

ActiveRecord::AttributeMethods::Serialization::ClassMethods.prepend(
  Globalize::AttributeMethods::Serialization
)
