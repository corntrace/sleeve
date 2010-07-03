module Sleeve
  
  
  def push_into_sleeve_pocket(obj, label='')
    @sleeve_pocket = @sp ||= SleevePocket.new
    @sp.push(obj, label)
  end
  
  def fetch_from_sleeve_pocket(label, obj=nil)
    @sleeve_pocket.fetch(label)
  end
  
end

class SleevePocket
  
  # attributes that we would try one by one on a model
  @@tries = [:title, :name, :username, :user_name, :email]
  
  def initialize
    @pocket = {}
  end
  
  def push(obj, label='')
    if label.blank?
      # need to guess the label
      @pocket[guess_the_label(obj)] = obj
    else
      @pocket[label] = obj
    end
  end
  
  def guess_the_label(obj)
    @@tries.each do |item|
      return obj.send(item) if obj.respond_to?(item)
    end
    raise "You have to pass a label to #{obj}"
  end
  
  # def build_and_push(type, label)
  #   @pocket[label] = type.classify.constantize.new
  # end
  # 
  def fetch(label)
    @pocket[label]
  end
end