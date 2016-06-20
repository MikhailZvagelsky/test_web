from urlparse import parse_qs

def application(environ, start_response):
  start_response('200 OK', [('Content-Type', 'text/plain')])
  parameters = parse_qs(environ['QUERY_STRING'])
  reply = ''
  for key in parameters.keys():
    for value in parameters[key]:
      reply = reply + str(key) + '=' + str(value) + '\n'
  return [reply]

