// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// e aqui o channels carrega todos os arquivos dentro do folder channels
const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
