pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 40) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 40) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Unplanned Maintenance", :align => :center, :style => :bold
		pdf.text "Work Order", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,680], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

pdf.bounding_box([15,670], :width => 60) do
  	pdf.text "Job Code :", :align => :left, :style => :bold
end
pdf.bounding_box([90,670], :width => 60) do
  	pdf.text "#{@maintenance.code}", :align => :left
end

pdf.bounding_box([15,650], :width => 70) do
  	pdf.text "Description :", :align => :left, :style => :bold
end
pdf.bounding_box([90,650], :width => 500) do
  	pdf.text "#{@maintenance.description}", :align => :left
end

pdf.bounding_box([15,630], :width => 60) do
  	pdf.text "Comp No :", :align => :left, :style => :bold
end
pdf.bounding_box([90,630], :width => 60) do
  	pdf.text "#{@maintenance.component.comp_code}", :align => :left
end

pdf.bounding_box([150,630], :width => 70) do
  	pdf.text "Comp Name :", :align => :left, :style => :bold
end
pdf.bounding_box([220,630], :width => 330) do
  	pdf.text "#{@maintenance.component.comp_name}", :align => :left
end

pdf.bounding_box([15,610], :width => 60) do
  	pdf.text "Priority :", :align => :left, :style => :bold
end
pdf.bounding_box([90,610], :width => 60) do
  	pdf.text "#{@maintenance.priority}", :align => :left
end

pdf.bounding_box([15,590], :width => 65) do
  	pdf.text "Action Group :", :align => :left, :style => :bold
end
pdf.bounding_box([90,590], :width => 300) do
  	pdf.text "#{@maintenance.action_group_name}", :align => :left
end

pdf.bounding_box([10,570], :width => 530, :height => 90) do
	pdf.stroke_bounds
end

pdf.bounding_box([15,560], :width => 80) do
  	pdf.text "Reported Date :", :align => :left, :style => :bold
end
pdf.bounding_box([110,560], :width => 60) do
  	pdf.text "#{@maintenance.date_report}", :align => :left
end

pdf.bounding_box([15,540], :width => 80) do
  	pdf.text "Reported By :", :align => :left, :style => :bold
end
pdf.bounding_box([110,540], :width => 330) do
	if !@maintenance.reported_by.nil?
  		pdf.text "#{@maintenance.user.name}", :align => :left
	end
end

pdf.bounding_box([15,520], :width => 90) do
  	pdf.text "To Start Work On :", :align => :left, :style => :bold
end
pdf.bounding_box([110,520], :width => 330) do
  	pdf.text "#{@maintenance.date_to_start}", :align => :left
end

pdf.bounding_box([15,500], :width => 90) do
  	pdf.text "To Finish Work On :", :align => :left, :style => :bold
end
pdf.bounding_box([110,500], :width => 330) do
  	pdf.text "#{@maintenance.date_to_finish}", :align => :left
end
