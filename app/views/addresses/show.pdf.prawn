pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 30) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 30) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Addresses", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,690], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

pdf.bounding_box([15,680], :width => 60) do
  	pdf.text "Name :", :align => :left, :style => :bold
end
pdf.bounding_box([100,680], :width => 100) do
  	pdf.text "#{@address.company}", :align => :left
end

pdf.bounding_box([15,660], :width => 70) do
  	pdf.text "Address :", :align => :left, :style => :bold
end
pdf.bounding_box([100,660], :width => 200) do
  	pdf.text "#{@address.address}", :align => :left
end

pdf.bounding_box([15,600], :width => 100) do
  	pdf.text "Phone No :", :align => :left, :style => :bold
end

pdf.bounding_box([100,600], :width => 400) do
  	pdf.text "#{@address.phone}", :align => :left
end

pdf.bounding_box([15,580], :width => 100) do
  	pdf.text "Fax No :", :align => :left, :style => :bold
end

pdf.bounding_box([100,580], :width => 400) do
  		pdf.text "#{@address.fax}", :align => :left
end

pdf.bounding_box([15,560], :width => 100) do
  	pdf.text "Email :", :align => :left, :style => :bold
end

pdf.bounding_box([100,560], :width => 400) do
	pdf.text "#{@address.email}", :align => :left
end

pdf.bounding_box([15,540], :width => 100) do
  	pdf.text "Web Address :", :align => :left, :style => :bold
end

pdf.bounding_box([100,540], :width => 400) do
  	pdf.text "#{@address.web}", :align => :left
end

pdf.bounding_box([15,520], :width => 100) do
  	pdf.text "Notes :", :align => :left, :style => :bold
end

pdf.bounding_box([100,520], :width => 400) do
  	pdf.text "#{@address.notes}", :align => :left
end
