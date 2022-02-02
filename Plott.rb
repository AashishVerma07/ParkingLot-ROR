require_relative "Vehi.rb"
class Plot
    def initialize()
        @arr=Array.new()
        @arrremove=Array.new()
        @id=0
        @total_size=20
        @tot_amount=0
        @occupied_size=0
    end
  
    def get_id()
        @id=@id+1
        return @id
    end
  
    def vehicle_type()
        puts("1:Byke\n2:Car\n3:Truck\n4:Main Manu\nx:Exit")
        vtype=gets.chomp()
        return vtype
    end
  
    def calculate_size_amount()
        @tot_amount=0
        @occupied_size=0
        @arr.each{|x|
         if(x.in==1)
            @occupied_size=@occupied_size+x.size.to_i
         else
            @tot_amount=@tot_amount+x.amount.to_i 
        end
        }
    end
  
    def vehicle_out(regno)
        @arr.each{|x|
         if(x.regno==regno)
            x.in=0
         end
        }
    end
  
    def vehicle_in(id,vtype,regno)
        case vtype
        when "1"
            @arr.push(Byke.new(regno,id))
        when "2"
            @arr.push(Car.new(regno,id))
        when "3"
            @arr.push(Truck.new(regno,id))
        when "4"
            mainmenu()
        when "x"
            exit
        else
            puts("Worng Option Selected")
        end
    end
  
    def getregno()
        puts("Enter Reg. No.")
        regno=gets.chomp()
        return regno
    end
  
    def printall()
        @arr.each{|x| puts(x.to_s)}
    end
  
    def mainmenu()
        calculate_size_amount()
        puts("Main Menu")
        puts("Size:"+@occupied_size.to_s+"/"+@total_size.to_s+"\nTotal Amount:"+@tot_amount.to_s)
        puts("1:IN\n2:OUT\n3:LIST\nx:EXIT")
        opt=gets.chomp()
        case opt 
        when "1"
            vehicle_in(get_id(),vehicle_type(),getregno())
        when "2"
            vehicle_out(getregno())
        when "3"
            printall()
        when "x"
            exit
        else
            puts("Wrong Option Selected")
        end
        mainmenu()
    end
  end
  
  while(1)
    p=Plot.new()
    p.mainmenu()
  end