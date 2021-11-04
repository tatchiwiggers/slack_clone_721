// consumer é nosso action cable do rails
import consumer from "./consumer";

// criamos uma função
const initChatroomCable = () => {
  // buscamos um container de mensagens -> ir no console
  // isso esta no nosso view e é assim que pegamos ele no console
  const messagesContainer = document.getElementById('messages');
  console.log('file is imported?');
  // aqui esse codigo so vai rodar se existir um messages container
  // lembra que por causa do turbolinks o JS roda em todas as paginas?
  // esse if é uma proteção se a pagina nao tiver id messages ela nao quebra

  // EM JS PESSOA É SEMPRE IMPORTANTE VERIFICAR SE NOSSO ELEMENTO EXISTE
  // CASO EXISTA, RODE O RESTANTE DO CODIGO, por isso do If.
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    // aqui o usuario se inscreve a um canal e aqui especificamos ql
    // ChatroomChannel é o nome da nossa classe e passamos o id
    // esse id aqui é o id que passamos no params do nosso chatroom channel
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // data é chamado quando informações são transmitidas
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

// Now we go to our views and look at the form

export { initChatroomCable };