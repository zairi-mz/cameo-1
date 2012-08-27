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
@t = @component.component_code
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
  	pdf.text "#{@component.component_code}", :align => :left
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
  	pdf.text "#{}", :align => :left
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
  	pdf.text "#{@component.name}", :align => :left
end
