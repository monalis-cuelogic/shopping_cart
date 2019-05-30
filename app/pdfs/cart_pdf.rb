class CartPdf < Prawn::Document
  def initialize(cart,view)
    super(margin: 70)

    @cart = cart

    # text "Name #{@cart.name}", size: 30, style: :bold
    # text "Price #{@cart.price}", size: 30, style: :bold
    # text "Size #{@cart.size}", size: 30, style: :bold
    # text "Total #{@total}", size: 30, style: :bold
    @view = view
    line_items
  end


  def line_items
    # move_down 20
    # t = make_table([["this is the first row"],["this is the second row"]])
    # t.draw
    # move_down 20

    # table([["short","short","loooooooooooooooooooong"],["short","loooooooooooooooooooong","short"],["loooooooooooooooooooong","short","short"]])
 
     data =[["welcome"]]
     data +=[["..."]]* 5
     table(data,:header => true)

  end

end

