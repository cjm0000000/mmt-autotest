module MMT
  module HTML
    module Node
      class Select < Element
        def refresh
          ArgumentError.new 'id and name is nil!' if (id.nil? && name.nil?)
          select value, :from => name if has_select? name
        end
      end
    end
  end
end