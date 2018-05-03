Pry.config.prompt = Pry::NAV_PROMPT

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end


## Useful Collections

def a_array
  (1..6).to_a
end

def a_hash
  {hello: "world", free: "of charge"}
end


begin
  spec = Gem::Specification.find_all_by_name('awesome_print').first

  #$LOAD_PATH << "#{spec.full_gem_path}/lib"
  $LOAD_PATH << "/Users/amcnamara/.gem/ruby/2.3.6/gems/awesome_print-1.8.0/lib"
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end
