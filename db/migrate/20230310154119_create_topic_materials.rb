class CreateTopicMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_materials do |t|
      t.string :topic_name

      t.timestamps
    end
  end
end
