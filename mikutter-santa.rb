require 'date'

today = Date.today
if (Date.new(today.year, 12, 20)..Date.new(today.year, 12, 31)).cover?(today)
  class Skin
    class << self
      alias_method :__get_orig, :get

      def get(*args)
        if args[0] == 'icon.png'
          return File.expand_path("../icon.png", __FILE__)
        end
        return __get_orig(*args)
      end
    end
  end

  Plugin::GUI.ui_setting.each do |window_slug, panes|
    window = Plugin::GUI::Window.instance(window_slug,  Environment::NAME)
    window.set_icon File.expand_path(Skin.get('icon.png'))
  end
end
