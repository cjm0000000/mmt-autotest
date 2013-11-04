module MMT
  module HTML
    class Frame
      include Capybara::DSL
      def init_page
        page.driver.browser.switch_to.default_content
      end

      def visit_1st_level(frame)
        init_page
        sleep $timeout
        page.driver.browser.switch_to.frame frame
      end

      def visit_2nd_level(frame1,frame2)
        visit_1st_level frame1
        sleep $timeout
        page.driver.browser.switch_to.frame frame2
      end

      def visit_3rd_level(frame1,frame2,frame3)
        visit_2nd_level frame1,frame2
        sleep $timeout
        page.driver.browser.switch_to.frame frame3
      end
    end
  end
end
