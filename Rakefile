require "rubygems"
require "open-uri"

desc "Build the app"
task :build do
  system "middleman build"
  system "rm -f build/app.zip"
  system "cd build ; zip -r app.zip *"
end

desc "Deploy the app to gh-pages"
task :deploy do
  system "git push origin --delete gh-pages"
  system "git subtree push --prefix build origin gh-pages"
  data = `git remote -v | grep push`.split(':').last.split('.').first.split('/')
  puts "https://#{data.first.downcase}.github.io/#{data.last}/"
end
