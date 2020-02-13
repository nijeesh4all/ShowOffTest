class Widget < ShowoffRecord
  attr_accessor :name,
                :description,
                :kind,
                :user,
                :images,
                :id,
                :owner


  def attributes
    {
        kind: kind,
        name: name,
        description: description
    }
  end

  def self.all(user_id:nil, visibility:'', term:'')
    if user_id
      response = ShowoffService::Widget.user_all(user_id: user_id, search_term: term )
    else
      response = ShowoffService::Widget.visible(term)
    end
    widgets = []
    if response
      widgets = response["data"]["widgets"].map { |attrs| Widget.new(attrs) }
      widgets.map { |widget| widget.user = User.new(widget.user) }
    end
    widgets
  end

end