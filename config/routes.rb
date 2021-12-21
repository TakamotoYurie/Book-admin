Rails.application.routes.draw do
  get "/books/:id", to: "books#show"
  delet "/books/:id", to: "book#destroy"
end
