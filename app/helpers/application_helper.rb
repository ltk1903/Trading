# 
module ApplicationHelper
  def pending_transaction_count(customer)
    ::PurchaseOrder.waiting_list.where(customer_id: customer&.id).count
  end

  def active_menu(options = {})
    ActiveMenuService.new(controller, options).exec
  end

  def format_date(time, options = {})
    return '' if time.blank?
    time = time.to_date if time.is_a?(String)
    options.present? ? I18n.l(time, format: options[:format]) : I18n.l(time)
  rescue I18n::ArgumentError
    ''
  end

  def format_datetime(time, options = {})
    return '' if time.blank?
    options.present? ? I18n.l(time, options) : I18n.l(time)
  rescue I18n::ArgumentError
    ''
  end

  def format_currency(amount, options = {})
    NumberFormatService.new(amount).to_currency(options)
  end

  def format_number(amount, options = {})
    NumberFormatService.new(amount).with_delimiter(options)
  end

  def vsd_format_number(amount, options = {})
    NumberFormatService.new(amount).with_vsd_format(options)
  end

  def format_percentage(value)
    "#{(value.to_f * 100.0).round(2)}%"
  end

  def format_percentage_for_chart(value)
    (((value.to_f * 100).to_i).to_f / 100.0).to_f
  end

  def unrealized_gain_loss_format_percentage(amount)
    return if amount.blank?
    value = amount.to_f.round(4) == 0 ? amount.abs : amount
    format_percentage(value)
  end

  def appellation_options
    Customer.appellation.options.delete_if { |x| x[1] == 'miss' }
  end

  def sex_options
    Customer.sex.options
  end

  def investor_type_options
    RegistrationForm.investor_type.options
  end

  def locales_options
    @languages = I18n.available_locales.map(&:to_s).map {|v| [I18n.t("helpers.label.language.#{v}"), v]}
  end

  def account_type_available_options
    available_options = RegistrationForm.account_type.options
  end

  def span_boolean(bool)
    label = bool ? 'On' : 'Off'
    cls = bool ? 'label-success' : 'label-default'
    content_tag :span, label, class: "label #{cls}"
  end

  def span_percentage(ratio)
    cls = 'color-light-text text-normal'
    txt = if ratio.to_f > 0
            cls = 'color-success text-success high'
            "+#{format_percentage(ratio)}"
          elsif ratio.to_f < 0
            cls = 'color-danger text-danger low'
            "-#{format_percentage(ratio.to_f.abs)}"
          else
            "#{format_percentage(ratio.to_f.abs)}"
          end

    content_tag :span, txt, class: "nav-cert-percent #{cls}"
  end

  def select2_collection_with_prompt(collection)
     [collection[0].class.new(id: nil, code: nil, name: nil)] + collection.to_a
  end

  def system_alert_flash
    system_alert = SystemAlert.active.order(created_at: :asc).last
    system_alert&.content
  end

  def active_fund_tab(fund_code, options = {})
    active_class = options[:active_class] || 'active'
    fund_code_default    = FundService::FetchFund.new.fund_default&.code
    return active_class if params[:fund_code].nil? && fund_code == fund_code_default
    fund_code == params[:fund_code] ? active_class : ''
  end

  def active_language_tab(locale)
    I18n.locale == locale.to_sym ? 'active' : ''
  end

  def fund_options(funds)
    funds.collect{ |u| ["#{u.code_text} - #{u.name}", u.code.downcase] }
  end

  def mobile_view_logo_url
    '/images/logo.png'
  end

  def logo_url
    '/images/logo-white.jpg'
  end

  def vsd_investor_template_url
    template = Resource.find_by(resource_type: :vsd_investor_template)
    template.present? ? template.file_url : "#{root_path}files/vsd_investor_template.xlsx"
  end

  def public_image_url(image_path)
    ENV['PUBLIC_IMAGE_DOMAIN_URL'] + image_path + '?auto=format'
  end

  def support_mailto_link(fund_code)
    email_address = case fund_code.to_s.upcase
    when 'VCAMBF'
      FundService::FetchFund.new.vcambf&.contact_email
    when 'VCAMFI'
      FundService::FetchFund.new.vcamfi&.contact_email
    else
      ENV['CONTACT_VIETCAPITAL_EMAIL']
    end

    link_to email_address, "mailto:#{email_address}"
  end

  def mailto_link(email, options = {})
    link_to email, "mailto:#{email}", class: options[:class]
  end

  def reference_link_to(name, url, options = {}, &block)
    # options = options.merge(target: :_blank)
    if block_given?
      link_to(url, options, &block)
    else
      link_to(name, url, options, &block)
    end
  end

  def reference_button_link_to(name, url, style, options = {}, &block)
    css_class = me_css_class(style, options)
    css_class = css_class + "button-link-to__block"
    options = options.merge(class: css_class)
    if block_given?
      link_to(url, options, &block)
    else
      link_to(name, url, options, &block)
    end
  end

  def reference_big_button_link_to(name, url, style, options = {}, &block)
    css_class = me_css_class(style, options)
    css_class = css_class + "big-button-link-to__block"
    options = options.merge(class: css_class)
    if block_given?
      link_to(url, options, &block)
    else
      link_to(name, url, options, &block)
    end
  end

  def reference_button_link_to_with_icon_arrow(name, url, style, options = {}, &block)
    css_class = me_css_class(style, options)
    css_class = css_class + "button-link-to__block_icon_arrow"
    options = options.merge(class: css_class)
    html_name = "<span class='button-link-to__icon-text'>" + name + "</span>"
    html_name = html_name + "<span>"
    html_name = html_name + "<svg xmlns='http://www.w3.org/2000/svg' width='8' height='12' viewBox='0 0 8 12' fill='none' class='submit-button-btn__icon-arrow'>"
    html_name = html_name + "<path d='M1 1L6 6L1 11' stroke='#FFFFFF' stroke-width='2'/>"
    html_name = html_name + "</svg>"
    html_name = html_name + "</span>"

    if block_given?
      link_to(url, options, &block)
    else
      link_to(html_name.html_safe, url, options, &block)
    end
  end


  def reference_submit_button(name, style_type, options = {})
    css_class = me_css_class(style_type, options)
    css_class = css_class + "submit-button-btn__block"

    html_name = "<button class='#{css_class}' type='submit'>"
    html_name = html_name + "<span class='button-btn__icon-text'>" + name + "</span>"
    html_name = html_name + "</button>"
    html_name.html_safe
  end

  def reference_submit_button_with_arrow_icon(name, style_type, options = {})
    css_class = me_css_class(style_type, options)
    css_class = css_class + "submit-button-link-to__block_icon_arrow"

    html_name = "<button class='#{css_class}' type='submit'>"
    html_name = html_name + "<span class='submit-button-btn__icon-text'>" + name + "</span>"
    html_name = html_name + "<span>"
    html_name = html_name + "<svg xmlns='http://www.w3.org/2000/svg' width='8' height='12' viewBox='0 0 8 12' fill='none' class='submit-button-btn__icon-arrow'>"
    html_name = html_name + "<path d='M1 1L6 6L1 11' stroke='#FFFFFF' stroke-width='3'/>"
    html_name = html_name + "</svg>"
    html_name = html_name + "</span>"
    html_name = html_name + "</button>"
    html_name.html_safe
  end


  def me_css_class(style_type, options = {})
    css_class = " btn me-btn "
    css_class = css_class + " " +  options[:class] if options[:class].present?

    case style_type
    when "primary"
      css_class = css_class + " btn-primary "
    when "success"
      css_class = css_class + " btn-success "
    when "danger"
      css_class = css_class + " btn-danger "
    when "warning"
      css_class = css_class + " btn-warning "
    when "light"
      css_class = css_class + " btn-light "
    else
      css_class = css_class + " btn-link "
    end
    css_class
  end

  def checkmark
    "&#10004;".html_safe
  end

  def language_text(locale)
    return if locale.blank?
    I18n.t("helpers.label.view_language_text.#{locale}")
  end

  def language_key(locale)
    return if locale.blank?
    I18n.t("helpers.label.view_language_key.#{locale}")
  end
end
