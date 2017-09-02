module ActiveAdmin
  module Views
    class Header < Component

      def tag_name
        'nav'
      end

      def default_class_name
        'navbar navbar-expand-md navbar-dark bg-dark fixed-top'
      end

      def build(namespace, menu)
        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)
        
        a class: 'navbar-brand', href: @namespace.site_title_link do
          @namespace.site_title
        end

        button class: 'navbar-toggler', type: 'button', 'data-toggle': 'collapse', 'data-target': '#navbarsMain' do 
          span class: 'navbar-toggler-icon'
        end

        div class: 'collapse navbar-collapse', id: "navbarsMain" do
          build_global_navigation
          build_utility_navigation
        end
      end


      def build_site_title
        insert_tag view_factory.site_title, @namespace
      end

      def build_global_navigation
        insert_tag view_factory.global_navigation, @menu, class: 'navbar-nav mr-auto'
      end

      def build_utility_navigation
        insert_tag view_factory.utility_navigation, @utility_menu, class: 'navbar-nav justify-content-end'
      end

    end
  end
end
