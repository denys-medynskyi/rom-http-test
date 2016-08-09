class Users < ROM::Relation[:http]
  gateway :default

  register_as :newspapers

  dataset :newspapers

  def by_id(id)
    append_path(id.to_s)
  end
end