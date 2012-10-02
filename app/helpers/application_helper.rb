# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def ringgols(money)
    number_to_currency(money, :unit => "RM ", :separator => ".", :delimiter => ",", :precision => 2)
  end
  

  def link_to_remove_fields(name, f)
      f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    errors = Array(instance.error_message).join(',')
    %(#{html_tag}<span class="validation-error">&nbsp;#{errors}</span>).html_safe
  end
  
end
