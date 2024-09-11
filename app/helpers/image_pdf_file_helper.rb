#
module ImagePdfFileHelper
  def load_pdf_file_path(file_path, options = {})
    source = " src='" + file_path + "' "
    load_pdf(source, options)
  end

  def load_pdf_url(pdf_url, options = {})
    source = " src='" + pdf_url + "' "
    load_pdf(source, options)
  end

  def load_pdf_base64(pdf_base64, options = {})
    if pdf_base64.present?
      source = " src='data:application/pdf;base64," + pdf_base64 + "' "
      load_pdf(source, options)
    else
      load_empty_pdf(options)
    end
  end

  def load_file_url(file_url, options = {})
    source = file_url
    load_file(source, options)
  end

  def load_google_viewer_url(file_url, options = {})
    return if file_url.blank?
    google_file_url = "#{ENV['GOOGLE_VIEWER_URL']}?url=#{file_url}&embedded=true"
    load_pdf_url(google_file_url, options)
  end

  private

  def load_empty_pdf(options)
    height_content = options[:height] || 'auto'
    width_content = options[:width] || '100%'

    html = "<div class='div-pdf-content' id='div-pdf-content-id' "
    html = html + " height='" + "#{height_content}" + "' "
    html = html + " width='" + "#{width_content}" + "' "
    html = html + " > Empty PDF Content</div> "
    html.html_safe
  end

  def load_pdf(source, options = {})
    height_content = options[:height] || 'auto'
    width_content = options[:width] || '100%'

    html = "<iframe class='iframe-pdf-content' id='iframe-pdf-content-id' "
    html = html + " height='" + "#{height_content}" + "' "
    html = html + " width='" + "#{width_content}" + "' "
    html = html + " scrolling='auto' "
    html = html + source
    html = html + " > </iframe> "

    html.html_safe
  end

  def load_file(source, options = {})
    return load_default_image(options) unless source.present?
    ext_name = File.extname(source).split('.').last
    if CommonLib.check_photo_extension(ext_name)
      load_image(source, options)
    elsif CommonLib.pdf_extension?(ext_name)
      load_pdf_url(source, options)
    else
      text_download = options[:text_download] || I18n.t('helpers.links.download')
      link_to text_download, source, target: :blank
    end
  end

  def load_image(source, options = {})
    width_image = options[:width] || 400
    alt_image   = options[:alt] || ''
    height_image   = options[:height] || nil
    id_css      = options[:id] || "thumbnail-#{SecureRandom.hex(6)}"
    class_css   = options[:class] || 'preview-image'
    link_to image_tag(source, width: width_image, height: height_image, alt: alt_image, id: id_css, class: class_css), source, target: :blank
  end

  def load_default_image(options = {})
    width_image = options[:width] || 400
    height_image   = options[:height] || nil
    id_css      = options[:id] || "thumbnail-#{SecureRandom.hex(6)}"
    class_css   = options[:class] || 'image-default'
    image_tag "admin_v2/examples/image-default.png", width: width_image, height: height_image, id: id_css, class: class_css
  end
end
