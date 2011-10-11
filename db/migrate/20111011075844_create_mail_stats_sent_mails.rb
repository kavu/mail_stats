class CreateMailStatsSentMails < ActiveRecord::Migration
  def change
    create_table :mail_stats_sent_mails do |t|
      t.string :subject
      t.text :recipeints
      t.integer :recipients_count
      t.integer :mail_stats_links_count

      t.timestamps
    end
  end
end
