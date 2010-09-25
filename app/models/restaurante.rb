class Restaurante < ActiveRecord::Base
  has_many :qualificacoes
  has_and_belongs_to_many :pratos
  has_many :comentarios, :as => :comentavel

  validates_presence_of :nome, :message => "deve ser preenchido"
  validates_presence_of :endereco, :message => "deve ser preenchido"
  validates_presence_of :especialidade, :message => "deve ser preenchido"
  
  validates_uniqueness_of :nome, :message => "deve ser único"
  validates_uniqueness_of :endereco, :message => "deve ser único"


  validate :primeira_letra_deve_ser_maiuscula



    def nome_com_especialidade
      "#{nome} - #{especialidade}"
    end

  private
  def primeira_letra_deve_ser_maiuscula
    errors.add("nome", "primeira letra deve ser maiuscula") unless nome =~ /[A-Z].*/
  end
  
end
