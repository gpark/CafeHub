class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :spots
      t.integer :su_start
      t.integer :su_end
      t.integer :m_start
      t.integer :m_end
      t.integer :tu_start
      t.integer :tu_end
      t.integer :w_start
      t.integer :w_end
      t.integer :th_start
      t.integer :th_end
      t.integer :f_start
      t.integer :f_end
      t.integer :sa_start
      t.integer :sa_end
      t.text :comments

      t.timestamps null: false
    end
  end
end
