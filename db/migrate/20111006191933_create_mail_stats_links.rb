class CreateMailStatsLinks < ActiveRecord::Migration
  def change
    create_table :mail_stats_links do |t|
      t.string :url, :null => false
      t.integer :visits, :default => 0, :null => false

      t.timestamps
    end
  end
end
