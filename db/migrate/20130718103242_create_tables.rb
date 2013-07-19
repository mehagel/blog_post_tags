class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.string :title
    t.string :body
    end 

    create_table :tags do |t|
      t.string :tag
    end

    create_table :posts_tags do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
  end
end
