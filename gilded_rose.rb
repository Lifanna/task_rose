class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = "Aged Brie"
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured Mana Cake"

  def update_quality()
    @items.each do |item|
      case item.name 
      when BACKSTAGE
        update_item_quality(item, 1)
        if item.sell_in < 11
            update_item_quality(item, 1)
        end
        if item.sell_in < 6
            update_item_quality(item, 1)
        end

        update_item_quality(item, -item.quality) if item_expired?(item)
      when AGED_BRIE
        update_item_quality(item, 1)
      when SULFURAS
        
      when CONJURED
        update_item_quality(item, -2)
      else
        update_item_quality(item, -1)
        update_item_quality(item, -1) if item_expired?(item)
      end 
    end
  end

  private

    def update_item_quality(item, quality_value)
      if item.quality < 50 && item.quality > 0
        item.sell_in -= 1
        item.quality += quality_value
      end
    end

    def item_expired?(item)
      item.sell_in < 0
    end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
