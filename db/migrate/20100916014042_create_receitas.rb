class CreateReceitas < ActiveRecord::Migration
  def self.up
    create_table :receitas do |t|

      t.text :conteudo

      t.timestamps
    end
  end

  def self.down
    drop_table :receitas
  end
end
