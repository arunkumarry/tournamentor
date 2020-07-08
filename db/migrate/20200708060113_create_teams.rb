class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
    	t.string :name
      t.integer :total_played, default: 0
      t.integer :won, default: 0
      t.integer :lost, default: 0
    	t.integer :for_runs, default: 0
    	t.integer :against_runs, default: 0
    	t.float :for_overs, default: 0
    	t.float :against_overs, default: 0

      t.timestamps
    end
  end
end
