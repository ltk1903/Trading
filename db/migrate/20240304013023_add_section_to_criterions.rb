class AddSectionToCriterions < ActiveRecord::Migration[7.0]
  def change
    add_column :criterions, :section, :integer
  end
end
