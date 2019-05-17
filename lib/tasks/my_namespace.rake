namespace :my_namespace do
  desc "TODO"
  task :my_task1 => :environment do
  	product_data = [{name:"Galaxy View2", price:"1000", quantity:"2", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy S10 5G", price:"1000", quantity:"2", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy S10+", price:"2000", quantity:"3", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy S10", price:"3000", quantity:"4", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy S10e", price:"4000", quantity:"5", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy Fold", price:"5000", quantity:"6", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy Watch Active", price:"6000", quantity:"7", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},
  		{name:"Galaxy A2 Core", price:"7000", quantity:"8", description:"13+5+5MP Triple rear camera", size:"no size", brand_id: 9},

  		{name:"Nokia Lumia 635", price:"10000", quantity:"11", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia 808 Pure", price:"20000", quantity:"21", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia 8 Sirocco", price:"30000", quantity:"12", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia Lumia", price:"40000", quantity:"10", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia 8", price:"60000", quantity:"6", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia 7 Plus", price:"70000", quantity:"7", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia 8.1", price:"80000", quantity:"4", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},
  		{name:"Nokia Lumia 820", price:"9000", quantity:"5", description:"Memory, Storage and SIM 4GB RAM | 64GB internal memory", size:"no size", brand_id: 12},

  		{name:"Motorola Milestone XT800", price:"4500", quantity:"12", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Moto Turbo", price:"1050", quantity:"14", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Razr Maxx", price:"10500", quantity:"4", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Moto Z2 Force", price:"19000", quantity:"5", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Moto X Style", price:"10500", quantity:"7", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Droid Turbo", price:"10090", quantity:"6", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Droid Ultra", price:"10900", quantity:"7", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},
  		{name:"Motorola Moto G Turbo Edition", price:"10700", quantity:"22", description:"5000mAH lithium-ion battery", size:"no size", brand_id: 13},

  		{name:"Oppo", price:"2000", quantity:"1", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11},
  		{name:"OPPO A5s", price:"25000", quantity:"3", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11},
  		{name:"OPPO A3s", price:"10200", quantity:"3", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11},
  		{name:"OPPO K1", price:"10500", quantity:"22", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11},
  		{name:"OPPO A7", price:"10700", quantity:"24", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11},
  		{name:"OPPO A77", price:"10300", quantity:"25", description:"Handset, Travel Adapter, USB Cable, Ejection Pin", size:"no size", brand_id: 11}]

  		product_data.each do |data|
  			Product.create(data)
  		end

  end

end