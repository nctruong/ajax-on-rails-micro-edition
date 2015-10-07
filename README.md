# Ajax on Rails (micro edition)

This repository contains source code for [Ajax on Rails (micro
edition)](https://gumroad.com/l/ajax-on-rails) product.

### Documentation

I decided to use this README file and comments in the source code as a
documentation. If something is unclear to you, then please check the
[issues][issues] or open [new one][new-issue]. I will be happy to answer
questions, explain anything unclear in more details and improve the
documentation.

Also do not hesitate to open new issue if something is not working as expected.

### Local development setup

Run the following commands to start the application locally:

```
git clone git@github.com:mrhead/ajax-on-rails-micro-edition.git
cd ajax-on-rails-micro-edition
./bin/setup
rails s
```

Open [http://localhost:3000/](http://localhost:3000/) and play with the
application.

### How it works

This application uses [Server generated JavaScript Responses (SJR)][sjr]. So
when we execute an Ajax action, then server sends us back a JavaScript code,
which is then automatically executed in the browser.

I presume that you are familiar with Model View Controller architecture in
classic (non Ajax) Rails applications. And it stays the same in Ajax
applications. The only difference is that we do not render HTML templates but
JavaScript templates (`js.erb` or `js.coffee` files). Please see
[app/views/\*/\*.js.erb](app/views/) files for commented examples.

Creating new Ajax requests is easy thanks to [jquery-ujs][jquery-ujs]. We can
easily enable Ajax on forms, form elements (e.g. check-boxes) and links. For
forms and links we need to add `remote: true` attribute to them. For form
elements we need to specify `data-url`, `data-remote` and optionally
`data-method` HTML attributes.

#### Forms

```erb
<%= form_for @model, remote: true %>
<% end %>
```

#### Links

```erb
<%= link_to "Delete", model_path(@model), method: :delete, remote: true %>
```

#### Form elements

```erb
<%= check_box_tag dom_id(todo, :checkbox), todo.completed?, todo.completed?, data: { url: toggle_todo_path(todo), method: :post, remote: true } %>
```

### Running tests

Run `rake` to run all tests:

```
Run options: --seed 40140

# Running:

.................

Finished in 7.238512s, 2.3485 runs/s, 3.1774 assertions/s.

17 runs, 23 assertions, 0 failures, 0 errors, 0 skips
```

[sjr]: https://signalvnoise.com/posts/3697-server-generated-javascript-responses
[jquery-ujs]: https://github.com/rails/jquery-ujs
[issues]: https://github.com/mrhead/ajax-on-rails-micro-edition/issues?utf8=%E2%9C%93&q=is%3Aissue
[new-issue]: https://github.com/mrhead/ajax-on-rails-micro-edition/issues/new
