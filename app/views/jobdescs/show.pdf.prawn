pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 30) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 30) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Job Procedure", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,690], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

pdf.bounding_box([15,680], :width => 60) do
  	pdf.text "Proc Code :", :align => :left, :style => :bold
end
pdf.bounding_box([80,680], :width => 60) do
  	pdf.text "#{@jobdesc.job_code}", :align => :left
end

pdf.bounding_box([15,660], :width => 70) do
  	pdf.text "Description :", :align => :left, :style => :bold
end
pdf.bounding_box([80,660], :width => 330) do
  	pdf.text "#{@jobdesc.description}", :align => :left
end

pdf.bounding_box([10,640], :width => 530, :height => 640) do
	pdf.stroke_bounds
end
pdf.bounding_box([15,630], :width => 100) do
  	pdf.text "Safety Precautions :", :align => :left, :style => :bold
end

pdf.bounding_box([15,610], :width => 500) do
  	pdf.text "#{@jobdesc.safety}", :align => :left
end

pdf.start_new_page
pdf.bounding_box([15,680], :width => 500) do
  	pdf.text "Procedure :", :align => :left, :style => :bold
end

pdf.bounding_box([15,660], :width => 500) do
  	pdf.text "#{@jobdesc.method}", :align => :left
end
