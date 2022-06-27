class CustomRender < Redcarpet::Render::HTML
  # ![代替テキスト](画像のURL "caption=100x100")
  def image(link, size, alt_text)
    markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(render_options = {link_attributes: { rel: 'nofollow', target: "_blank" }})
    )
    caption = size.split('=')[0]
    if caption.present?
      if caption.slice(0..1) == 'q：'
        %(<figure>
        <img loading="lazy" alt="#{alt_text}" src="#{link}">
        <figcaption class="quote">出典：#{markdown.render(caption.gsub('q：')).gsub('<p>', '').gsub('</p>', '')}</figcaption>
      </figure>)

      elsif caption.slice(0..1) == 'q:'
        %(<figure>
        <img loading="lazy" alt="#{alt_text}" src="#{link}">
        <figcaption class="quote">出典：#{markdown.render(caption.gsub('q:', '')).gsub('<p>', '').gsub('</p>', '')}</figcaption>
      </figure>)
      else
        %(<figure>
        <img loading="lazy" alt="#{alt_text}" src="#{link}">
        <figcaption>#{caption}</figcaption>
      </figure>)
      end
    else
      %(<figure>
        <img loading="lazy" alt="#{alt_text}" src="#{link}">
      </figure>)
    end
  end

  def list(content, _)
    %(<ul class="p-article-detail__list">#{content}</ul>)
  end

  def list_item(content, _)
    %(<li class="p-article-detail__item"><span>#{content}</span></li>)
  end

  # def table(header, body)
  #   %(<div class="p-article-detail__head">
  #       <div class="p-article-detail__scroll">
  #         <table>
  #           <thead>#{header}</thead>
  #           <tbody>#{body}</tbody>
  #         </table>
  #       </div>
  #    </div>)
  # end
  #
  # def table_row(content)
  #   %(<tr>#{content}</tr>)
  # end
  #
  # def table_cell(content, alignment)
  #   return %(<td>#{content}</td>) if alignment
  #   %(<th>#{content}</th>)
  # end
end
