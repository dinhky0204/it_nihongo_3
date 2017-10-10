module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-dismissable alert-info"
      when 'success' then "alert alert-dismissable alert-success"
      when 'error' then "alert alert-dismissable alert-danger"
      when 'alert' then "alert alert-dismissable alert-danger"
    end
  end

  def current_user?(user)
    return user == current_user;
  end
  def markdown content
    options = {
        autolink: true,
        no_intra_emphasis: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        quote: true,
        highlight: true,
        tables: true,
        emoji: true
    }

    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
        .render content
  end
end
