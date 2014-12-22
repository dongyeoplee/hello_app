class AddAdminToUsers < ActiveRecord::Migration
  def change
  	# 'default: false'를 add_column에 추가했습니다. 이는 유저가 처음부터 뜬금 관리자가 되는걸 막기 위함입니다.
    add_column :users, :admin, :boolean, default: false
  end
end
