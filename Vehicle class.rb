require_relative "fileio.rb"
class Config                 #Size and ammount of vehicle

  @@fileName=Time.now.strftime("%d-%m-%y")
  @@config=Config.new()
  @@db=FileReadWrite.new()
  @@db.CreateFile()

  def showStatus()
        puts("Total Size : " + @@config.Total_Size().to_s+"\n\n")
        puts("Occupy Size : "+@@size.to_s+"\n\n")
        puts("Amount Received : "+@@amt.to_s+"\n\n""Size Available : "+(@@config.Total_Size().to_i-@@size.to_i).to_s+"\n\n")
  end

  def Total_Size()
    return 20
  end
  def size_Bike()
    return "1"
  end
  def size_Car()
    return "2"
  end
  def size_Truck()
    return "4"
  end
  def amount_Bike()
    return "1"
  end
  def amount_Car()
    return "2"
  end
  def amount_Truck()
     return "4"
  end

  def ToIn(size,amount,regno)          #when vehicle in
    @@db.WriteOnFile(size.to_s+","+amount.to_s+","+regno+",1")   #in string formate
  end

  def AvailableSize(vehicleSize)          #show how many vehicles parked
    return (@@config.Total_Size - @@size)/(vehicleSize.to_i)
  end

  def CheckSpaceAvailable(sz)           # sz is incoming IN vehicle size
    totsize=@@config.Total_Size()       #method call line 21 in config class
    if(@@size + sz.to_i > totsize)
      return 0
    else
      return 1
    end
  end

  def GetTotalAmount()                # call when vehicle in or out
    totAmount=0
    totSizeFull=0
    myFile=File.open(@@fileName+".txt","r")
    while(line=myFile.gets)
      if(line.split(",")[3].gsub("\n","")=="0")    #.gsub iis use to replace.
        totAmount+=line.split(",")[1].to_i
      else
        totSizeFull+=line.split(",")[0].to_i
      end
    end
    return totAmount.to_s+","+totSizeFull.to_s   # Return ammount and empty space
  end

  def getAMTSIZE()
   @@amt_size= @@config.GetTotalAmount

    @@amt=@@amt_size.split(",")[0].to_i

    @@size=@@amt_size.split(",")[1].to_i

    @@str=@@db.GetAllFileAsString()
  end

  def vehicle_out()
      #showStatus()
      puts("Enter the Regno. =")
      d=gets.chomp
      if(@@str.index(d+",1\n")!=nil)
        @@str=@@str.gsub(d+",1\n",d+",0\n")
        @@db.WriteOnFile_Replace(@@str)
      else
        puts("Vehicle Not Found")
        d=gets.chomp
      end
  end

  def vehicle_in()           #select vehicle
  system"cls"             #clear screen
  showStatus()
  puts("Vehicle In\n")
  puts("Select Vehicle Type\n\n 1:Bike ("+AvailableSize(@@config.size_Bike).to_s+")\n\n 2:Car ("+AvailableSize(@@config.size_Car).to_s+")\n\n 3:Truck ("+AvailableSize(@@config.size_Truck).to_s+")\n\n 4:Main Menu")
  vtype=gets.chomp         #Get value
  if(vtype=="4")
    main_menu()
  else
    if(vtype=="1")
      if(CheckSpaceAvailable(@@config.size_Bike)==1)
        puts("Enter Regno. = ")
        regno=gets.chomp
        @@config.ToIn(@@config.size_Bike,@@config.amount_Bike, regno) #Data is called to another file
      else
        puts("Space Not Available for Bike")
        a=gets.chomp
      end
    elsif(vtype=="2")
      if(CheckSpaceAvailable(@@config.size_Car)==1)
        puts("Enter Regno. = ")
        regno=gets.chomp
        @@config.ToIn(@@config.size_Car,@@config.amount_Car,regno)
      else
        puts("Space Not Available for Car")
        a=gets.chomp
      end
    elsif(vtype=="3")
      if(CheckSpaceAvailable(@@config.size_Truck)==1)
        puts("Enter Regno. = ")
        regno=gets.chomp
        @@config.ToIn(@@config.size_Truck,@@config.amount_Truck,regno)
      else
        puts("Space Not Available for Truck")
        a=gets.chomp
      end
    else
      puts("Invalid Option")
      a=gets.chomp
  end
  end
  end

end
