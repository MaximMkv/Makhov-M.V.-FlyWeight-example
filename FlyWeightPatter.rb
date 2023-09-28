module Auto
    def get_name
    end
  
    def drive
    end
  end



  class Audi
    include Auto
  
    def initialize(name)
      @name = name
    end
  
    def get_name
      @name
    end
  
    def drive
      puts "Driving Audi..."
    end
  end



  class Mercedes
    include Auto
  
    def initialize(name)
      @name = name
    end
  
    def get_name
      @name
    end
  
    def drive
      puts "Driving Mercedes..."
    end
  end

  


  class Nissan
    include Auto
  
    def initialize(name)
      @name = name
    end
  
    def get_name
      @name
    end
  
    def drive
      puts "Driving Nissan..."
    end
  end

  


  class AutoInfo
    attr_accessor :year, :gearbox
  
    def initialize(year, gearbox, auto)
      @year = year
      @gearbox = gearbox
      @auto = auto
    end
  
    def get_auto
      @auto.get_name
    end
  
    def set_auto(auto)
      @auto = auto
    end
  
    def get_info
      puts "\nAuto: #{get_auto}\nYear: #{@year}\nGearbox: #{@gearbox}"
      puts "Hash: #{@auto}"
    end
  end

  


  class AutoDealership
    def initialize
      @full_auto_list = []
    end
  
    def deliver_auto(name, year, gearbox)
      auto = AutoFactory.get_auto(name)
      info = AutoInfo.new(year, gearbox, auto)
      @full_auto_list << info
    end
  
    def print_full_list_auto
      @full_auto_list.each do |ai|
        ai.get_info
      end
    end
  end

  


  class AutoFactory
    @@auto_list = {}
  
    def self.get_auto(name)
      auto = @@auto_list[name]
  
      if auto.nil?
        case name.downcase
        when "audi"
          puts "Buying Audi auto..."
          auto = Audi.new(name)
        when "nissan"
          puts "Buying Nissan auto..."
          auto = Nissan.new(name)
        when "mercedes"
          puts "Buying Mercedes auto..."
          auto = Mercedes.new(name)
        else
          puts "There's no such auto in the factory"
        end
  
        @@auto_list[name] = auto
      end
  
      auto
    end
  end

  


  class FWMain
    def self.main
      autos = []
  
      # 1
      # autos << AutoFactory.get_auto("nissan") until autos.size == 5
      # autos << AutoFactory.get_auto("mercedes") until autos.size == 11
      # autos << AutoFactory.get_auto("audi") until autos.size == 13
  
      # 2
      # auto1 = AutoFactory.get_auto("nissan")
      # autos << auto1
      # auto2 = AutoFactory.get_auto("nissan")
      # autos << auto2
      # auto3 = AutoFactory.get_auto("audi")
      # autos << auto3
      # auto4 = AutoFactory.get_auto("audi")
      # autos << auto4
      # auto5 = AutoFactory.get_auto("mercedes")
      # autos << auto5
      # auto6 = AutoFactory.get_auto("mercedes")
      # autos << auto6
  
      # autos.each { |auto| auto.drive }
  
      # puts "\n-------------------------- "
      # puts "\nNissans: "
      # nis_check = auto1 == auto2
      # puts nis_check
      # puts auto1
      # puts auto2
  
      # puts "\nAudi: "
      # audi_check = auto3 == auto4
      # puts audi_check
      # puts auto3
      # puts auto4
  
      # puts "\nMercedeses: "
      # merc_check = auto5 == auto6
      # puts merc_check
      # puts auto5
      # puts auto6
  
      # 3
      auto_deal = AutoDealership.new
      auto_deal.deliver_auto("mercedes", 2017, "four-wheel drive")
      auto_deal.deliver_auto("mercedes", 2013, "rear-wheel drive")
      auto_deal.deliver_auto("mercedes", 2005, "front-wheel drive")
  
      auto_deal.deliver_auto("nissan", 2014, "four-wheel drive")
      auto_deal.deliver_auto("nissan", 2019, "four-wheel drive")
      auto_deal.deliver_auto("nissan", 2000, "rear-wheel drive")
  
      auto_deal.deliver_auto("audi", 2020, "front-wheel drive")
      auto_deal.deliver_auto("audi", 2023, "rear-wheel drive")
      auto_deal.deliver_auto("audi", 2004, "four-wheel drive")
  
      auto_deal.print_full_list_auto
    end
  end
  
  FWMain.main
  