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

def a_researcher(email: 'andy@example.com')
  User.find_by(email: email);
end

def a_tracker_user(email: 'andrew@bugcrowd.com')
  TrackerUser.find_by(email: email);
end

begin
  spec = Gem::Specification.find_all_by_name('awesome_print').first

#  $LOAD_PATH << "#{spec.full_gem_path}/lib"
  #$LOAD_PATH << "/Users/amcnamara/.gem/ruby/2.3.6/gems/awesome_print-1.8.0/lib"
  require "rubygems"
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end

Pry.config.commands.command 'pbcopy', 'Copy input to clipboard' do |input|
  input = input ? target.eval(input) : _pry_.last_result
  IO.popen('pbcopy', 'w') { |io| io << input }
end

Pry.config.commands.command 'html-view', 'Write input to and html file and open it' do |input|
  input = input ? target.eval(input) : _pry_.last_result

  require 'tempfile'
  file = Tempfile.new(['pry-result', '.html'])
  begin
    file.write(input)
    file.rewind
    `open #{file.path}`
  ensure
    file.unlink
  end
end
