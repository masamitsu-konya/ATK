module ActiveSupport
  class SafeBuffer < String
    def normalize_parameters_with_force_encoding_to_utf8(value)
      case value
      when Hash, Array
      else
        value = value.force_encoding("UTF-8")
      end
      normalize_parameters_without_force_encoding_to_utf8(value)
    end
    alias_method_chain :normalize_parameters, :force_encoding_to_utf8
  end
end
