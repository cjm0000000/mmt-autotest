module MMT
  module HTML
    # An object used to cache some data.
    # implement with Array
    class CachedObject
      @objs = nil
      def initialize
        @objs = Array.new
      end

      def add(obj)
        @objs << obj
      end

      def add_all(objs)
        x = 0
        max = objs.size
        until x > max do
          add objs.at x
          x = x + 1
        end
      end

      def get(index)
        @objs.at(index - 1)
      end

      def get_all
        @objs.join(',')
      end

      def clear
        @objs.clear
      end

    end
  end
end


