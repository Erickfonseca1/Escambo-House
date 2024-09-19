# db/seeds.rb

# Desabilitar temporariamente as chaves estrangeiras para limpar os dados
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")

# Limpando os dados antigos
Exchange.destroy_all
Service.destroy_all
User.destroy_all

# # Reativar as chaves estrangeiras
# ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")

# # Criando usuários
# user1 = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
# user2 = User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password', admin: false)

# # Criando serviços para cada usuário
# service1 = Service.create!(title: 'Serviço de Eletricista', description: 'Serviço completo de eletricista.', user: user1)
# service2 = Service.create!(title: 'Bolos e Tortas', description: 'Deliciosos bolos e tortas caseiras.', user: user2)

# # Criando uma troca (exchange) pendente
# Exchange.create!(owner: user1, requester: user2, service_offered: service2, service_requested: service1, status: 'pending')

# puts "Seed finalizado com sucesso. Criados #{User.count} usuários, #{Service.count} serviços, e #{Exchange.count} trocas."
