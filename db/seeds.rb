# Criação de 10 usuários
users = 10.times.map do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    name: "Usuário #{i + 1}",
    address: "Rua #{i + 1}, Condomínio Lírios II"
  )
end

# Lista de categorias e serviços corretos para cada área
services_data = {
  "Manutenção Residencial" => [
    { title: "Reparo de Encanação", description: "Serviço de reparo de encanamentos, vazamentos e entupimentos" },
    { title: "Reparo Elétrico", description: "Instalação e conserto de fiação e equipamentos elétricos" }
  ],
  "Serviços Domésticos" => [
    { title: "Limpeza Residencial", description: "Limpeza de casas e apartamentos, incluindo áreas externas" },
    { title: "Lavanderia", description: "Lavagem e passagem de roupas" }
  ],
  "Educação e Tutoria" => [
    { title: "Aulas de Matemática", description: "Aulas particulares de matemática para ensino fundamental e médio" },
    { title: "Aulas de Inglês", description: "Aulas de inglês focadas em conversação e gramática" }
  ],
  "Cuidados Pessoais" => [
    { title: "Corte de Cabelo", description: "Corte de cabelo para homens, mulheres e crianças" },
    { title: "Manicure e Pedicure", description: "Serviços de manicure e pedicure com foco em cuidados estéticos" }
  ],
  "Culinária e Alimentação" => [
    { title: "Marmitas Saudáveis", description: "Preparo de marmitas saudáveis sob encomenda" },
    { title: "Confeitaria", description: "Bolos e doces para festas e eventos" }
  ],
  "Jardinagem e Paisagismo" => [
    { title: "Manutenção de Jardins", description: "Corte de grama e cuidados com plantas" },
    { title: "Paisagismo", description: "Planejamento e execução de projetos de paisagismo" }
  ],
  "Transporte e Entrega" => [
    { title: "Entrega de Documentos", description: "Serviço rápido de entrega de documentos e pequenos pacotes" },
    { title: "Mudanças", description: "Serviço de transporte e mudanças residenciais" }
  ],
  "Fitness e Bem-Estar" => [
    { title: "Personal Trainer", description: "Acompanhamento personalizado para treinos de musculação e cardio" },
    { title: "Aulas de Yoga", description: "Aulas de yoga focadas em relaxamento e flexibilidade" }
  ]
}

# Criação de 2 serviços para cada usuário, garantindo que cada serviço corresponda à sua categoria correta
users.each_with_index do |user, index|
  # Selecionar duas categorias aleatórias para cada usuário
  selected_categories = services_data.keys.sample(2)

  selected_categories.each do |category|
    # Pegar os serviços correspondentes à categoria
    services_data[category].each do |service_data|
      Service.create!(
        title: service_data[:title],
        description: service_data[:description],
        category: category,
        user: user
      )
    end
  end
end

# Criação de trocas entre usuários
users.each_with_index do |user, i|
  requester = user
  owner = users[(i + 1) % users.size] # Usuário seguinte na lista

  service_offered = requester.services.first
  service_requested = owner.services.last

  Exchange.create!(
    requester: requester,
    owner: owner,
    service_offered: service_offered,
    service_requested: service_requested,
    status: "accepted",
    description: "Troca de #{service_offered.title} por #{service_requested.title} entre #{requester.name} e #{owner.name}"
  )
end

puts "Seed finalizado com sucesso! Criados 10 usuários, cada um com 2 serviços coerentes e trocas realizadas entre eles."
