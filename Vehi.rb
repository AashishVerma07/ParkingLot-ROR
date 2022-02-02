class Vehi
    attr_accessor :id, :regno, :size, :amount, :in
    def initialize(regno,id)
        @id=id
        @regno=regno
        @size=0
        @amount=0
        @in=1
    end
    def to_s
        "ID : #{@id} Reg.No : #{@regno} Size : #{@size} Amount : #{@amount} In/Out : #{@in}"
    end
  end
class Byke < Vehi
    attr_accessor :id, :regno, :size, :amount, :in
    
    def initialize(regno,id)
        @id=id
        @regno=regno
        @size=1
        @amount=1
        @in=1
    end
  end
  
class Car < Vehi
    attr_accessor :id, :regno, :size, :amount, :in
    def initialize(regno,id)
        @id=id
        @regno=regno
        @size=2
        @amount=2
        @in=1
    end
  end
  
class Truck < Vehi
    attr_accessor :id, :regno, :size, :amount, :in
    def initialize(regno,id)
        @id=id
        @regno=regno
        @size=4
        @amount=4
        @in=1
    end
  end
  