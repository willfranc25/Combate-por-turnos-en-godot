extends Node2D



var stats = Stats.new({
	"hp":  300,
	"hp_max": 300,
	"defence": 5,
	"attack": 10,
	"spd": 10,
	"magic": 10,
})
var growth_rates = {
	"hp_max": 1.2,    # Tasa de crecimiento para puntos de vida
	"attack": 1.5,   # Tasa de crecimiento para fuerza
	"defence": 1.2,
	"spd": 1.1,   # Tasa de crecimiento para velocidad
	"magic": 1.3    # Tasa de crecimiento para inteligencia
}

var health_stat = stats.get_base("hp")

func level_up(growth_rates):
	for stat in growth_rates.keys():
		stats[stat] += growth_rates[stat]
	update_stats()

func _on_button_pressed():
	stats.level_up(growth_rates)
	$Label.text = "Level Up! Stats: " + str(stats.get_base("attack"))
func update_stats():
	# Aquí puedes realizar cualquier lógica adicional después de un aumento de nivel.
	# Esto puede incluir actualizar la interfaz de usuario, mostrar efectos visuales, etc.
	print("Level Up! Stats: ", stats)

# Función para realizar una acción de ataque
func attack(target):
	var damage = stats.mget("attack") - target.mget("attack")
	target.health_stat -= damage

# Función para verificar si un personaje ha perdido
func is_dead():
	return health_stat <= 0

# Lógica de turno
func process_turn(player, enemy):
	if not is_dead():
		# Lógica para el jugador
		if player:
			# Lógica para que el jugador seleccione una acción y un objetivo

			# Ejemplo de ataque
			attack(enemy)

		# Lógica para enemigos (IA básica)
		else:
			# Lógica de la IA para seleccionar una acción y un objetivo

			# Ejemplo de ataque del enemigo
			attack(player)

# Lógica para la batalla principal
func battle_logic():
	while not is_battle_over():
		for character in characters:
			character.process_turn()

# Lógica para verificar si la batalla ha terminado
func is_battle_over():
	# Implementa la lógica según tus condiciones (por ejemplo, todos los enemigos derrotados o todos los jugadores derrotados)
	return true
