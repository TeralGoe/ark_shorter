# Cm
class VisitorSerializer < ActiveModel::Serializer
  attributes :shorter, :ip, :country, :visit_time

  def shorter
    object.shorter.code
  end

  def visit_time
    object.created_at
  end
end
