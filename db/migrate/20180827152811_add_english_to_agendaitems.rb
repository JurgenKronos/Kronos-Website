class AddEnglishToAgendaitems < ActiveRecord::Migration[4.2]
  def change
	add_column :agendaitems, :name_en, :string, :default => "Agenda item"
	add_column :agendaitems,  :description_en,  :text, :default => "English description not yet available"
  end
end
