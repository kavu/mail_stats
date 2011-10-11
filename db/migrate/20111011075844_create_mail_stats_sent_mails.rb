class CreateMailStatsSentMails < ActiveRecord::Migration
  def change
    create_table :mail_stats_sent_mails do |t|
      t.string :subject, :null => false
      t.text :recipients, :null => false
      t.integer :recipients_count, :default => 0, :null => false
      t.integer :links_count, :default => 0, :null => false
      t.timestamps
    end
  end
end
