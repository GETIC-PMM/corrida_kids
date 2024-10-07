class ResetColunsToInscricao < SeedMigration::Migration
  def up
    ActiveRecord::Base.connection.execute("UPDATE inscricoes SET prova = NULL, sub_categoria = NULL, entregar = false");
  end

  def down

  end
end
