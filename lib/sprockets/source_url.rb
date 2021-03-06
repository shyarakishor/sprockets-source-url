require 'sprockets'
require 'tilt'

module Sprockets
  class SourceURL < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      code = ''
      code << 'eval('
      code << data.inspect
      code << " + \"\\n//@ sourceURL=/#{scope.logical_path}\""
      code << ");\n"
      code
    end
  end

  if defined?(register_postprocessor)
    register_postprocessor 'application/javascript', SourceURL
  end
end