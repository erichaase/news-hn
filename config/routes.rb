module ReadConstraint
  extend self
  def matches?(request)
    request.request_parameters["attr"] == "read" && request.request_parameters["ids"][/^\d+(,\d+)*$/]
  end
end

module ClickedConstraint
  extend self
  def matches?(request)
    request.request_parameters["attr"] == "clicked"
  end
end

News::Application.routes.draw do
  get 'hn'     => 'articles#index',   :defaults => { type: :hn }
  put 'hn'     => 'articles#read',    :defaults => { type: :hn }, :constraints => ReadConstraint
  put 'hn/:id' => 'articles#clicked', :defaults => { type: :hn }, :constraints => ClickedConstraint
end
