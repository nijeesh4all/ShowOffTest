class Widget < ShowoffRecord
  attr_accessor :name, :description, :kind, :user,
                :images, :id, :owner

  def attributes
    {
      kind: kind,
      name: name,
      description: description
    }
  end

  def self.all(user_id: nil, term: '')
    response = user_id ?
                 ShowoffService::Widget.user_all(user_id: user_id, search_term: term) :
                 ShowoffService::Widget.visible(term)
    widgets = []
    if response
      widgets = response["data"]["widgets"].map { |attrs| Widget.new(attrs) }
      widgets.map { |widget| widget.user = User.new(widget.user) }
    end
    widgets
  end
end