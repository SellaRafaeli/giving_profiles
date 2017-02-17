TEN_SECONDS = 10
ONE_HOUR_IN_SECONDS = 3600
ONE_WEEK_IN_SECONDS = ONE_HOUR_IN_SECONDS * 24 * 7

$redis = ($prod ? Redis.new(url: ENV['REDIS_URL']) : Redis.new) rescue OpenStruct.new

# all keys and values are strings. 
# $redis.set(key, val)
# $redis.get(key)
# $redis.setex(key, expiry_in_seconds, val)

get '/redis/set' do 
  $redis.setex(params[:key],TEN_SECONDS,params[:val])
  {msg: "ok"}
end

get '/redis/get' do
  {val: $redis.get(params[:key])}
end