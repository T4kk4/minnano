class ParagraphRender < Redcarpet::Render::HTML
  def paragraph(text)
    %(<p class="p-article-detail__txt">#{text}</p>)
  end
end