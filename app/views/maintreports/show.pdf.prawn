pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 40) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 40) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Planned Maintenance", :align => :center, :style => :bold
		pdf.text "Work Report", :align => :center, :style => :bold
   end
  
	# border
	pdf.bounding_box([10,680], :width => 530, :height => 690) do
  		pdf.stroke_bounds
	end
 end

pdf.font_size 9

@maint = Maintenance.find(:first, :conditions => ["id=?", @maintreport.maintenance_id])

pdf.bounding_box([15,670], :width => 60) do
  	pdf.text "Job Code :", :align => :left, :style => :bold
end
pdf.bounding_box([80,670], :width => 60) do
  	pdf.text "#{@maint.code}", :align => :left
end

pdf.bounding_box([150,670], :width => 70) do
  	pdf.text "Description :", :align => :left, :style => :bold
end
pdf.bounding_box([220,670], :width => 300) do
  	pdf.text "#{@maint.description}", :align => :left
end

@cid = @maint.component_id
@comp = Component.find(:first, :conditions => ["id=?", @cid])

pdf.bounding_box([15,650], :width => 60) do
  	pdf.text "Eqpt No :", :align => :left, :style => :bold
end
pdf.bounding_box([80,650], :width => 60) do
  	pdf.text "#{@comp.comp_code}", :align => :left
end

pdf.bounding_box([150,650], :width => 70) do
  	pdf.text "Eqpt Name :", :align => :left, :style => :bold
end
pdf.bounding_box([220,650], :width => 330) do
  	pdf.text "#{@comp.comp_name}", :align => :left
end

@pid = @maint.jobdesc_id
@proc = Jobdesc.find(:first, :conditions => ["id=?", @pid])

pdf.bounding_box([15,630], :width => 60) do
  	pdf.text "Proc Code :", :align => :left, :style => :bold
end
pdf.bounding_box([80,630], :width => 60) do
	if !@proc.nil?
  		pdf.text "#{@proc.job_code}", :align => :left
	end
end

pdf.bounding_box([150,630], :width => 70) do
  	pdf.text "Procedure :", :align => :left, :style => :bold
end
pdf.bounding_box([220,630], :width => 330) do
  	if !@proc.nil?
		pdf.text "#{@proc.description}", :align => :left
	end
end

pdf.bounding_box([10,610], :width => 530, :height => 110) do
	pdf.stroke_bounds
end

pdf.bounding_box([15,600], :width => 60) do
  	pdf.text "Date Start :", :align => :left, :style => :bold
end
pdf.bounding_box([80,600], :width => 60) do
  	pdf.text "#{@maintreport.start_date}", :align => :left
end

pdf.bounding_box([150,600], :width => 100) do
  	pdf.text "Date Completed :", :align => :left, :style => :bold
end
pdf.bounding_box([250,600], :width => 330) do
  	pdf.text "#{@maintreport.done_date}", :align => :left
end

pdf.bounding_box([15,585], :width => 150) do
  	pdf.text "Additional Notes :", :align => :left, :style => :bold
end
pdf.bounding_box([15,570], :width => 500, :height => 70) do
  	pdf.text "#{@maintreport.add_notes}", :align => :left
end

pdf.bounding_box([10,500], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 495], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Parts", :align => :center, :style => :bold
end

pdf.bounding_box([30,475], :width => 70) do
  	pdf.text "Part No", :align => :left, :style => :bold
end
pdf.bounding_box([120,475], :width => 70) do
  	pdf.text "Part Name", :align => :left, :style => :bold
end
pdf.bounding_box([450,475], :width => 70) do
  	pdf.text "Quantity", :align => :center, :style => :bold
end

@mp = Planworkpart.find(:all, :conditions => ["maintreport_id=?", @maintreport.id], :order => "part_id ASC")

pdf.float do	
	pdf.bounding_box([15,460], :width => 100, :height => 150) do
		@i = 1
		for parts in @mp
			@pt = parts.part_id
			@c = Part.find(:first, :conditions => ["id=?", @pt])
			pdf.text "#{@i}.   #{@c.part_code}"
			@i = @i + 1
		end
	end
end
pdf.float do	
	pdf.bounding_box([120,460], :width => 300, :height => 150) do
		for pn in @mp
			@p = pn.part_id
			@n = Part.find(:first, :conditions => ["id=?", @p])
			pdf.text "#{@n.name}"
		end
	end
end
pdf.float do	
	pdf.bounding_box([450,460], :width => 70, :height => 150) do
		for mq in @mp
			pdf.text "#{mq.quantity}", :align => :center
		end
	end
end

pdf.bounding_box([10,310], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 305], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Tools & Facilities", :align => :center, :style => :bold
end

pdf.bounding_box([30,280], :width => 70) do
  	pdf.text "Code", :align => :left, :style => :bold
end
pdf.bounding_box([120,280], :width => 70) do
  	pdf.text "Name", :align => :left, :style => :bold
end

pdf.float do	
	pdf.bounding_box([15,265], :width => 100, :height => 150) do
		@i = 1
		for tools in @maintreport.tools
			pdf.text "#{@i}.   #{tools.tool_code}"
			@i = @i + 1
		end
	end
end
pdf.float do	
	pdf.bounding_box([120,265], :width => 300, :height => 150) do
		for tools in @maintreport.tools
			pdf.text "#{tools.name}"
		end
	end
end

pdf.bounding_box([10,115], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 110], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Man Hour Types & Group", :align => :center, :style => :bold
end

pdf.bounding_box([30,90], :width => 70) do
  	pdf.text "Code", :align => :left, :style => :bold
end
pdf.bounding_box([120,90], :width => 70) do
  	pdf.text "Group Name", :align => :left, :style => :bold
end
pdf.bounding_box([450,90], :width => 70) do
  	pdf.text "Man-hours", :align => :center, :style => :bold
end

@mh = Planworkhour.find(:all, :conditions => ["maintreport_id=?", @maintreport.id], :order => "maintgroup_id ASC")

pdf.float do	
	pdf.bounding_box([15,75], :width => 100, :height => 75) do
		@i = 1
		for hc in @mh
			@hd = hc.maintgroup_id
			@cd = Maintgroup.find(:first, :conditions => ["id=?", @hd])
			pdf.text "#{@i}.   #{@cd.short_name}"
			@i = @i + 1
		end
	end
end
pdf.float do	
	pdf.bounding_box([120,75], :width => 300, :height => 75) do
		for hn in @mh
			@hid = hn.maintgroup_id
			@gn = Maintgroup.find(:first, :conditions => ["id=?", @hid])
			pdf.text "#{@gn.name}"
		end
	end
end
pdf.float do	
	pdf.bounding_box([450,75], :width => 70, :height => 75) do
		for hq in @mh
			pdf.text "#{hq.hours}",:align => :center
		end
	end
end