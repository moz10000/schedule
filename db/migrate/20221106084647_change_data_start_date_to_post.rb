class ChangeDataStartDateToPost < ActiveRecord::Migration[6.1]
  def chenge
    change_column :posts, :start_date, :date
  end
end
