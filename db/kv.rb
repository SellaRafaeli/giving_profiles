$kv = $mongo.collection('kv')

def kv_set(key,data)
  $kv.update_id(key, data, {upsert: true})
end

def kv_get(key)
  $kv.get(key).hwia rescue {}
end

get '/foo' do :refresh_true end