class AddLinkedinToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :linkedin, :string
  end
end
