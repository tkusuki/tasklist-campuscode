require_relative 'tarefa'

# Criar sua classe tarefa - ok
# Replicar todos os comportamentos do codigo atual pra classe tarefas
# Fazer os métodos to_s e include? (include diz se existe o texto ou não, usar na busca) - ok

# BONUS: ao criar tarefa, perguntar se a tarefa ja foi realizada e usar o parâmetro opcional no initialize - ok

# BONUS 2: dentro de to_s, exibir feita sim ou nao, ao invés de true ou false. - ok
# DICA: operador ternário

# Mensagem de boas vindas
puts('Bem-vindo ao Task List!')

# Constantes do MENU
INSERIR_TAREFA = 1
VER_TAREFAS = 2
BUSCAR_TAREFA = 3
MARCAR_FEITA = 4
SAIR = 0

# Exibir opções para o usuário
def menu()
  puts()
  puts('########## MENU ##########')
  puts("# #{INSERIR_TAREFA} - Inserir uma tarefa")
  puts("# #{VER_TAREFAS} - Ver todas as tarefas")
  puts("# #{BUSCAR_TAREFA} - Buscar uma tarefa")
  puts("# #{MARCAR_FEITA} - Marcar como feita")

  puts("# 0 - Sair\n\n")
  print('Escolha uma opção: ')
  gets().to_i()
end

def imprime_tarefas(tarefas)
  tarefas.each do |tarefa|
    puts tarefa
  end
end

opcao_escolhida = menu()
tarefas = []
id_tarefa = 1

while(opcao_escolhida != SAIR) do
  if(opcao_escolhida == INSERIR_TAREFA)
    # Código para inserir uma tarefa
    puts()
    print('Insira uma tarefa: ')
    descricao_tarefa = gets().chomp()

    print('Tarefa já foi realizada? (Digite 1 - SIM | 2 - NÃO): ')
    tarefa_realizada = gets().to_i()

    if(tarefa_realizada == 1)
      tarefa = Tarefa.new(id_tarefa, descricao_tarefa, true)
      tarefas << tarefa
    else
      tarefa = Tarefa.new(id_tarefa, descricao_tarefa)
      tarefas << tarefa
    end
    puts("Tarefa incluída: #{ descricao_tarefa }")
    id_tarefa = id_tarefa.next

  elsif(opcao_escolhida == VER_TAREFAS)
    # Código para exibir todas as tarefas
    puts("\nListando todas as tarefas inseridas: ")
      imprime_tarefas(tarefas)

  elsif(opcao_escolhida == BUSCAR_TAREFA)
    # Código para buscar uma tarefa
    puts()
    print('Digite a tarefa que deseja buscar: ')
    texto_busca_tarefa = gets().chomp()

    tarefas_encontradas = tarefas.select do |tarefa|
      tarefa.include?(texto_busca_tarefa)
    end

    puts("\n#{tarefas_encontradas.length} tarefas encontradas")
    imprime_tarefas(tarefas_encontradas)

  elsif(opcao_escolhida == MARCAR_FEITA)

    imprime_tarefas(tarefas)
    print("\nInforme o número da tarefa que deseja marcar como feita: ")
    id_marcar_tarefa = gets().to_i()
    achou_tarefa = false

    tarefas.each do |tarefa|
      if(tarefa.id == id_marcar_tarefa)
        achou_tarefa = true
        tarefa.marcar_feita()
        imprime_tarefas(tarefas)
        puts("\nTarefa marcada com sucesso!")
      end
    end

    if(!achou_tarefa)
      puts("\nNenhuma tarefa encontrada")

  else
    puts('Opção inválida!')
  end
  opcao_escolhida = menu()
end

puts('Hasta la vista!')
