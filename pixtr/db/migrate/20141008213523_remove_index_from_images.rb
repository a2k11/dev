class RemoveIndexFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :index, :string
  end
end
