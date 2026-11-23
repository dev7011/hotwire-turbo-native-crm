♦️ Hotwire turbo
   https://turbo.hotwired.dev/reference/streams
   repository: crm_native

## ================   VIEW   =============
## 1a index.html.erb
    👉 hinzufügrn 
        data: { turbo_frame: "company_form" }	Link lädt die Antwort in dieses Frame.
        turbo_frame_tag "company_form"	Zielbereich für das Formular.
        id="companies"	Identifiziert die Tabellenzeilen für spätere Turbo Stream Updates.
    
    # index.html.erb
      <div class="mx-auto max-w-6xl p-8">
          <div class="mb-8 flex items-center justify-between">
            <h1 class="text-3xl font-bold">Companies</h1> 
            <%= link_to "New Company",
                        new_company_path, 
                        data: { turbo_frame: "company_form" }, ♦️hinzufügen♦️
                        class: "rounded-lg bg-blue-600 px-5 py-3 text-white" %>
          </div>

        <%= turbo_frame_tag "company_form" %>  ♦️hinzufügen♦️

        <div class="mt-8 overflow-hidden rounded-xl border bg-white">
          <table class="w-full text-left">
            ..........  
            <tbody id="companies"> ♦️hinzufügen♦️
              <%= render @companies %>
            </tbody>
          </table>
        </div>
      </div>

## 1b new.html.ebr
    <%= turbo_frame_tag "company_form" do %> ♦️hinzufügen♦️
      <div class="w-full mx-auto max-w-2xl p-8 bg-amber-300">
        <h1 class="mb-6 text-3xl font-bold">
          New Company
        </h1>
        <%= render "form", company: @company %>
        <%= link_to "Back", companies_path,
                    data: { turbo_frame: "company_form" }, ♦️hinzufügen♦️
                    class: "mt-6 inline-block text-blue-600" %>
      </div>
    <% end %>

## 1c create.turbo_stream.erb
    <%= turbo_stream.prepend "companies", @company %>
    <%= turbo_stream.update "company_form", "" %>

## ================   xxx.turbo_stream.erb   =============
   new_turbor_stream.erb: form öffen
   create_turbor_stream.erb: new speichern
   index_turbor_stream.erb: back, companies_path
      👉turbo update

         <%= turbo_stream.update "company_button_new" do %>
         <%= render "button_new" %>
         <% end %> 
         <%= turbo_stream.update "company_form", "" %>

## ================   CONTROLLER   =============
## 2. controller
    def create
      @company = Company.new(company_params)
      if @company.save
        respond_to do |format|
          ......
          format.turbo_stream
        end
      else
        respond_to do |format|
          ......
          format.turbo_stream
        end
      end
    end

📕wenn button ausgeblenden werden soll
   👉es muss turbo_stream sein: data: { turbo_stream: true }, ♦️hinzufügen♦️
   
   ## index.html.erb
   <%= turbo_frame_tag "company_button_new" %>
      <%= link_to "New Company",
         new_company_path,
         data: { turbo_stream: true }
         class: "rounded-lg bg-blue-600 px-5 py-3 text-white" %>
   <% end %>
   
   ## new.turbo_stream.erb
      <%= turbo_stream.update "company_button_new", "" %> ♦️leer inhalt

      <%= turbo_stream.update "company_form" do %>
         ## render inhalt   
      <% end %>

## ======= ERKLÄREN ======== 
      ♦️um ein turbo_stream zu ändern, erstellen, muss es in view xxx.turbo_stream 
       durchführen  
      
      👉 z,b create.turbo_stream.erb / new.turbo_stream.erb / destroy.turbo_stream.erb
      <%= turbo_stream.remove dom_id(@company) %>

      ♦️ist gleich wie (z.B @company.id = 15)
      <turbo-stream action="remove" target="company_15">
        <template></template>
      </turbo-stream>

## STEP BY STEP:

      1. button, um die action aufzurufen
   
      <%= link_to "Back", companies_path, ♦️back => index.turbo_stream♦️
        data: { turbo_frame: "company_form" }, ♦️nur unter frame ♦️
        class: "mt-6 inline-block text-blue-600" %>
   
      <%= link_to "New Company",
         new_company_path,
         data: { turbo_stream: true }, ♦️suche komplet html ♦️
         class: "rounded-lg bg-blue-600 px-5 py-3 text-white" %>
   
      2. Der entsprechende  view.turbo_stream.erb ausgerufen und erstzen den Inhalt
         
            <%= turbo_stream.update "company_button_new", "" %>
      
            <%= turbo_stream.update "company_form" do %>
                 <div class="w-full mx-auto rounded-2xl bg-zinc-100 mb-4 p-12">
                   <h1 class="mb-6 text-3xl font-bold">
                     New Company
                   </h1>
                   <%= render "form", company: @company %>
                   <%= render "button_back" %>
                 </div>
            <% end %>
   
            <%= turbo_stream.remove dom_id(@company) %>  ♦️ suche DOM mit id="company_xxx"