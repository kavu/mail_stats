class CreateMailStatsPixels < ActiveRecord::Migration
  def change
    create_table :mail_stats_pixels do |t|
      t.references :sent_mail
      t.integer :visits_count, :default => 0, :null => false
      t.timestamps
    end
  end
end
