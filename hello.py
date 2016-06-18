from urlparse import parse_qs

def application(environ, start_response):
  start_response('200 OK', [('Content-Type', 'text/plain')])
  parameters = environ['QUERY_STRING']
  parsed = parse_qs(parameters)
  reply = ''
  for key in parsed.keys():
    for value in parsed[key]:
      reply = reply + str(key) + '=' + str(value) + '\n'
  return [reply]

