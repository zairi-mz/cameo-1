pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 30) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 30) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Stores & Spares", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,690], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

pdf.bounding_box([15,680], :width => 60) do
  	pdf.text "Part No :", :align => :left, :style => :bold
end
pdf.bounding_box([100,680], :width => 100) do
  	pdf.text "#{@part.part_code}", :align => :left
end

pdf.bounding_box([15,660], :width => 70) do
  	pdf.text "Part Name :", :align => :left, :style => :bold
end
pdf.bounding_box([100,660], :width => 400) do
  	pdf.text "#{@part.name}", :align => :left
end

pdf.bounding_box([15,640], :width => 100) do
  	pdf.text "Supplier Part No :", :align => :left, :style => :bold
end

pdf.bounding_box([100,640], :width => 400) do
  	pdf.text "#{@part.part_no}", :align => :left
end

pdf.bounding_box([15,620], :width => 100) do
  	pdf.text "Supplier :", :align => :left, :style => :bold
end

pdf.bounding_box([100,620], :width => 400) do
  	if !@part.supplier_id.nil?
		@s = Address.find(:first, :conditions => ["id=?", @part.supplier_id])
  		pdf.text "#{@s.company}", :align => :left
	end
end

pdf.bounding_box([15,600], :width => 100) do
  	pdf.text "Manufacturer :", :align => :left, :style => :bold
end

pdf.bounding_box([100,600], :width => 400) do
	if !@part.manufacturer_id.nil?
		@m = Address.find(:first, :conditions => ["id=?", @part.manufacturer_id])
  		pdf.text "#{@m.company}", :align => :left
	end
end

pdf.bounding_box([15,580], :width => 100) do
  	pdf.text "Location :", :align => :left, :style => :bold
end

pdf.bounding_box([100,580], :width => 400) do
	if !@part.location_id.nil?
  		pdf.text "#{@part.location_details}", :align => :left
	end
end

pdf.bounding_box([15,560], :width => 100) do
  	pdf.text "Minimum Level :", :align => :left, :style => :bold
end

pdf.bounding_box([100,560], :width => 400) do
  	pdf.text "#{@part.minlevel}", :align => :left
end

pdf.bounding_box([15,540], :width => 100) do
  	pdf.text "Maximum Level :", :align => :left, :style => :bold
end

pdf.bounding_box([100,540], :width => 400) do
  	pdf.text "#{@part.maxlevel}", :align => :left
end

pdf.bounding_box([15,520], :width => 100) do
  	pdf.text "Price :", :align => :left, :style => :bold
end

pdf.bounding_box([100,520], :width => 400) do
  	pdf.text "#{@part.price}", :align => :left
end

pdf.bounding_box([15,500], :width => 100) do
  	pdf.text "Quantity :", :align => :left, :style => :bold
end

pdf.bounding_box([100,500], :width => 400) do
  	pdf.text "#{@part.quantity}", :align => :left
end

pdf.bounding_box([15,480], :width => 100) do
  	pdf.text "Notes :", :align => :left, :style => :bold
end

pdf.bounding_box([100,480], :width => 400) do
  	pdf.text "#{@part.notes}", :align => :left
end
