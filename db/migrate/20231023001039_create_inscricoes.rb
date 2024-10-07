class CreateInscricoes < ActiveRecord::Migration[7.0]
  def change
    create_table :inscricoes, id: :uuid do |t|
      t.string :nome
      t.string :email
      t.string :whatsapp
      t.string :matricula
      t.string :categoria
      t.string :tamanho_camisa

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :inscricoes, :deleted_at
  end
end
