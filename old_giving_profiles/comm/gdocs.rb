GDOCS ||= {
    foo: {
      spreadsheet: "https://docs.google.com/spreadsheets/", 
      json: "https://spreadsheets.google.com/feeds/public/values?alt=json",
      collection: 'foo1'
    },
  }.hwia

get '/admin/pull_gdoc' do
  #return {msg: "ok"}
  require_fields(['uri','col'])
  rows = gdoc_to_rows_arr(params[:uri])
  col  = $mongo.collection(params[:col])
  rows.each {|r| col.add(r) }
  flash.message="Added #{rows.size} items to #{params[:col]}"
  redirect '/admin'
end

def gdoc_to_rows_arr(uri)
  json       = JSON.parse(open(uri).read)['feed']['entry']
  data_cells = json.map { |row| kvs = row.select {|k,v| k.start_with?('gsx$') } } 
  ready_rows = data_cells.map {|row| row = row.map {|k,v| [k.sub('gsx$',''),v['$t'] ]; }.to_h }
  ready_rows
rescue => e
  {msg: e}
end