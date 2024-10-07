class AjusteNasColunasInscricao < ActiveRecord::Migration[7.0]
  def change
    change_column :inscricoes, :prova, :string
    change_column :inscricoes, :sub_categoria, :string
  end
end
