require "rubygems"
require "open-uri"

desc "Build the app"
task :build do
  system "middleman build"
  system "rm -f build/app.zip"
  system "cd build ; zip -r app.zip *"
end
