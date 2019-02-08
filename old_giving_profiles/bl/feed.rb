def my_network_donations 
  #users = $users.all(network: cu['network'])
  users = $users.all

  crit = {user_id: {'$in': users.mapo('_id')}}
  opts = {sort: [{created_at: -1}], limit: 1000}
  donations = $donations.all(crit, opts)[0..100]
  
  donations = donations.reject {|don| 
    (don['user_id']!=cuid) && ((don['private'].to_s == 'true') || is_org_id_private(don['org_id'],don['user_id']))    
  }
  donations
end

def my_donated_orgs
  org_ids  = user_donations(cuid).mapo('org_id')
  orgs     = $orgs.get_many(_id: {'$in': org_ids})
end

# def my_feed_pages
#   #return ['wwe', 'wwf'] * 3
#   my_donated_orgs
# end

get '/refresh' do :refresh end