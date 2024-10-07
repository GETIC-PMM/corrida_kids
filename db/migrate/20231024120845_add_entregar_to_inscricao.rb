class AddEntregarToInscricao < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :entregar, :boolean, default: false
  end
end
