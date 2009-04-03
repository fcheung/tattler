# Tattler
class ActionView::Template
  def render_template_with_comment(*args)
    "<!-- TEMPLATE: #{self.relative_path} -->\n" + render_template_without_comment(*args) + "\n<!-- ENDTEMPLATE: #{self.relative_path} -->"
  end
  alias_method_chain :render_template, :comment
end