module Globalize
  module AttributeMethods
    module Serialization
      def serialize(attr_name, class_name_or_coder = nil, **options)
        if respond_to?(:globalize_serialized_attributes) &&
           respond_to?(:globalize_serialized_attributes=)

          self.globalize_serialized_attributes ||= {}

          self.globalize_serialized_attributes =
            globalize_serialized_attributes.dup

          self.globalize_serialized_attributes[attr_name] = {
            coder: class_name_or_coder
          }.merge(options)
        end

        if class_name_or_coder
          super(attr_name, class_name_or_coder, **options)
        else
          super(attr_name, **options)
        end
      end
    end
  end
end

ActiveRecord::AttributeMethods::Serialization::ClassMethods.prepend(
  Globalize::AttributeMethods::Serialization
)
