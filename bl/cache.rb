$cache = $mongo.collection('cache')

def cache_set(key,data)
  $cache.update_id(key, data, {upsert: true})
end

def cache_get(key)
  $cache.get(key).hwia rescue nil
end

get '/cache' do :refresh_true end