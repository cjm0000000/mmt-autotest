module MMT
  module ToolKit
    module Util
      # Local IP Address
      @@LocalIPAddress = nil

      def self.alert_accept
        Capybara.current_session.driver.browser.switch_to.alert.accept
        sleep $timeout
      end

      def self.alert_dismiss
        Capybara.current_session.driver.browser.switch_to.alert.dismiss
        sleep $timeout
      end

      def self.get_alert_text
        alert = Capybara.current_session.driver.browser.switch_to.alert
        text = @alert.text
        alert.accept
        sleep $timeout
        return text
      end

      #----------------------------Disabled Element Matcher---------------------------------
      def self.have_disabled_button(locator)
        Capybara::RSpecMatchers::HaveSelector.new(:button, locator, :disabled => true)
      end

      def self.have_disabled_field(locator, options={})
        Capybara::RSpecMatchers::HaveSelector.new(:field, locator, options, :disabled => true)
      end

      def self.have_disabled_checked_field(locator)
        Capybara::RSpecMatchers::HaveSelector.new(:field, locator, :checked => true, :disabled => true)
      end

      def self.have_disabled_unchecked_field(locator)
        Capybara::RSpecMatchers::HaveSelector.new(:field, locator, :checked => false, :disabled => true)
      end

      #----------------------------Others---------------------------------
      # Go to the last page.
      def self.goto_last_page
        Capybara.current_session.driver.browser.switch_to.window(Capybara.current_session.driver.browser.window_handles.last)
      end

      # String escape(反转义)
      def self.unescape( src )
        String.class_eval(%Q("#{src}"))
      end

      #The random string length is 6.
      def self.get_unique_string
        require 'securerandom'
        SecureRandom.urlsafe_base64 4
      end

      # Get local ip address
      def self.getLoacalIPAddress
        if @@LocalIPAddress == nil
          @@LocalIPAddress = IPSocket.getaddress(Socket.gethostname).to_s
        end
        return @@LocalIPAddress
      end

    end
  end
end

