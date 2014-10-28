require 'openssl'

class ReqFile
  attr_accessor :filename, :sections

  def initialize(filename)
    @sections = []
    @filename = filename
  end

  def parse
    @in_section = false
    File.open(filename).each_line do |line|
      next if line =~ /^#?\s*$/ #skip comments and blank lines
      if line.start_with? "["
        if not @in_section
          @section = Section.new
          @sections << @section
        end
        @in_section = true
        key, value = line.match(/\[(.*?)\s?=\s?(.*?)\]/).captures rescue nil
        @section.parameters.store(key, value) unless key.nil?
      else
        @in_section = false
        key, value = line.match(/(\w+) ?= ?(\d+)/).captures rescue nil
        @section.cases.store(key, value) unless key.nil?
      end
    end
    @sections << @section
  end
end

class Section
  attr_accessor :parameters, :cases

  def initialize
    @parameters = {}
    @cases = {}
  end
end

if __FILE__ == $0
    t = ReqFile.new('gcmdecrypt128.req')
    t.parse
    t.sections.each do |s|
        puts s.parameters
        puts s.cases
    end
end
