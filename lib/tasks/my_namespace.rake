namespace :my_namespace do
  desc "products added"
  task :my_task1 => :environment do
  	product_data = [{name:"Galaxy View2", price:"1000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy S10 5G", price:"1000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy S10+", price:"2000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy S10", price:"3000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy S10e", price:"4000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy Fold", price:"5000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy Watch Active", price:"6000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
  		{name:"Galaxy A2 Core", price:"7000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
      {name:"Samsung W2019", price:"10000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},
      {name:"Samsung Galaxy S9+", price:"15000", quantity:"30", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 4},

  		{name:"Nokia Lumia 635", price:"10000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia 808 Pure", price:"20000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia 8 Sirocco", price:"30000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia Lumia", price:"40000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia 8", price:"60000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia 7 Plus", price:"70000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia 8.1", price:"80000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
  		{name:"Nokia Lumia 820", price:"9000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
      {name:"Nokia 3.1 C", price:"9000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},
      {name:"Nokia 3.1 A", price:"9000", quantity:"30", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 3},

  		{name:"Motorola Milestone XT800", price:"4500", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Moto Turbo", price:"1050", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Razr Maxx", price:"10500", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Moto Z2 Force", price:"19000", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Moto X Style", price:"10500", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Droid Turbo", price:"10090", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Droid Ultra", price:"10900", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
  		{name:"Motorola Moto G Turbo Edition", price:"10700", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
      {name:"Motorola Milestone XT700", price:"10700", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},
      {name:"Motorola One Power", price:"10700", quantity:"30", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 5},

  		{name:"Oppo", price:"2000", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
  		{name:"OPPO A5s", price:"25000", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
  		{name:"OPPO A3s", price:"10200", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
  		{name:"OPPO K1", price:"10500", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
  		{name:"OPPO A7", price:"10700", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
      {name:"OPPO Reno", price:"10700", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
      {name:"OPPO A6s", price:"10700", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
      {name:"OPPO K1", price:"10700", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
      {name:"OPPO F9 Pro", price:"10700", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},
  		{name:"OPPO A77", price:"10300", quantity:"30", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 2},

      {name:"Roadster-Men Blue Regular Fit Printed Casual Shirt", price:"1700", quantity:"30", description:"Blue Regular Fit Printed Casual Shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Men Brown & Black Slim Fit Checked Casual Shirt", price:"700", quantity:"30", description:"Brown & Black Slim Fit Checked Casual Shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Men Navy Blue & Grey Slim Fit Checked Casual Shirt", price:"500", quantity:"30", description:"Navy Blue & Grey Slim Fit Checked Casual Shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Men Black Regular Fit Solid Casual Shirt", price:"10700", quantity:"30", description:"Black Regular Fit Solid Casual Shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Men Black & Green Regular Fit Checked Casual Shirt", price:"300", quantity:"30", description:"Black & Green Regular Fit Checked Casual Shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Women Red & White Striped Top with Gathered Sleeves", price:"299", quantity:"30", description:"Red & White Striped Top with Gathered Sleeves", size:"no size", brand_id: 1},
      {name:"Roadster-Women Burgundy Solid High-Low Top", price:"499", quantity:"30", description:"Burgundy Solid High-Low Top", size:"no size", brand_id: 1},
      {name:"Roadster-Women Mustard Yellow Solid Boat Neck T-shirt", price:"899", quantity:"30", description:"Mustard Yellow Solid Boat Neck T-shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Black & Grey Printed Polo T-shirt", price:"899", quantity:"30", description:"Black & Grey Printed Polo T-shirt", size:"no size", brand_id: 1},
      {name:"Roadster-Women Pack of 2 T-shirts", price:"899", quantity:"30", description:"Pack of 2 T-shirts", size:"no size", brand_id: 1},

      {name:"Nike-Men's Solay Thong", price:"899", quantity:"30", description:"Men's Solay Thong", size:"no size", brand_id: 6},
      {name:"Nike-Unisex Black Brand Logo Backpack", price:"349", quantity:"30", description:"Unisex Black Brand Logo Backpack", size:"no size", brand_id: 6},
      {name:"Nike-Men Blue LEGEND REACT Running Shoes", price:"349", quantity:"30", description:"Men Blue LEGEND REACT Running Shoes", size:"no size", brand_id: 6},
      {name:"Nike-Men Black Printed AS DRI-FIT WILD RUN Standard Fit Round Neck T-shirt", price:"349", quantity:"30", description:"Men Black Printed AS DRI-FIT WILD RUN Standard Fit Round Neck T-shirt", size:"no size", brand_id: 6},
      {name:"Nike-Men Black & White Graphic Rpm Backpack", price:"349", quantity:"30", description:"Men Black & White Graphic Rpm Backpack", size:"no size", brand_id: 6},
      {name:"Nike-Girls Peach-Coloured Solid Round Neck T-shirt", price:"349", quantity:"30", description:"Girls Peach-Coloured Solid Round Neck T-shirt", size:"no size", brand_id: 6},
      {name:"Nike-Grey Melange CF JSY CLUB KNIT Joggers", price:"599", quantity:"30", description:"Grey Melange CF JSY CLUB KNIT Joggers", size:"no size", brand_id: 6},
      {name:"Nike-Women Blue Self Design Round Neck Dri-Fit SS Running T-shirt", price:"599", quantity:"30", description:"Women Blue Self Design Round Neck Dri-Fit SS Running T-shirt", size:"no size", brand_id: 6},
      {name:"Nike-Men Black & White Printed AS M NSW HYBRID 1 FS Round Neck T-shirt", price:"599", quantity:"24", description:"Men Black & White Printed AS M NSW HYBRID 1 FS Round Neck T-shirt", size:"no size", brand_id: 6},
      {name:"Nike-Men Blue Solid KEPA KAI Thong Flip-Flops", price:"599", quantity:"24", description:"Men Blue Solid KEPA KAI Thong Flip-Flops", size:"no size", brand_id: 6},
      
      {name:"Adidas-Men Grey & White Beach Print Maxout 2 Thong Flip-Flops", price:"599", quantity:"30", description:"Men Grey & White Beach Print Maxout 2 Thong Flip-Flops", size:"no size", brand_id: 7},
      {name:"Adidas-Men Green Stan Smith Leather Sneakers", price:"599", quantity:"30", description:"Men Green Stan Smith Leather Sneakers", size:"no size", brand_id: 7},
      {name:"Adidas-Unisex Olive Green & Beige Training Linear Core Graphic Printed Backpack", price:"599", quantity:"30", description:"Unisex Olive Green & Beige Training Linear Core Graphic Printed Backpack", size:"no size", brand_id: 7},
      {name:"Adidas-Women Black Solid OWN THE RUN LS Round Neck T-shirt", price:"599", quantity:"30", description:"Women Black Solid OWN THE RUN LS Round Neck T-shirt", size:"no size", brand_id: 7},
      {name:"Adidasp-Unisex Mustard Yellow Continental Vulc Sneakers", price:"599", quantity:"30", description:"Unisex Mustard Yellow Continental Vulc Sneakers", size:"no size", brand_id: 7},
      {name:"Adidas-Women Orange Trefoil Print Round Neck T-shirt", price:"599", quantity:"30", description:"Women Orange Trefoil Print Round Neck T-shirt", size:"no size", brand_id: 7},
      {name:"Adidas-Men White Samba RM Leather Sneakers", price:"599", quantity:"30", description:"Men White Samba RM Leather Sneakers", size:"no size", brand_id: 7},
      {name:"Adidas-Men Teal Blue Terrex AX3 Trekking Shoes", price:"599", quantity:"30", description:"Men Teal Blue Terrex AX3 Trekking Shoes", size:"no size", brand_id: 7},
      {name:"Adidas-Men Burgundy Continental 80 Sneakers", price:"599", quantity:"30", description:"Men Burgundy Continental 80 Sneakers", size:"no size", brand_id: 7},
      {name:"Adidas-Men Black Printed TREFOIL T-shirt", price:"599", quantity:"30", description:"Men Black Printed TREFOIL T-shirt", size:"no size", brand_id: 7}]



  		product_data.each do |data|
  			Product.create(data)
  		end
      puts 'records created'
  end

end