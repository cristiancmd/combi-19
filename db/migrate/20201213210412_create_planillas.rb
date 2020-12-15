class CreatePlanillas < ActiveRecord::Migration[6.0]
  def change
    create_table :planillas do |t|
      t.float :temp
      t.string :ext14
      t.string :cont14
      t.string :sintomas
      t.string :fiebre
      t.string :garganta
      t.string :hipt
      t.string :eResp
      t.string :diabetes
      t.string :inmDep
      t.string :corazon
      t.string :hijos
      t.string :embarazada
      t.string :cFiebre

      t.timestamps
    end
  end
end
