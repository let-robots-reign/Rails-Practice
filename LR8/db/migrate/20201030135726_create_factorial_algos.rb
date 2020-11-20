class CreateFactorialAlgos < ActiveRecord::Migration[6.0]
  def change
    create_table :factorial_algos do |t|

      t.timestamps
    end
  end
end
