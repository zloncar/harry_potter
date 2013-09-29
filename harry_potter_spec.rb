describe "sale of harry potter books" do

  it "buy one or more of the same book" do
    price = basket( 'book3', 2 )
    expect( price ).to eq( 16 )
  end

  it "buy five different title books" do
    basket = Basket.new
    basket.add_book( 'book1', 1 )
    basket.add_book( 'book2', 1 )
    basket.add_book( 'book3', 1 )
    basket.add_book( 'book4', 1 )
    basket.add_book( 'book5', 1 )
#   puts basket.title
    expect( basket.size ).to eq( 5 )
  end

  class Basket
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

  end

  def basket( book, quantity )
    content = Hash.new
    content[:book] = quantity
    price = 8 * quantity
  end


  class Book
    def initialize( title )
      @price = 8
      @title = title
    end

    def []=(key, value)
      @placeholder[key] = value
    end

    def make_guess(word, guess)
      word.chars.each_with_index do |char, index|
        self[index] = char if char == guess
      end
    end

  end


end
