#!/usr/bin/env rake
#
require "bundler/gem_tasks"
options = ENV['TERM'] == 'dumb' ? '--no-color' : '--color'

# Enable ask when needed ...
#def ask prompt, allow
  #loop do
    #printf( "%s (%s):" % [prompt, "[#{allow.first}]#{allow[1..-1].join('/')}"])
    #answer = $stdin.gets
    #break answer.strip if allow.include?(answer.strip)
    #break allow.first if answer == "\n"
    #puts "Please answer #{allow.join('/')} or press Ctrl+C to abort"
  #end
#end


# Application Tasks
task :default => 'test'

desc 'Run all specs'
task :test do
  system "rspec -f p #{options} spec "
end

desc 'Build documentation'
task :doc do
  system 'yard'
end
