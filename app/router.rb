require 'cuba'
require 'cuba/contrib'

Cuba.use Rack::CommonLogger
Cuba.use Rack::Session::Cookie
Cuba.use Rack::Static, urls: ["/css", "/img", "/js"], root: root_path("public")

Cuba.plugin Cuba::Prelude
Cuba.plugin Cuba::Mote
Cuba.plugin Eskel::Cuba

Cuba.settings[:views] = root_path("app/views")

Dir[root_path('app/routes/*.rb')].each { |f| require f }

Cuba.define do
  on "home" do
    run Home
  end
  
  on default do
    redirect "/home"
  end
end