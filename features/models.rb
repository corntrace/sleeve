class Code < ActiveRecord::Base
end

class CodeGroup < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

class User
  attr_accessor :username
end

class HotDog
  attr_accessor :price
end