require_relative 'tarefa'
# Mensagem de boas vindas
puts('Bem-vindo ao Task List!')

INSERIR_TAREFA = 1
VER_TAREFAS = 2
BUSCAR_TAREFA = 3
MARCAR_FEITA = 4

# Exibir opções para o usuário
def menu()
  puts()
  puts('########## MENU ##########')
  puts("# #{INSERIR_TAREFA} - Inserir uma tarefa")
  puts("# #{VER_TAREFAS} - Ver todas as tarefas")
  puts("# #{BUSCAR_TAREFA} - Buscar uma tarefa")
  puts("# #{MARCAR_FEITA} - Marcar como feita")

  puts("# 0 - Sair\n\n")
  print('> Escolha uma opção: ')
  gets().to_i()
end

def imprime_tarefa(tarefas)
  tarefas.each do |tarefa|
    puts("- ID: #{ tarefa[:id] } | #{ tarefa[:descricao] } | Feita: #{ tarefa[:feita] }")
  end
end

opcao_escolhida = menu()
tarefas = []
id_tarefa = 1

while(opcao_escolhida != 0) do
  if(opcao_escolhida == INSERIR_TAREFA)
    # Código para inserir uma tarefa
    puts()
    print('# Insira uma tarefa: ')
    descricao_tarefa = gets().chomp()
    puts("\nTarefa incluída: #{ descricao_tarefa }") # interpolar strings
    # tarefa = { id: id_tarefa, descricao: descricao_tarefa, feita: false }
    tarefa = Tarefa.new(id_tarefa, descricao_tarefa )
    tarefas << tarefa
    id_tarefa = id_tarefa.next
  elsif(opcao_escolhida == VER_TAREFAS)
    # Código para exibir todas as tarefas
    puts("\n# Listando todas as tarefas inseridas: ")
      imprime_tarefa(tarefas)

  elsif(opcao_escolhida == BUSCAR_TAREFA)
    # Código para buscar uma tarefa

    puts()
    print('# Digite a tarefa que deseja buscar: ')
    texto_busca_tarefa = gets().chomp()

    tarefas_encontradas = tarefas.select do |tarefa|
      tarefa[:descricao].upcase.include? texto_busca_tarefa.upcase
    end
    if(tarefas_encontradas.empty?)
      puts('Tarefa não encontrada!')
    else
      puts("\nTarefa encontrada:")
      imprime_tarefa(tarefas_encontradas)
    end
    puts("\nTotal de tarefas encontradas: #{tarefas_encontradas.length}")

  elsif(opcao_escolhida == MARCAR_FEITA)

    imprime_tarefa(tarefas)
    print("\n# Informe o ID da tarefa que deseja marcar como feita: ")
    id_marcar_tarefa = gets().to_i()

    tarefa_para_marcar = tarefas.select do |tarefa|
      tarefa[:id] == id_marcar_tarefa
    end

    if(!tarefa_para_marcar.empty?)
      imprime_tarefa(tarefa_para_marcar)
      puts("\nConfirma marcar a tarefa de ID #{id_marcar_tarefa} como feita?")
      print("Digite '1' para SIM ou '2' para NÃO: ")
      confirma_marcar_id = gets().to_i()

      if(confirma_marcar_id == 1)

        tarefas.each do |tarefa|
          if(tarefa[:id] == id_marcar_tarefa)
            tarefa[:feita] = true
            # tarefa_para_marcar = tarefa
          end
        end

        imprime_tarefa(tarefas)
        puts("\nTarefa marcada com sucesso!")

      else
        puts("\nTarefa não marcada!")
      end
    else
      puts("\nNenhuma tarefa encontrada com esse ID!")
    end

  else
    puts('Opção inválida!')
  end
  opcao_escolhida = menu()
end

puts('Hasta la vista!')
