require 'sinatra/base'
class Main < Sinatra::Base
  helpers Sinatra::Partials
  
  configure do
    # configure compass
    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = File.join(Sinatra::Application.views, 'css')
      config.output_style = :compact
    end
        
    # Configure public directory
    set :public, File.join(File.dirname(__FILE__), 'public')

    # Configure default views
    set :views, File.dirname(__FILE__) + '/views'

    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :scss, Compass.sass_engine_options
    
  end
  
  get "/css/style.css" do
    content_type 'text/css', :charset => 'utf-8'
    scss :"css/style"
  end
  
  get '/' do
    haml :index
  end
end