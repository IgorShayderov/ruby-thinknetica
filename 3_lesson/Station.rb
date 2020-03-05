class Station(name)
  def initialize
    @name = name
    @trainInside = []
  end

  def takeTrainIn(train)
    @trainInside.push(train)
  end

  def trainsList(type = 'all')
    if type != all
      @trainsInside.each{ |train| puts "#{train.type} train: #{train.name}." if train.type == type }
    else
      @trainsInside.each{ |train| puts "#{train.type} train: #{train.name}." }
    end
  end

  def trainListByType
    trainsList('')
  end
end