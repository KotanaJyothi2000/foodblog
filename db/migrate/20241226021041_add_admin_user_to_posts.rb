class AddAdminUserToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :admin_user, null: true, foreign_key: true, default: nil
  end
end
