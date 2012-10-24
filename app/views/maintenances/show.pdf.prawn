pdf.repeat :all do
   # header
	pdf.bounding_box([10,720], :width => 530, :height => 40) do
  		pdf.stroke_bounds
	end
	pdf.bounding_box ([pdf.bounds.left, 710], :width  => pdf.bounds.width, :height => 40) do
       pdf.font "Helvetica"
		pdf.font_size 12
       pdf.text "Planned Maintenance", :align => :center, :style => :bold
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
pdf.bounding_box([80,670], :width => 60) do
  	pdf.text "#{@maintenance.code}", :align => :left
end

pdf.bounding_box([150,670], :width => 70) do
  	pdf.text "Description :", :align => :left, :style => :bold
end
pdf.bounding_box([220,670], :width => 300) do
  	pdf.text "#{@maintenance.description}", :align => :left
end

pdf.bounding_box([15,640], :width => 60) do
  	pdf.text "Comp No :", :align => :left, :style => :bold
end
pdf.bounding_box([80,640], :width => 60) do
  	pdf.text "#{@maintenance.component.comp_code}", :align => :left
end

pdf.bounding_box([150,640], :width => 70) do
  	pdf.text "Comp Name :", :align => :left, :style => :bold
end
pdf.bounding_box([220,640], :width => 330) do
  	pdf.text "#{@maintenance.component.comp_name}", :align => :left
end

pdf.bounding_box([15,620], :width => 60) do
  	pdf.text "Frequency :", :align => :left, :style => :bold
end
pdf.bounding_box([80,620], :width => 60) do
  	pdf.text "#{@maintenance.frequency} #{@maintenance.periodicity}", :align => :left
end

pdf.bounding_box([150,620], :width => 70) do
  	pdf.text "Priority :", :align => :left, :style => :bold
end
pdf.bounding_box([220,620], :width => 330) do
  	pdf.text "#{@maintenance.priority}", :align => :left
end

pdf.bounding_box([15,600], :width => 65) do
  	pdf.text "Maint Level :", :align => :left, :style => :bold
end
pdf.bounding_box([80,600], :width => 60) do
  	pdf.text "#{@maintenance.level}", :align => :left
end

pdf.bounding_box([150,600], :width => 70) do
  	pdf.text "Action Group :", :align => :left, :style => :bold
end
pdf.bounding_box([225,600], :width => 330) do
  	pdf.text "#{@maintenance.action_group_details}", :align => :left
end

pdf.bounding_box([15,580], :width => 60) do
  	pdf.text "Next Date :", :align => :left, :style => :bold
end
pdf.bounding_box([80,580], :width => 60) do
  	pdf.text "#{@maintenance.next_date}", :align => :left
end

pdf.bounding_box([150,580], :width => 70) do
  	pdf.text "Next Hour :", :align => :left, :style => :bold
end
pdf.bounding_box([220,580], :width => 330) do
  	pdf.text "#{@maintenance.next_hour}", :align => :left
end

pdf.bounding_box([15,560], :width => 60) do
  	pdf.text "Proc Code :", :align => :left, :style => :bold
end
pdf.bounding_box([80,560], :width => 60) do
  	pdf.text "#{@maintenance.jobdesc.job_code}", :align => :left
end

pdf.bounding_box([150,560], :width => 70) do
  	pdf.text "Procedure :", :align => :left, :style => :bold
end
pdf.bounding_box([220,560], :width => 330) do
  	pdf.text "#{@maintenance.jobdesc.description}", :align => :left
end

pdf.bounding_box([10,540], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 535], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Parts", :align => :center, :style => :bold
end

pdf.bounding_box([30,515], :width => 70) do
  	pdf.text "Part No", :align => :left, :style => :bold
end
pdf.bounding_box([120,515], :width => 70) do
  	pdf.text "Part Name", :align => :left, :style => :bold
end
pdf.bounding_box([450,515], :width => 70) do
  	pdf.text "Quantity", :align => :center, :style => :bold
end

@mp = Maintpart.find(:all, :conditions => ["maintenance_id=?", @maintenance.id], :order => "part_id ASC")

pdf.float do	
	pdf.bounding_box([15,500], :width => 100, :height => 150) do
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
	pdf.bounding_box([120,500], :width => 300, :height => 150) do
		for pn in @mp
			@p = pn.part_id
			@n = Part.find(:first, :conditions => ["id=?", @p])
			pdf.text "#{@n.name}"
		end
	end
end
pdf.float do	
	pdf.bounding_box([450,500], :width => 70, :height => 150) do
		for mq in @mp
			pdf.text "#{mq.quantity}", :align => :center
		end
	end
end

pdf.bounding_box([10,345], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 340], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Tools & Facilities", :align => :center, :style => :bold
end

pdf.bounding_box([30,320], :width => 70) do
  	pdf.text "Code", :align => :left, :style => :bold
end
pdf.bounding_box([120,320], :width => 70) do
  	pdf.text "Name", :align => :left, :style => :bold
end

pdf.float do	
	pdf.bounding_box([15,305], :width => 100, :height => 150) do
		@i = 1
		for tools in @maintenance.tools
			pdf.text "#{@i}.   #{tools.tool_code}"
			@i = @i + 1
		end
	end
end
pdf.float do	
	pdf.bounding_box([120,305], :width => 300, :height => 150) do
		for tools in @maintenance.tools
			pdf.text "#{tools.name}"
		end
	end
end

pdf.bounding_box([10,145], :width => 530, :height => 20) do
	pdf.stroke_bounds
end
pdf.bounding_box ([pdf.bounds.left, 140], :width  => pdf.bounds.width, :height => 10) do
    pdf.text "Man Hour Types & Group", :align => :center, :style => :bold
end

pdf.bounding_box([30,120], :width => 70) do
  	pdf.text "Code", :align => :left, :style => :bold
end
pdf.bounding_box([120,120], :width => 70) do
  	pdf.text "Group Name", :align => :left, :style => :bold
end
pdf.bounding_box([450,120], :width => 70) do
  	pdf.text "Man-hours", :align => :center, :style => :bold
end

@mh = Mainthour.find(:all, :conditions => ["maintenance_id=?", @maintenance.id], :order => "maintgroup_id ASC")

pdf.float do	
	pdf.bounding_box([15,105], :width => 100, :height => 100) do
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
	pdf.bounding_box([120,105], :width => 300, :height => 100) do
		for hn in @mh
			@hid = hn.maintgroup_id
			@gn = Maintgroup.find(:first, :conditions => ["id=?", @hid])
			pdf.text "#{@gn.name}"
		end
	end
end
pdf.float do	
	pdf.bounding_box([450,105], :width => 70, :height => 100) do
		for hq in @mh
			pdf.text "#{hq.hours}",:align => :center
		end
	end
end