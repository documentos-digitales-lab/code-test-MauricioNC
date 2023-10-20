require "faraday"

module CustomersHelper
  def get_user(id)
    conn ||= Faraday.new(url: 'http://httpbingo.org')
    response ||= conn.get("https://dummyjson.com/users/#{id}").body
  end
end
