module ActionsHelper

  def base_link(title, path, options = {})
    options.reverse_merge!(
      css: "mt-6 btn inline-block text-blue-600"
    )

    link_to title, path, class: options[:css]
  end

  def base_turbo_link( title, path, options = {})
    options.reverse_merge!(
      css: "rounded-lg bg-blue-600 px-5 py-3 text-white",
      data: { turbo_stream: true }
    )

    content = link_to title, path,
       data: options[:data],
       class: options[:css]

    return content unless options[:turbo_frame]

    turbo_frame_tag(options[:turbo_frame]) { content }
  end

  def row_turbo_link(title, path, options = {})
    options.merge!(css: "text-blue-600")

    base_turbo_link(title, path, options)
  end

  def row_edit_turbo_link(title, path, options = {})
    options.merge!(css: "text-blue-600")

    base_turbo_link( title, path, options)
  end

  def row_delete_turbo_button(title, path, options = {})
    options.reverse_merge!(
      css: "text-red-600 hover:text-red-700 cursor-pointer",
      confirm: "Are you sure?"
    )

    button_to title, path,
       method: :delete,
       class: options[:css],
       form: { class: "inline" },
       data: {
         turbo_confirm: options[:confirm],
         turbo_stream: true
       }
  end

  def back_turbo_link ( title, path, options = {})
    options.reverse_merge!(
      css: "mt-6 btn inline-block text-blue-600",
    )

    base_turbo_link(title, path, options)
  end

  def create_turbo_link( title, path,  options = {})
    options.reverse_merge!(
      css: "rounded-lg bg-blue-600 px-5 py-3 text-white"
    )

    base_turbo_link(title, path, options)
  end

  def edit_turbo_link( title, path,  options = {})
    options.reverse_merge!(
      css: "rounded-lg bg-blue-600 px-5 py-3 text-white"
    )

    base_turbo_link(title, path, options)
  end

  def form_submit(form)
    content_tag("div") do
      form.submit class: "rounded-lg bg-blue-600 px-6 py-3 text-white hover:bg-red-700"
    end
  end
end
