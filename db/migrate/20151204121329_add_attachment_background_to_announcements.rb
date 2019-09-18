class AddAttachmentBackgroundToAnnouncements < ActiveRecord::Migration[4.2]
  def self.up
    change_table :announcements do |t|
      t.attachment :background
    end
  end

  def self.down
    drop_attached_file :announcements, :background
  end
end
