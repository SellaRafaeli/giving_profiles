HTTP_TIMEOUT = 5

# GET, POST 

def http_get(route, headers = {})
  Timeout::timeout(HTTP_TIMEOUT) { RestClient.get(route, headers) } 
rescue => e 
  {err: e.to_s, status: e.to_s}.to_json
end

def http_post(route, data = {}, headers = {})
  Timeout::timeout(HTTP_TIMEOUT) { RestClient.post(route, data, headers) }   
rescue => e 
  {err: e.to_s, status: e.to_s}.to_json
end

### JSON

def http_post_json(route, data = {}, headers = {})
  headers.merge!({content_type: :json, accept: :json})
  JSON.parse http_post(route, data, headers)
end

def http_get_json(route, headers = {})
  headers.merge!({content_type: :json, accept: :json})
  JSON.parse http_get(route, headers)
end

get '/comm/http/refresh' do
  :refresh_this_file
end