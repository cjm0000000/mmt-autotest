module MMT
  module HTML
    module Node
      class Text < Element
        def refresh
          ArgumentError.new 'id and name is nil!' if (id.nil? && name.nil?)
          if id != nil
            fill_in id, :with => value if has_field? id
          else
            fill_in name, :with => value if has_field? name
          end
        end
      end
    end
  end
end