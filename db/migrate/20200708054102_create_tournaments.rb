class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
    	t.string :name
    	t.string :status, default: 'not started'
      t.timestamps
    end
  end
end
