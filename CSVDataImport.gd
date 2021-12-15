# .CSV Data Converter for my Project Manager App
# returns a dictionary with keys, types and data

func open_Dic_from_txtfile(_path):
	var f = File.new()
	var dic = {}
	f.open(_path, File.READ)
	var index = 0
	var keys = []
	var types = []
	var lines = []
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if index == 0:
			keys = line.split(";")
		elif index == 1:
			types = line.split(";")
		if line == "":
			pass
		else:
			var data = line.split(";")
			var converted = []
			if index == 0:
				dic["Keys"] = data
			elif index == 1:
				dic["Types"] = data
			else:
				var valueDic = {}
				var i = 0
				for value in data:
					var t = types[i]
					var v 
					if (t == "int"):
						v = int(value)
					elif (t == "str"):
						v = str(value)
					elif (t == "color"):
						var cA = value.split("#")
						v = Color(cA[0],cA[1],cA[2],cA[3])
					converted.append(v)
					valueDic[keys[i]] = v
					i += 1
				lines.append(valueDic)
				 
		index += 1
	f.close()
	dic["Data"] = lines
	return dic
