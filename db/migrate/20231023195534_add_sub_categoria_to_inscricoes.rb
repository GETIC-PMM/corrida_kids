class AddSubCategoriaToInscricoes < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :sub_categoria, :string
  end
end
