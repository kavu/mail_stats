class CreateMailStatsLinks < ActiveRecord::Migration
  def change
    create_table :mail_stats_links do |t|
      t.references :sent_mail
      t.string :url, :null => false
      t.integer :mail_stats_visits_count, :default => 0, :null => false
      t.timestamps
    end
  end
end
