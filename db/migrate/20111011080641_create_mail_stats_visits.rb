class CreateMailStatsVisits < ActiveRecord::Migration
  def change
    create_table :mail_stats_visits do |t|
      t.references :user
      t.references :visitable, :polymorphic => true	
      t.timestamps
    end
  end
end
