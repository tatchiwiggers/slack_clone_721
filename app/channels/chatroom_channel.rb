class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # primeira coisa a fazer, encontrar o canal em que estamos
    chatroom = Chatroom.find(params[:id])
    # aqui estamos streaming a uma instancia, o que significa que
    # cada instancia de chatroom vai ter seu proprio canal para 
    # transmitir mensagens
    stream_for chatroom # aqui é como se cada chatroom 
    # tivesse tem seu nome, ou identificador unico
    # uma outra opção é ter uma unico super canal geral e literalmente
    # passar o nome diretamente, no caso de vc ter somente um canal para
    # seu app por exemplo
    stream_for "general"
  end

  # def unsubscribed
  #   # isso significa quando alguem sai do canal - mas nao
  #   # vamos usar isso hoje
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
