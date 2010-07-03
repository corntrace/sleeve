db_config_file = File.expand_path( File.join(File.dirname(__FILE__), "..", "..", "config", "database.yml") )
config = YAML::load(IO.read(db_config_file))

ActiveRecord::Base.establish_connection(config["cucumber"])

ActiveRecord::Schema.define(:version => 0) do
  create_table :codes, :force => true do |t|
    t.string :title
    t.string :content
    t.integer :user_id
    t.integer :group_id
    t.datetime :created_at
    t.datetime :updated_at
  end
  create_table :code_groups, :force => true do |t|
    t.string :name
    t.string :user_id
    t.datetime :created_at
    t.database :updated_at
  end
  create_table :comments, :force => true do |t|
    t.string :title
    t.string :content
    t.string :commentable_type
    t.integer :commentable_id
  end
end