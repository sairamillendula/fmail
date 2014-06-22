require 'xmpp4r_facebook'

id = '-100000078227649@chat.facebook.com'
to = '-642642467@chat.facebook.com'
body = "A16Z Hack"
subject = 'Sent from FMail'
message = Jabber::Message.new to, body
message.subject = subject

client = Jabber::Client.new Jabber::JID.new(id)
client.connect
client.auth_sasl(Jabber::SASL::XFacebookPlatform.new(client, '1426977610916393', 'CAAUR1B2ZA4ikBAJYIVZC6D7atXrnxhHk8IojNS0OJb02Ba5i1pM4lwRZCki7yVB3nxehnVKqCiqpwA6yxqxLZCWJDlRWdKUpZAC3RlRZAH3QvFmzhr4uZB8UgOort2iBBDOInbYDEedPjeUZCQjZBC8n2HYorfkZAx8HhpV06ZCx8qoSuIPNydrKNVIqz0tPfN6ZAeXBUcZA9IajYSgZDZD', 'fb4e7ee2deee330e4bc9efcd0e52f20c'), nil)
client.send message
client.close