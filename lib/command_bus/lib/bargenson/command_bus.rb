module Bargenson
  class CommandBus
    class HandlerAlreadyDefinedError < StandardError
      def initialize(command_class)
        super("Handler already exists for command #{command_class.name}")
      end
    end

    class UnregisteredHandlerError < StandardError
      def initialize(command_class)
        super("Missing handler for command #{command_class.name}")
      end
    end

    def initialize
      @handlers = {}
    end

    def register(command_class, handler)
      raise HandlerAlreadyDefinedError.new(command_class) if @handlers[command_class]
      @handlers[command_class] = handler
    end

    def register_all(options)
      options.each do |command_class, handler|
        register(command_class, handler)
      end
    end

    def call(command)
      handler = @handlers.fetch(command.class) { raise UnregisteredHandlerError.new(command.class) }
      handler.is_a?(Proc) ? handler.call().(command) : handler.(command)
    end
  end
end
