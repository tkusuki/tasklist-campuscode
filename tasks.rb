# Mensagem de boas vindas
puts('Bem-vindo ao Task List!')

# Exibir opções para o usuário
def menu()
  puts()
  puts('########## MENU ##########')
  puts('# 1 - Inserir uma tarefa')
  puts('# 2 - Ver todas as tarefas')
  puts('# 3 - Buscar uma tarefa')  # Receber um texto e procurar essa tarefa na lista
  puts('# 4 - Marcar como feita')  # Marcar uma tarefa como Feita

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
  if(opcao_escolhida == 1)
    # Código para inserir uma tarefa
    puts()
    print('# Insira uma tarefa: ')
    descricao_tarefa = gets().chomp()
    puts("\nTarefa incluída: #{ descricao_tarefa }") # interpolar strings
    tarefa = { id: id_tarefa, descricao: descricao_tarefa, feita: false }
    tarefas << tarefa
    id_tarefa = id_tarefa.next
  elsif(opcao_escolhida == 2)
    # Código para exibir todas as tarefas
    puts("\n# Listando todas as tarefas inseridas: ")
      imprime_tarefa(tarefas)

  elsif(opcao_escolhida == 3)
    # Código para buscar uma tarefa
    # pesquisem sobre o método select do array e tentem fazer a busca com select - ok
    # exibir uma mensagem no final dizendo quantas tarefas foram encontradas - ok

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

  elsif(opcao_escolhida == 4)
    # 1 imprimir todas tarefas, exibindo ID - OK
    # 2 perguntar qual tarefa quer marcar como feita (usando ID) - OK
    # 3 buscar a tarefa pelo ID e trocar o valor de feita para true
    # 4 atualizar a tarefa no array (ex: remover a tarefa do array e reinserir com o valor atualizado feita = true)
    # 5 imprimnir uma msg de sucesso

    imprime_tarefa(tarefas)
    print("\n# Informe o ID da tarefa que deseja marcar: ")
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
            tarefa_para_marcar = tarefa
          end
        end

        tarefas.delete_if do |tarefa|
          tarefa[:id] == id_marcar_tarefa
        end

        tarefas << tarefa_para_marcar
        tarefas.sort_by! { |hash| hash[:id] }
        imprime_tarefa(tarefas)
        puts("\nTarefa marcada com sucesso!")
        # puts "\nSucesso!Marcada"
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
