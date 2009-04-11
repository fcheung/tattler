# Tattler
class ActionView::Template
  def render_template_with_comment(*args)
    render_result = render_template_without_comment(*args)
    if mime_type.nil? || mime_type === [Mime::HTML, Mime::XML]
      "<!-- TEMPLATE: #{self.relative_path} -->\n" + render_result + "\n<!-- ENDTEMPLATE: #{self.relative_path} -->"
    else
      render_result
    end
  end
  alias_method_chain :render_template, :comment
end