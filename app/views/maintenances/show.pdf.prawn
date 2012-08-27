
pdf.bounding_box([10,700], :width => 100, :height => 80) do
  pdf.stroke_bounds
end
pdf.bounding_box([10,690], :width => 100) do
	pdf.font_size 14
  	pdf.text "Ship's Class", :align => :center, :style => :bold
end
pdf.bounding_box([10,660], :width => 100) do
	pdf.font_size 14
  	pdf.text "Kasturi", :align => :center
end

pdf.bounding_box([110,700], :width => 350, :height => 80) do
  pdf.stroke_bounds
end
pdf.bounding_box([110,680], :width => 100) do
	pdf.font_size 20
  	pdf.text "PMS", :align => :center, :style => :bold
	pdf.text "OLM", :align => :center, :style => :bold
end
pdf.bounding_box([210,680], :width => 250) do
	pdf.font_size 18
  	pdf.text "MAINTENANCE", :align => :center, :style => :bold
	pdf.text "INSTRUCTION CARD", :align => :center, :style => :bold
end

pdf.bounding_box([460,700], :width => 80, :height => 80) do
  pdf.stroke_bounds
end
logopath = "#{RAILS_ROOT}/public/images/rmn.jpg"
pdf.bounding_box([470,698], :width => 75) do
	pdf.image logopath, :width => 60, :height => 75
end

pdf.bounding_box([10,620], :width => 310, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([15,610], :width => 100) do
	pdf.font_size 14
  	pdf.text "System", :align => :left, :style => :bold
end
@t = @maintenance.component.component_code
@t = @t[0,1]
@compname = Component.find_by_sql(["SELECT name FROM components WHERE component_code=?","#{@t}"])
pdf.bounding_box([15,580], :width => 300) do
	compname = @compname [0]
	pdf.font_size 14
  	pdf.text compname.name, :align => :left
end

pdf.bounding_box([320,620], :width => 110, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([325,610], :width => 100) do
	pdf.font_size 14
  	pdf.text "System No.", :align => :left, :style => :bold
end
pdf.bounding_box([325,580], :width => 100) do
	pdf.font_size 14
  	pdf.text "#{@maintenance.component.component_code}", :align => :left
end

pdf.bounding_box([430,620], :width => 110, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([435,610], :width => 100) do
	pdf.font_size 14
  	pdf.text "MIC - Code", :align => :left, :style => :bold
end
pdf.bounding_box([435,580], :width => 100) do
	pdf.font_size 14
  	pdf.text "#{@maintenance.code}", :align => :left
end

pdf.bounding_box([10,550], :width => 310, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([15,540], :width => 100) do
	pdf.font_size 14
  	pdf.text "Equipment", :align => :left, :style => :bold
end
pdf.bounding_box([15,510], :width => 300) do
	pdf.font_size 14
  	pdf.text "#{@maintenance.component.name}", :align => :left
end

pdf.bounding_box([320,550], :width => 110, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([325,540], :width => 100) do
	pdf.font_size 14
  	pdf.text "Related MIC", :align => :left, :style => :bold
end
pdf.bounding_box([325,510], :width => 100) do
	pdf.font_size 14
  	pdf.text "Nil", :align => :left
end

pdf.bounding_box([430,550], :width => 110, :height => 70) do
  pdf.stroke_bounds
end
pdf.bounding_box([435,540], :width => 100) do
	pdf.font_size 14
  	pdf.text "Time(h)", :align => :left, :style => :bold
end
@h = 0
for mainthours in @maintenance.mainthours
	@h = @h + mainthours.hours	
end
pdf.bounding_box([435,510], :width => 100) do
	pdf.font_size 14
  	pdf.text "#{@h}", :align => :left
end

pdf.bounding_box([10,480], :width => 530, :height => 80) do
  pdf.stroke_bounds
end
pdf.bounding_box([15,470], :width => 200) do
	pdf.font_size 14
  	pdf.text "Maintenance Activity", :align => :left, :style => :bold
end
pdf.bounding_box([15,440], :width => 520) do
	pdf.font_size 14
	pdf.text "#{@maintenance.jobdesc.description}", :align => :left unless @maintenance.jobdesc_id.nil?
end

pdf.bounding_box([15,390], :width => 200) do
	pdf.font_size 14
  	pdf.text "Safety Precautions", :align => :left, :style => :bold
end
pdf.bounding_box([15,360], :width => 520, :height => 300) do
	pdf.font_size 14
  	pdf.text "#{@maintenance.jobdesc.safety}", :align => :left unless @maintenance.jobdesc_id.nil?
end

pdf.start_new_page
pdf.bounding_box([15,690], :width => 300) do
	pdf.font_size 14
  	pdf.text "Tools, Test Equipment and Facilities", :align => :left, :style => :bold
end
pdf.bounding_box([15,660], :width => 300) do
	@i = 1
	for tools in @maintenance.tools
		pdf.text "#{@i}. #{tools.name}"
		@i = @i + 1
	end
end

pdf.bounding_box([15,500], :width => 300) do
	pdf.font_size 14
  	pdf.text "Parts", :align => :left, :style => :bold
end
pdf.bounding_box([15,470], :width => 500) do
	@i = 1
	for parts in @maintenance.parts
		pdf.text "#{@i}. #{parts.name}"
		@i = @i + 1
	end
end

pdf.start_new_page
pdf.bounding_box([15,690], :width => 500) do
	pdf.font_size 14
  	pdf.text "Procedure", :align => :left, :style => :bold
end
pdf.bounding_box([15,660], :width => 500, :height => 600) do
	pdf.text "#{@maintenance.jobdesc.method}", :align => :left unless @maintenance.jobdesc_id.nil?
end

pdf.bounding_box([420,45], :width => 30) do
	pdf.font_size 14
	pdf.page_count.times do |i|
	   pdf.go_to_page(i+1)
	   pdf.text "#{i + 1}"
	end
end	
pdf.bounding_box([480,45], :width => 30) do
	pdf.font_size 14
	pdf.page_count.times do |i|
	   pdf.go_to_page(i+1)
	   pdf.text "#{pdf.page_count}"
	end
end	


pdf.repeat :all do
   # header
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "RESTRICTED - TERHAD", :align => :center, :style => :bold
   end

	# border
	pdf.bounding_box([10,700], :width => 530, :height => 670) do
  		pdf.stroke_bounds
	end

   # footer
	pdf.bounding_box([10,50], :width => 180, :height => 20) do
 		pdf.stroke_bounds
	end
	pdf.bounding_box([15,45], :width => 80) do
		pdf.font_size 14
	  	pdf.text "MIC- Code:", :align => :left, :style => :bold
	end
	pdf.bounding_box([100,45], :width => 80) do
		pdf.font_size 14
	  	pdf.text "#{@maintenance.code}", :align => :left
	end
	
	pdf.bounding_box([190,50], :width => 180, :height => 20) do
 		pdf.stroke_bounds
	end
	pdf.bounding_box([195,45], :width => 60) do
		pdf.font_size 14
	  	pdf.text "Date:", :align => :left, :style => :bold
	end
	creation_date = Time.now.strftime('%m.%Y')
	pdf.bounding_box([250,45], :width => 120) do
		pdf.font_size 14
	  	pdf.text "" + creation_date
	end
	
	pdf.bounding_box([370,50], :width => 170, :height => 20) do
 		pdf.stroke_bounds
	end
	pdf.bounding_box([375,45], :width => 40) do
		pdf.font_size 14
	  	pdf.text "Page", :align => :left, :style => :bold
	end
	pdf.bounding_box([450,45], :width => 30) do
		pdf.font_size 14
	  	pdf.text "of", :align => :left, :style => :bold
	end
	
   pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
       pdf.font_size 12
	   pdf.font "Helvetica"
       pdf.move_down(5)
       pdf.text "RESTRICTED - TERHAD", :align => :center, :style => :bold
   end
 end
