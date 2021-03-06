module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, '#', :onclick=>"remove_fields(this);return false;")
  end

  def link_to_add_fields(name, f, association, callback=false)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render("questions/#{association.to_s.singularize}_fields", :f => builder)
    end
    link_to(name, '#', onclick: h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", #{callback});return false;"))
  end
end
