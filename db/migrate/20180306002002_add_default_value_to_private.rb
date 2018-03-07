class AddDefaultValueToPrivate < ActiveRecord::Migration[5.1]
  def change
    change_column_default :lists, :private, from: nil, to: false
  end
end
