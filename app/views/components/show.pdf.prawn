pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 30) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 30) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Equipment", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,690], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

pdf.bounding_box([15,680], :width => 60) do
  	pdf.text "Eqpt No :", :align => :left, :style => :bold
end
pdf.bounding_box([100,680], :width => 100) do
  	pdf.text "#{@component.component_code}", :align => :left
end

pdf.bounding_box([15,660], :width => 70) do
  	pdf.text "Eqpt Name :", :align => :left, :style => :bold
end
pdf.bounding_box([100,660], :width => 400) do
  	pdf.text "#{@component.name}", :align => :left
end

pdf.bounding_box([15,640], :width => 100) do
  	pdf.text "Type No :", :align => :left, :style => :bold
end

pdf.bounding_box([100,640], :width => 400) do
  	pdf.text "#{@component.type_no}", :align => :left
end

pdf.bounding_box([15,620], :width => 100) do
  	pdf.text "Serial No :", :align => :left, :style => :bold
end

pdf.bounding_box([100,620], :width => 400) do
  	pdf.text "#{@component.serial_no}", :align => :left
end

pdf.bounding_box([15,600], :width => 100) do
  	pdf.text "Supplier :", :align => :left, :style => :bold
end

pdf.bounding_box([100,600], :width => 400) do
	if !@component.supplier_id.nil?
  		pdf.text "#{@component.suppliedby.company}", :align => :left
	end
end

pdf.bounding_box([15,580], :width => 100) do
  	pdf.text "Manufacturer :", :align => :left, :style => :bold
end

pdf.bounding_box([100,580], :width => 400) do
	if !@component.manufacturer_id.nil?
  		pdf.text "#{@component.manufacturedby.company}", :align => :left
	end
end

pdf.bounding_box([15,560], :width => 100) do
  	pdf.text "Installed On :", :align => :left, :style => :bold
end

pdf.bounding_box([100,560], :width => 400) do
  	pdf.text "#{@component.installed_on}", :align => :left
end

pdf.bounding_box([15,540], :width => 100) do
  	pdf.text "Tech Spec :", :align => :left, :style => :bold
end

pdf.bounding_box([100,540], :width => 400) do
  	pdf.text "#{@component.tech_description}", :align => :left
end

pdf.bounding_box([10,470], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 465], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Parts Attached", :align => :center, :style => :bold
end

pdf.bounding_box([30,440], :width => 70) do
  	pdf.text "Part No", :align => :left, :style => :bold
end
pdf.bounding_box([120,440], :width => 70) do
  	pdf.text "Part Name", :align => :left, :style => :bold
end
pdf.bounding_box([400,440], :width => 70) do
  	pdf.text "Quantity", :align => :center, :style => :bold
end

@cp = Comppart.find(:all, :conditions => ["component_id=?", @component.id], :order => "part_id ASC")

pdf.float do	
	pdf.bounding_box([15,425], :width => 100, :height => 300) do
		@i = 1
		for parts in @cp
			@pt = parts.part_id
			@c = Part.find(:first, :conditions => ["id=?", @pt])
			pdf.text "#{@i}.   #{@c.part_code}"
			@i = @i + 1
		end
	end
end
pdf.float do	
	pdf.bounding_box([120,425], :width => 300, :height => 300) do
		for pn in @cp
			@p = pn.part_id
			@n = Part.find(:first, :conditions => ["id=?", @p])
			pdf.text "#{@n.name}"
		end
	end
end
pdf.float do	
	pdf.bounding_box([400,425], :width => 70, :height => 300) do
		for mq in @cp
			pdf.text "#{mq.quantity}", :align => :center
		end
	end
end
