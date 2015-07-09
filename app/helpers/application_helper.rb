module ApplicationHelper
  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def back_to(path)
    params[:return_to] || path
  end

  def state_select(f,options={})
    if f.object.country_id
      states = ISO3166::Country.find_country_by_alpha2(f.object.country_id.to_s).states.collect {|k,v| [v['name'],k]}
    else
      states = {'Choose a Country and save, then edit this project.' => ''}
      options.merge!({disabled: 'disabled'})
    end
    f.select(:state, states.to_h,{},options)
  end

end
