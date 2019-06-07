class CartPdf < Prawn::Document
  def initialize(cart,view,total,quantity_params)
    super(margin: 70)

    @cart = cart
    @total = total
    @quantity_params = quantity_params

    text "#{Date.today}",style: :italic
    @view = view
    line_items
  end


  def line_items
     data =[
            ["Order Details"],
            ["Product Name - #{@cart.name}"],
            ["Price - #{@cart.price}"],
            ["Quantity - #{@quantity_params}"],
            ["Total - #{@total}"],
            ["Thank You For Shopping With Us!!!"]
           ]
   table(data) do
     cells.padding = 12  
     cells.borders =[]  
     row(0).borders      =[:bottom]
     row(0).font_style   = :bold  
     row(3).borders      =[:bottom]  
     row(0).border_width = 1  
     
     row(5).font_style   =:italic  
     row(5).font = "Times-Roman"
     
     columns(0..1).position =[:center]  
     row(0).columns(0..1).borders =[:bottom]
     row(3).border_lines = [:dotted]
     row(0).border_lines = [:dotted]
     row(1).text_align = [:center]
     row(0).position = [:center]
     row(5).text_color = "FF004D"
   end
  end
end

