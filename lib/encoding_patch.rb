
# -*- coding:utf-8 -*-
module ActionController
  class Request
    private
      def normalize_parameters_with_force_encoding(value)
        (_value = normalize_parameters_without_force_encoding(value)).respond_to?(:force_encoding) ? 
          _value.force_encoding(Encoding::UTF_8) : _value
       end
       alias_method_chain :normalize_parameters, :force_encoding
   end
end
