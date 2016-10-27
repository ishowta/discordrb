require 'webrick'

module Discordrb::Light
  # A utility class that provides a local HTTP server to act as a redirect URI
  # in OAuth2 applications. Useful for RPC, or when you're making a script that
  # wants to do a simple OAuth2-style request in a zeroconf manner.
  class OAuth2Server
    # Creates a new OAuth2 server, without any startup or running being done.
    # @param port [Integer] The port to listen on.
    # @param path [String] The endpoint path to listen on.
    def initialize(port, path = '/')
      @port = port
      @path = path
      @server = WEBrick::HTTPServer.new(Port: port)

      register_endpoint
    end

    # Starts the server, blocking the current thread, without doing any waiting
    # for responses.
    def start
      @server.start
    end

    private

    def register_endpoint
      @server.mount_proc @path do |req, res|
      end
    end
  end
end
