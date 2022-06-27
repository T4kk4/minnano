class DefaultRender < Redcarpet::Render::HTML
  def paragraph(text)
    %(<p class="p-detail__txt">#{text}</p>)
  end
end