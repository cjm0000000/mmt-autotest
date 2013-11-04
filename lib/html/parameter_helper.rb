module MMT
  module HTML
    class ParamsHelper
      @params = nil

      def initialize
        @params = Hash.new
      end

      def set(key, value)
        @params[key] = value
      end

      def get(key)
        return @params[key]
      end

      def refresh_component
        @params.each_value { |value|
          if 'Mmt::Base::Node::Element' == value.class.superclass.to_s
            #refresh the component
            value.refresh
          end
        }
      end
    end
  end
end
