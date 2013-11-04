module MMT
  module HTML
    module Node
      class Radio < Element
        def refresh
          ArgumentError.new 'id and name is nil!' if (id.nil? && name.nil?)
          if id != nil
            choose id if has_field? id
          else
            find(:xpath, "//input[@type='radio'][@value='#{value}'][@name='#{name}']").set(true)
          end
        end
      end
    end
  end
end