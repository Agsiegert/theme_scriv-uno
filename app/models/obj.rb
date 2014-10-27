class Obj < ::Scrivito::BasicObj

  def breadcrumbs
    objects = self.ancestors.split(self.homepage.parent).second.presence || []
    objects + [self]
    #objects.select { |object| object.show_in_navigation? }
  end

  def headline
    self[:headline].presence || self.title || ""
  end

  def homepage
    #TODO: improve
    if self[:_path] == "/"
      return Obj.find_by_path("/en")
    end
    if self.is_a?(Homepage)
      self
    else
      self.ancestors.select{|o| o.is_a?(Homepage)}.first
    end
  end

  def show_in_navigation?
    if self.respond_to?('show_in_navigation') && self.show_in_navigation != "yes"
      false
    else
      true    
    end
  end

  def valid_widget_classes_for(field_name)
    if field_name == "full_slider"
      %w(ElasticSliderWidget)
    end
  end


end

