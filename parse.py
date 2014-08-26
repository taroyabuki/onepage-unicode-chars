import xml.sax
import sys
import re

class Handler(xml.sax.handler.ContentHandler):
  def startElement(self, name, attrs):
    if name == 'char':
      if not p.match(attrs.get('gc')):
        cp = int(attrs.get('cp'), 16)
        print('%d &#x%x;<br />' % (cp, cp))

p = re.compile('^(C|Z[lp])')
parser = xml.sax.make_parser()
parser.setContentHandler(Handler())
parser.parse(sys.stdin)
