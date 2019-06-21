require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_foo
    items = [
      Item.new("foo", 0, 0),
      Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
      Item.new(name="Aged Brie", sell_in=2, quality=0),
      Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
      Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
      Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
      Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
      # This Conjured item does not work properly yet
      Item.new(name="Conjured Mana Cake", sell_in=3, quality=6) # <-- :O
    ]
    GildedRose.new(items).update_quality()
    
    assert_equal 0, items[0].quality
    assert_equal 19, items[1].quality
    assert_equal -1, items[5].sell_in
    assert_equal 3, items[9].sell_in
    assert_equal 4, items[9].quality
  end

end
