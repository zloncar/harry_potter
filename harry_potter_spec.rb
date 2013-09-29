describe "sale of harry potter books" do

  it "buy one or more of the same book" do
    basket = Basket.new
    basket.add_book( 'book2', 6 )
    price = basket.price_single_title
    expect( price ).to eq( 48 )
  end

  it "buy five different title books" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    basket.add_book( 'book3', 1 )
    basket.add_book( 'book4', 1 )
    basket.add_book( 'book5', 1 )
    expect( basket.size ).to eq( 5 )
  end

  it "buy different combo of books" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    basket.add_book( 'book3', 2 )
    basket.add_book( 'book4', 3 )
    basket.add_book( 'book5', 1 )
    expect( basket.all ).to eq( { 'book1'=>1, 'book2'=>1,'book3'=>2,'book4'=>3,'book5'=>1 } )
  end

  it "calculate discount for 2 different titles" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    expect( basket.discounted_price ).to eq( 16 * 0.95 )
  end

  it "calculate discount for 3 different titles" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    basket.add_book( 'book5', 1 )
    expect( basket.discounted_price ).to eq( 24 * 0.9 )
  end

  it "calculate discount for 5 different titles" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    basket.add_book( 'book3', 1 )
    basket.add_book( 'book4', 1 )
    basket.add_book( 'book5', 1 )
    expect( basket.discounted_price ).to eq( 40 * 0.75 )
  end


  class Basket

    UNIT_PRICE = 8

    def initialize()
      @basket = Hash.new
    end

    def add_book( title, quantity )
      @basket[title] = quantity
    end

    def title
      @title
    end

    def size
      @basket.size
    end

    def all
      @basket
    end

    def price_single_title
      @basket[@basket.keys.first] * UNIT_PRICE
    end

    def discounted_price
      @discount = { 2 => 0.95, 3 => 0.9, 5 => 0.75 }
      @basket.size * UNIT_PRICE * @discount[ @basket.size ]
    end

  end

end
