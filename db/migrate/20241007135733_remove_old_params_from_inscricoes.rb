class RemoveOldParamsFromInscricoes < ActiveRecord::Migration[7.0]
  def change
    remove_column :inscricoes, :prova
    remove_column :inscricoes, :sub_categoria
    remove_column :inscricoes, :entregar, :boolean
    remove_column :inscricoes, :nome
    remove_column :inscricoes, :email
    remove_column :inscricoes, :whatsapp
    remove_column :inscricoes, :matricula
    remove_column :inscricoes, :categoria
    remove_column :inscricoes, :tamanho_camisa
  end
end
