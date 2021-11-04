class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# poderiamos fazer a mesma coisa e add has_many :messages no user mas no nosso app 
# nos nunca vamos conectar todas as mensagens de um usuario especifico - nesse app,
# nesse demo da aula, não precisamos disso, somente precisamos coletar todas as mensagens
# de um chatroom para mostra-las. como nao vamos utilizar has_many :users, nao vamos adicionar
# has_many :userss... lembrem-se sempre, de codar somente o necessário. 