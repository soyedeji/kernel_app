class RemoveDescriptionFromBreeds < ActiveRecord::Migration[7.2]
  def change
    remove_column :breeds, :description, :text
  end
end
