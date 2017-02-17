$postmark_client = Postmark::ApiClient.new(ENV['POSTMARK_API_TOKEN'])

def send_email(to, subj, html_body)
  $postmark_client.deliver(
    from: 'sella@rafaeli.net',
    to: to,
    subject: subj,
    html_body: html_body,
    track_opens: true
  )
end

def send_default_email #for testing
  subj = "test subject #{Time.now}"
  send_email('sella.rafaeli@gmail.com', subj, '<strong>Hello</strong> dear Postmark user.')
end

