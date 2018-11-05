require_relative 'repl'

class Main
  def self.run()
    puts 'Running Main'
    puts 'Interactive Proto Ruby'

    Repl.new.start
  end
end

Main.run
