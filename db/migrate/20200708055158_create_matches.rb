class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
    	t.string :name
    	t.string :status, default: 'not started'
    	t.string :winner
    	t.text :teams

      t.timestamps
    end
  end
end
