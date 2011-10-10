class CreateMailStatsPixels < ActiveRecord::Migration
  def change
    create_table :mail_stats_pixels do |t|
      t.integer :visits, :default => 0, :null => false
      
      t.timestamps
    end
  end
end
