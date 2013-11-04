module MMT
  module HTML
    module Node
      class Checkbox < Element

        def refresh
          ArgumentError.new 'id and name is nil!' if (id.nil? && name.nil?)
          if id != nil
            check id if has_field? id
          else
            check name if has_field? name
          end
        end

      end
    end
  end
end
