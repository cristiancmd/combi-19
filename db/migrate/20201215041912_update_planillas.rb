class UpdatePlanillas < ActiveRecord::Migration[6.0]
  def change
  	change_table :planillas do |t|
	  	t.belongs_to :user, foreign_key: {to_table: :users}
	    t.change :ext14, :boolean
	    t.change :cont14, :boolean
	    t.change :sintomas, :boolean
	    t.change :fiebre, :boolean
	    t.change :garganta, :boolean
	    t.change :hipt, :boolean
	    t.change :eResp, :boolean
	    t.change :diabetes, :boolean
	    t.change :inmDep, :boolean
	    t.change :corazon, :boolean
	    t.change :hijos, :boolean
	    t.change :embarazada, :boolean
	    t.change :cFiebre, :boolean

	  end
  end
end
 