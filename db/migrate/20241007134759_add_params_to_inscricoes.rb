class AddParamsToInscricoes < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :nome_crianca, :string
    add_column :inscricoes, :data_nascimento_crianca, :date
    add_column :inscricoes, :cpf_crianca, :string
    add_column :inscricoes, :nome_responsavel, :string
    add_column :inscricoes, :cpf_responsavel, :string
    add_column :inscricoes, :telefone_contato, :string
  end
end
