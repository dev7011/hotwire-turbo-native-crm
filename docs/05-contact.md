## Button "New contact" ein-/ ausblenden

## =====  LINKS ======
## data: { turbo_frame: "frame_name" } ersetzt durch: 
    data: { turbo_stream: true },

👉 z.B  (new, edit, delete)

    <%= link_to "New Contact", 
      new_company_contact_path(@company), ♦️ new.turbo_stream.erb
      data: { turbo_stream: true },
      class: "rounded-lg bg-blue-600 px-5 py-3 text-white" %>

    <%= link_to "Edit",
                edit_company_contact_path(@company, contact), ♦️ edit.turbo_stream.erb
                data: { turbo_stream: true },
                class: "text-blue-600" %>

    <%= button_to "Delete",
                  company_contact_path(@company, contact), ♦️ drestroy.turbo_stream.erb
                  method: :delete,
                  form: { class: "inline" },
                  class: "text-red-600",
                  data: {
                    turbo_confirm: "Delete this contact?",
                    turbo_stream: true
                  } %>
    <%= link_to "Cancel", company_contacts_path(@company),
            data: { turbo_stream: true },  ♦️ index.turbo_stream.erb
            class: "mt-4 inline-block text-gray-500" %>     

## =====  VIEW.TURBO_STREAM ======
## turbo_frame_tag ersetzt durch:
  turbo_stream.update, 
  turbo_stream.preappend, 
  turbo_stream.replace

👉 z.B view.turbo_stream.erb

    <%= turbo_stream.update "contact_button_new", "" %>
    <%= turbo_stream.update "contact_form" do %>
    <%= render "form_panel", contact: @contact %>
    <% end %>