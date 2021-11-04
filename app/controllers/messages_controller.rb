class MessagesController < ApplicationController

  # IF WE LOOK AT THE MESSAGE MODEL:
  # message belongs to user
  # message belongs to chatroom
  # WE NEED TO LINK THEM BOTH!
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    # link the chatroom to the message
    @message.chatroom = @chatroom
    # a message belongs to a user... so we need
    @message.user = current_user

    if @message.save
      # ANTES DE SALVAR, NOS PRECISAMOS SALVAR A MSG NO CANAL
      # broadcast to will send information to that channel
      ChatroomChannel.broadcast_to(
        # the isntance of the chatroom we wanna send the message to
        @chatroom,
        # se eu fizer isso aqui, qlqr um no canal consegue ver essa mensagem
        # no console assim q o gui me enviar uma mensagem.
        # PARA TESTAR NO CONSOLE SOMENTE!!
        # 'no action here, BUT YOU SEE ME IN THE CONSOLE'


        # ABOUT HTML
        # mas o que queremos é não é um simple string, é o HTML da mensagem
        # para que ele seja adicionado no nosso chat
        # a mensagem em si ainda não foi adicionada ao DOM mas agora ta facil
        # ja temos a msg e ao inves de console log essa msg nos vamos colocá-la no DOM
        render_to_string(partial: "message", locals: { message: @message })
      )
      # aqui a gnte coloca o anchor no caso de chegar ao ponto do
      # do chat encher de ensagens, a gente nao ter que subir pro
      # topo da pagina sempre  - esse message id aqui esta la no meu view
      # cada mensagem tem um id. entao acontece um match nos ids e 
      # a pagina scrolls pra onde o id da msg se econtra
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}") # which is the show page 
    else
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
