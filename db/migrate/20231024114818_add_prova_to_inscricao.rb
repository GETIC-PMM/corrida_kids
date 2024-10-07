class AddProvaToInscricao < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :prova, :string
  end
end
