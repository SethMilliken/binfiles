#!/usr/bin/env ruby
# Startup MacVim instances opened to appropriate locations

require 'optparse'
require 'pathname'

# Set Defaults
options = {}
options[:instance]  = Pathname.new("#{$0}").basename.to_s
options[:target]    = ARGV[0]

class Command
  attr_accessor :name, :description, :commandline, :background

  def initialize(name, description, commandline)
    @name = name
    @description = description
    @commandline = commandline
    @background = true
  end

  def to_s
    "#{@name} : #{@description} (#{@commandline} background: #{@background})"
  end

  def execute
    puts "#{self.commandline} &"
    exec("#{self.commandline} &")
  end
end
class CommandList
  @list

  def initialize()
    @list = {}
  end

  def insert(command)
    @list[command.name] = command
  end

  def commands()
    @list
  end

  def to_s
    @list.values do|command|
      command.to_s
    end
  end
end

# Define Commands
commandList = CommandList.new
commandList.insert(Command.new("tasks",     "Opens taskstack in Tasks instance of MacVim", "tvim ~/sandbox/work/janrain.tst.txt"))
commandList.insert(Command.new("work",      "Open personal taskstack.", "tvim ~/sandbox/personal/todo/personal.tst.txt"))
commandList.insert(Command.new("v",         "Open this script.", "svim ~/bin/vimstart.rb"))
commandList.insert(Command.new("vimrc",     "Open .vimrc.", "svim ~/.vimrc"))

# Parse Options
# TODO: Actually use --instance
optparse = OptionParser.new do|opts|
  opts.banner = "Usage: #{$0} [options] [ " + commandList.commands.keys.join(" | ") + " ]"
  opts.on( '-i', '--instance', '[ svim | mvim | cvim ]') do |instance|
    options[:instance] = instance
  end
  opts.on( '-h', '--help', 'display this help') do
    puts opts
    exit
  end
  opts.on( '-v', '--verbose', 'verbose output') do
#    commandList.verbose
  end
end

optparse.parse!

# Dispatch Command
command = commandList.commands[options[:target]]
if command.nil?
  exec("#{$0} --help")
else
  command.execute
end

# vim: set ts=2 sw=2:
