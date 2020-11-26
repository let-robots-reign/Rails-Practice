class CreateFactorialAlgos < ActiveRecord::Migration[6.0]
  def change
    create_table :factorial_algos do |t|
      t.integer :max_n
      t.text :result

      t.timestamps
    end
  end
end
