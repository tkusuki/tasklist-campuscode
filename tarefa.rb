class Tarefa
  def initialize(id, descricao)
    @id = id
    @descricao = descricao
    @feita = false
  end

  def id()
    @id
  end

  def descricao()
    @descricao
  end

  def feita()
    @feita
  end

  def descricao=(nova_descricao)
    @descricao = nova_descricao
  end

  def feita=(novo_valor)
    @feita = novo_valor
  end

  def marcar_feita()
    @feita = true

  end
end
