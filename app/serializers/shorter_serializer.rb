# Cm
class ShorterSerializer < ActiveModel::Serializer
  attributes :code, :original_url, :purified_url, :visitors

  def visitors
    object.visitors.map do |visitor|
      {
        ip: visitor.ip,
        country: visitor.country,
        visit_time: visitor.created_at
      }
    end
  end
end
