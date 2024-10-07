class RemoveOldParamsFromInscricoes < ActiveRecord::Migration[7.0]
  def change
    remove_column :inscricoes, :prova, :string
    remove_column :inscricoes, :sub_categoria, :string
    remove_column :inscricoes, :entregar, :boolean
    remove_column :inscricoes, :nome, :string
    remove_column :inscricoes, :email, :string
    remove_column :inscricoes, :whatsapp, :string
    remove_column :inscricoes, :matricula, :string
    remove_column :inscricoes, :categoria, :string
    remove_column :inscricoes, :tamanho_camisa, :string
  end
end
