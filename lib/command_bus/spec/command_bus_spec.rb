require 'spec_helper'
require 'bargenson/command_bus'

module Bargenson
  RSpec.describe(CommandBus) do
    ::FooCommand = Class.new
    ::BarCommand = Class.new

    before(:each) do
      @command_bus = described_class.new
    end

    context 'when a handler is configured for a command type' do
      let(:command_handler_result) { 123 }
      let(:command_handler) { double(:handler, call: command_handler_result) }
      let(:command) { ::FooCommand.new }

      before(:each) do
        @command_bus.register(::FooCommand, command_handler)
      end

      describe '#register' do
        it 'raises an error when more than one handler are registered per command' do
          expect { @command_bus.register(::FooCommand, double(:other_handler, call: nil)) }
            .to(raise_error(CommandBus::HandlerAlreadyDefinedError))
        end
      end

      describe '#call' do
        it 'raises an error when the command type does not match' do
          expect { @command_bus.call(::BarCommand.new) }
            .to(raise_error(CommandBus::UnregisteredHandlerError))
        end

        it 'calls the handler when the command matches' do
          result = @command_bus.call(command)
          expect(result).to(equal(command_handler_result))
          expect(command_handler).to(have_received(:call).with(command))
        end
      end
    end

    context 'when a handler factory is configured for a command type' do
      class ::Handler; def call(_command); end; end
      let(:command) { ::FooCommand.new }

      before(:each) do
        @command_bus.register(::FooCommand, lambda { ::Handler.new })
      end

      describe '#call' do
        it 'calls the handler instanciated by the factory when the command matches' do
          expect(::Handler).to(receive(:new).once.and_call_original)
          @command_bus.call(command)
        end
      end
    end
  end
end
