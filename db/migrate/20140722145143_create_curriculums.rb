class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|

      t.timestamps
    end
  end
end
