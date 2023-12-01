extends Resource
class_name Stats

var growth_rates = {
	"hp": 1.2,    # Tasa de crecimiento para puntos de vida
	"str": 1.5,   # Tasa de crecimiento para fuerza
	"spd": 1.1,   # Tasa de crecimiento para velocidad
	"int": 1.3    # Tasa de crecimiento para inteligencia
}


var mBase = {}
var mModifiers = {}
var mLevel = 1  # Nuevo atributo para el nivel

# Método _init para inicializar la instancia de la clase
func _init(stats):
	mBase = {}
	mModifiers = {}
	mLevel = 1  # Inicializar el nivel a 1 por defecto
# Copiar estadísticas proporcionadas (stats) a mBase
	mBase = stats.duplicate()
	#for key in stats.keys():
	#	mBase[key] = stats[key]

# Método para obtener el valor base de una estadística específica
func get_base(id):
	return mBase[id]
	
# Agregar un modificador a una estadística
func add_modifier(id, modifier):
	mModifiers[id] = {"add": modifier.add if "add" in modifier else {},
	"mult": modifier.mult if "mult" in modifier else {}}
	
# Eliminar un modificador de una estadística
func remove_modifier(id):
	mModifiers.erase(id)

# Obtener el valor modificado de una estadística
func mget(id):
	var total = mBase[id] if id in mBase else 0
	var multiplier = 0
	
	for k in mModifiers.keys():
		var v = mModifiers[k]
		total += v["add"][id] if id in v["add"] else 0
		multiplier += v["mult"][id] if id in v["mult"] else 0
	return total + (total * multiplier)

#Editar estadistica base
func bset(id, value):
	mBase[id] = value

# Método para subir de nivel y aumentar estadísticas
func level_up(growth_rates):
	mLevel += 1

	# Asegúrate de que growth_rates sea un diccionario con tasas de crecimiento para cada estadística
	if not growth_rates is Dictionary:
		# Lanza una excepción si growth_rates no es un diccionario
		push_error("Se esperaba un diccionario para las tasas de crecimiento.")
		return
	
	for key in mBase.keys():
		var growth_rate
		# Verifica si hay una tasa de crecimiento específica para esta estadística
		if key in growth_rates:
			growth_rate = growth_rates[key]
		else:
			# Si no hay una tasa específica, usa una tasa de crecimiento predeterminada
			growth_rate = 1.0

		# Aplica el aumento según la tasa de crecimiento proporcionada
		mBase[key] += int(mBase[key] * growth_rate)






