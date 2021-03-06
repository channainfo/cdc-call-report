module ApplicationHelper
  def index_in_paginate(index)
    page = params[:page].to_i
    offset_page = page > 1 ? page - 1 : 0
    index + Kaminari.config.default_per_page * offset_page
  end

  def page_title(title)
    content_for(:title) { title + " - " + ENV['APP_NAME'] }
  end

  def paginate_for(records)
    content_tag :div, paginate(records, theme: 'twitter-bootstrap-3'), class: 'paginate-nav'
  end

  def errors_for(record)
    content_tag :ul, class: 'record-error' do
      result = ""
      record.errors.full_messages.each do |message|
        result += content_tag('li', message, class: 'record-error-field')
      end
      result.html_safe
    end
  end

  def flash_config
    config = {key: '', value: ''}
    flash.map do |key, value|
      config[:key] = key
      config[:value] = value
    end
    config
  end

  def flash_messages
    trans = { 'alert' => 'alert-danger', 'notice' => 'alert alert-success' }

    content_tag :div, class: 'alert-animate' do
      flash.map do |key, value|
        content_tag 'div', value, class: "alert #{trans[key]} alert-body"
      end.join('.').html_safe
    end
  end

  def breadcrumb options=nil
    content_tag(:ul, breadcrumb_str(options), :class => "breadcrumb")
  end

  def breadcrumb_str options
    items = []
    if(!options.blank?)
      items <<  content_tag(:li, link_home("Home", root_path) , :class => "active")
      options.each do |option|
        items << breadcrumb_node(option.first)
      end
    else
      icon = content_tag "i", " ", :class => "icon-user  icon-home"
      items << content_tag(:li, icon + "Home", :class => "active")
    end
    items.join("").html_safe
  end

  def breadcrumb_node option
    key = option[0]
    value = option[1]
    value ? content_tag(:li){ link_to(key, value)} : content_tag(:li, key, :class =>"active")
  end

  def page_header title, options={},  &block
    content_tag :div,:class => "list-header clearfix" do
      if block_given?
        content_title = content_tag :div, :class => "left" do
          content_tag(:h3, title, :class => "header-title")
        end

        output = with_output_buffer(&block)
        content_link = content_tag(:div, output, {:class => " right"})
        content_title + content_link
      else
        content_tag :div , :class => "" do
          content_tag(:h3, title, :class => "header-title")
        end
      end
    end
  end

  def boolean_text state
    if state
      text = "Yes"
      klass = 'label-primary'
    else
      text = "No"
      klass = "label-danger"
    end
    content_tag :span, text, class: "bool-text label #{klass}"
  end

  def link_destroy value , url, options={}, &block
    link_icon "glyphicon-trash", value, url, "red", options, &block
  end

  def link_edit value , url, options={}, &block
    link_icon "glyphicon-pencil", value, url, 'green', options, &block
  end

  def link_new value , url, options={}, &block
    options ||= {}
    options[:class] = "btn-icon btn btn-primary #{options[:class]}"

    link_icon "glyphicon-plus",  value, url, 'blue', options, &block
  end

  def link_home value, url, options={}, &block
    link_icon "glyphicon glyphicon-home", value, url, 'blue', options, &block

  end

  def link_icon icon, value, url, color='blue', options={}, &block
    options ||= {}
    options[:class] = "btn-icon #{options[:class]}"
    icon = content_tag :i, ' ',  class: "#{icon} glyphicon #{color}"
    text = content_tag :span, " #{value}"
    link_to icon+text, url, options, &block
  end

  def mapping_variables(variables, project_variable)
    variables.each do |variable|
      return variable if variable.verboice_id == project_variable['id'] && variable.verboice_name == project_variable['name']
    end
    nil
  end

  def display_report_variable(report_variable)
    return content_tag(:span, '') unless report_variable

    if report_variable.type == "ReportVariableAudio"
      content_tag(:audio, nil, src: play_audio_report_variable_path(report_variable.token), preload: :none)
    else
      content_tag :span, report_variable.value
    end
  end

  def current_url url, options = {}, format="csv"
     url_components = url.split("?")
     uri = url_components[0]
     url_params = []

     if url_components.size >1
        url_params << url_components[1]
     end

     options.each do |key, value|
         url_params << URI::escape(key)+ "=" + URI::escape(value)
     end
     query_string = url_params.join("&")
     return uri + "." + format if query_string.blank?
     return uri + "." + format + "?" + query_string
  end

  def error_for(resource, field)
    content_tag :span, class: 'error-field' do
      resource.errors[field].first
    end
  end

  def template_params_for selector, template_params = []
    template_params.map do |anchor|
      link_to("{{#{anchor}}}", 'javascript:void(0)', data: {selector: selector}, class: 'param-link')
    end.join(", ").html_safe
  end

end
