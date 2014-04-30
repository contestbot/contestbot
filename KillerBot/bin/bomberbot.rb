require 'socket'
require './bot'

class BomberBot
    def initialize
        begin
           ## self.conectar("Killerbot", "533b7f08dd3caa2805000009")
            ##self.controlConexion()
          mapa ="X,X,X,X,X,X,X,X,X,X,X\n X,_,A,C,_,D,_,_,#,_,X\n X,_,_,_,X,_,X,#,#,#,X\n X,B,_,2,L,L,_,_,#,_,X\n X,_,X,L,X,L,X,_,X,_,X\n X,_,V,L,L,L,L,_,L,_,X\n X,_,X,L,X,L,X,L,X,_,X\n X,_,P,L,L,L,L,L,L,_,X\n X,_,L,L,X,L,X,L,L,_,X\n X,_,_,_,_,_,_,_,_,_,X\n X,X,X,X,X,X,X,X,X,X,X;A;\r\n"
          bot = Bot.new("A")
          bot.update_map(mapa)
          msg = bot.move
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
            'puts server_message'
            message = server_message.split(";")
            'puts message'
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
                @conectado=false
            end
        end
    end
end

bot = BomberBot.new
