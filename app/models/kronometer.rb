# == Schema Information
#
# Table name: kronometers
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  date              :date
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Kronometer < ApplicationRecord

  has_attached_file :file, :styles => { :thumb => ["260", :png] }
  do_not_validate_attachment_file_type :file
end
