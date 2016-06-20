
def application(environ, start_response):
  start_response('200 OK', [('Content-Type', 'text/plain')])
  parameters = environ['QUERY_STRING']
  return [parameters.replace("&", "\n") + "\n"]

