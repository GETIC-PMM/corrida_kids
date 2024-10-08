


<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
    self.implicit_order_column = :created_at

    # extends ...................................................................
    
    # includes ..................................................................
    audited
    acts_as_paranoid

    include Searchrable

    # security (i.e. attr_accessible) ...........................................
    <% attributes.select(&:token?).each do |attribute| -%>
        has_secure_token<% if attribute.name != "token" %> :<%= attribute.name %><% end %>
    <% end -%>
    
    <% if attributes.any?(&:password_digest?) -%>
    has_secure_password
    <% end -%>
    
    # relationships .............................................................
    <% attributes.select(&:reference?).each do |attribute| -%>
        belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %><%= ', required: true' if attribute.required? %>
    <% end -%>

    # validations ...............................................................
    # callbacks .................................................................
    # scopes ....................................................................
    # additional config .........................................................
    # class methods .............................................................
    # public instance methods ...................................................
    # protected instance methods ................................................
    # private instance methods ..................................................
end
<% end -%>
    