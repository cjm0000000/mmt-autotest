module MMT
  module HTML
    module Node
      #HTML base element.
      class Element
          include Capybara::DSL
          attr_accessor :id, :name, :value
        def initialize(id, name, value)
          self.id = id
          self.name = name
          self.value = value
        end

        #  refresh element with the current config
        #  e.g.
        #  text = Text('username','username','admin');
        #  text.refresh It would set the <input type='text' name='username' value='admin' />
        def refresh
          raise NotImplementedError.new('I do not know how to refresh myself, please implement it in subclass.')
        end
      end
    end
  end
end

