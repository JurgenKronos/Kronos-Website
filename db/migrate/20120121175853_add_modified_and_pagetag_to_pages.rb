class AddModifiedAndPagetagToPages < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :pagetag, :string
    remove_column(:pages, :modified_by)
    add_column :pages, :user_id, :integer
  end
end
