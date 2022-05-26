class CategoryNameToUnique < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up {
        add_index :categories, :name, :unique => true
      }

      dir.down {
        remove_index :categories, :name
      }
    end
  end
end
