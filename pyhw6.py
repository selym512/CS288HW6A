import sys
import xml.dom.minidom
import csv
document = xml.dom.minidom.parse(sys.argv[1])
tableElements = document.getElementsByTagName('table')
data = []
names = []
for tr in tableElements[2].getElementsByTagName('a'):
	data.append(tr.childNodes[0].nodeValue)
	#print(str(tr.childNodes[0].nodeValue))
for table in tableElements[2].getElementsByTagName('td'):
	#for td in table.getElementsByTagName('td'):
	if table.nodeType == table.TEXT_NODE:
		data.append(table.nodeValue)

with open('data.csv', 'w') as csvfile:
	filewriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
	for x in data:
		filewriter.writerow([x])
		
