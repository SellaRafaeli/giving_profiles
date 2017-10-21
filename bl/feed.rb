def my_network_donations 
  users = $users.all(network: cu['network'])
  users = $users.all

  crit = {user_id: {'$in': users.mapo('_id')}}
  opts = {sort: [{created_at: -1}], limit: 1000}
  donations = $donations.all(crit, opts)
end