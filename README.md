# Mobvious-Rails

Mobvious extensions for Rails views, controllers and CoffeeScript

## Key Features

*   **Access detected device type easily from controllers and views.** Just write `device_type`.

*   **Execute code for given device types only.** Both in controllers and views.

        <%= for_device_type :mobile do %>
          <%= stylesheet_link_tag 'mobile_styles' %>
        <% end %>

*   **Do the above stuff also in your CoffeeScript.**

        alert 'You are using a ' + Mobvious.device_type + ' device.'
        
        Mobvious.for_device_type 'mobile', ->
          alert 'You are using a mobile device.'

## Get Started

1.  **Include modules to your controllers and helpers.** No sneaky monkey patching in Mobvious!
    
    Put this into your ApplicationController:

        include Mobvious::Rails::Controller
        
    And this into your ApplicationHelper:
    
        include Mobvious::Rails::Helper
        
2.  **Optionally, include also CoffeeScript helpers.**

    Put this into your layouts/application.html.erb:
     
        <head>
          <%= mobvious_javascript %>
          <!-- other code here -->
        </head>
         
    And this into your application.js:
    
        //= require mobvious-rails

**That's it! You can now use all the stuff.** See the
[documentation](http://rdoc.info/github/jistr/mobvious-rails/frames) if necessary.