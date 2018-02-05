class Tarefa
  attr_reader :id, :feita
  # attr_reader :descricao
  attr_accessor :descricao

  def initialize(id, descricao, feita = false)
    @id = id
    @descricao = descricao
    @feita = feita
  end

  def marcar_feita()
    @feita = true
  end

  def to_s()
    "- Tarefa #{ id() } >> #{ descricao() } || Feita: #{ feita() }"
  end

  # def include?(texto_busca)
  #
  # end
end
