require 'rake/testtask'

Rake::TestTask.new do |t|
    t.pattern = "test/**/*_test.rb"
end

desc "A rake welcome message"
task :welcome do
  puts "Welcome to Rake tasks!"
end

task default: ["test", "welcome"]
