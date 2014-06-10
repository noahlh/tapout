require 'tapout/reporters/turn_reporter'

module Tapout

  module Reporters
    
    class NlhReporter < TurnReporter #Reporter
      def fail(doc)
        message   = doc['exception']['message'].to_s
        backtrace = clean_backtrace(doc['exception']['backtrace'] || [])
        depth     = config.trace || backtrace.size

        puts(" #{FAIL}")
        puts message.ansi(:bold).tabto(8)
        puts(captured_output(doc).strip.tabto(8)) if captured_output?(doc)
        unless backtrace.empty?
          label = "Assertion at "
          tabsize = 8
          str = (label + backtrace.shift).tabto(tabsize)
          str << backtrace[0,depth].map{|l| l.tabto(label.length + tabsize) }.join("\n")
          #puts(backtrace1.tabto(tabsize))
          puts str.rstrip
          puts backtrace_snippets(doc).tabto(8)
        end
      end

      def error(doc)
        exception_class = doc['exception']['class'].to_s
        message         = doc['exception']['message'].to_s.ansi(:bold)

        backtrace       = clean_backtrace(doc['exception']['backtrace'] || [])
        depth           = config.trace || backtrace.size
        backtrace       = "Exception `#{exception_class}' at " + backtrace[0,depth].join("\n")

        puts("#{ERROR}")
        puts(message.tabto(8))
        puts(captured_output(doc).strip.tabto(8)) if captured_output?(doc)
        puts(backtrace.strip.tabto(8))
        puts backtrace_snippets(doc).tabto(8)
      end

    end

  end

end
