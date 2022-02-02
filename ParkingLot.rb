require_relative "fileio.rb" #Collection file
require_relative "Vehicle class.rb" #class file

class ParkingLot             #start
  @@config=Config.new()      #call config class
  @@db=FileReadWrite.new()   #Datebase class

  def lot_start()
    main_menu()

  end

  def main_menu()
  @@config.getAMTSIZE()       #method call line 28 in class parking lot

    system "cls"        #Clear screen

  @@config.showStatus()

    puts("-:Welcome To Spark 18's Parking Lot:-\n\n")

    puts("-:Main Menu:-\n\n1:IN\n\n2:OUT\n\n3:List Vehicles Inside\n\n4:List Vehicle Out\n\nx:Close")  #Starting application

   @@config.getAMTSIZE()

      opt=gets.chomp

      if opt=="1"

        @@config.vehicle_in()

      elsif opt=="2"

        @@config.vehicle_out()

      elsif opt=="3"

        system "cls"

        @@db.PrintLineFile("1\n")    #Print list of collaction

        gets.chomp

      elsif opt=="4"

        system "cls"

        @@db.PrintLineFile("0\n")    #Print list of collaction

        gets.chomp

      elsif opt=="x"

        exit                #Exit to cansole

      else

        main_menu()

      end
  end
  end

while(true)                 # Loop to contineu application till exis

  plot = ParkingLot.new()

  plot.lot_start()

end
