require 'socket'
require './Bot'

class BomberBot
    def initialize
        begin
            self.conectar("bot2", "533b7eb8dd3caa2805000005")
            self.controlConexion()
        rescue StandardError => e
            puts e
        end
    end

    def conectar user, token
        @socket_cliente =TCPSocket::new('192.168.243.210', 5000)
        bienvenida = @socket_cliente.recv(1279)
        puts bienvenida
        @socket_cliente.puts(user + "," + token)
        @conectado = true
    end

    def controlConexion
        response = nil
        while @conectado do
            puts "turno"

            server_message = @socket_cliente.recv(511)
            
            message = server_message.split(";")

            if message[0] == "EMPEZO"
                bot = Bot.new(message[2][0])
                bot.update_map(message[1])
            elsif message[0] == "TURNO"
                puts "turno: " + message[1]
                bot.update_map message[2]
                msg = bot.move
                @socket_cliente.puts(msg)
            elsif message[0] == "PERDIO"
                puts "perdi :("
            end
        end
    end
end

bot = BomberBot.new
