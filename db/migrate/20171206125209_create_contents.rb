class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.text :content
      t.references :blog

      t.timestamps
    end
  end
end
