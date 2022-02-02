class FileReadWrite         #Data file
  @@fileName=Time.now.strftime("%d-%m-%y") #Creat file to use date(filename)

  def CreateFile()

    if File::exists?(@@fileName+".txt" )  #check file is existing or not

       aFile = File.new(@@fileName+".txt", "a")  # "a" is apend funtion which is hold previous data

      aFile.close

    else

      aFile = File.new(@@fileName+".txt", "a")    # when file is not exists create a new file

      aFile.close

    end

  end

  def WriteOnFile(dt)

      aFile = File.new(@@fileName+".txt", "a")    # when file is not exists create a new file

      aFile.syswrite(dt)                         # .syswrite is ue to write data in file

      aFile.syswrite("\n")

      aFile.close
  end

  def WriteOnFile_Replace(dt)

      aFile = File.new(@@fileName+".txt", "w")    # when file is not exists create a new file

      aFile.syswrite(dt)   # .syswrite is ue to write data in file

      aFile.close
  end

  def GetAllFileAsString()            #we store file in one object

    myFile=File.open(@@fileName+".txt","r")

    str=""

    while(line=myFile.gets)

      str=str + line

    end

    myFile.close

    return str
  end

  def PrintLineFile(status)           #it is given to list of vehicle data or details

    myFile=File.open(@@fileName+".txt","r")

    puts("Size  Amount  Reg-No.  Status")

    while(line=myFile.gets)

      if(line!="" && line.split(",")[3].to_s==status)

        puts(line.split(",")[0]+"     "+line.split(",")[1]+"        "+line.split(",")[2]+"    "+line.split(",")[3])
      end
    end
  end
end
