# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Comuna.create([{nombre: 'Cerrillos'}, {nombre: 'Cerro Navia'}, {nombre: 'Conchalí'},{nombre: 'El Bosque'},{nombre: 'Estación Central'},
               {nombre: 'Huechuraba'},{nombre: 'Independencia'},{nombre: 'La Cisterna'},{nombre: 'La Florida'},{nombre: 'La Pintana'},
               {nombre: 'La Granja'},{nombre: 'La Reina'},{nombre: 'Las Condes'},{nombre: 'Lo Barnechea'},{nombre: 'Lo Espejo'},{nombre: 'Lo Prado'},
               {nombre: 'Macul'},{nombre: 'Maipú'},{nombre: 'Ñuñoa'},{nombre: 'Pedro Aguirre Cerda'},{nombre: 'Peñalolén'},{nombre: 'Providencia'},
               {nombre: 'Pudahuel'},{nombre: 'Quilicura'},{nombre: 'Quinta Normal'},{nombre: 'Recoleta'},{nombre: 'Renca'},{nombre: 'San Miguel'},
               {nombre: 'San Joaquín'},{nombre: 'San Ramón'},{nombre: 'Santiago'},{nombre: 'Vitacura'}])

Gusto.create([{nombre: "Voleyball", descripcion: "Juego tradicional y playa", tipo: "Deporte"},{nombre: "Basquetball", descripcion: "", tipo: "Deporte"},
              {nombre: "Futbol", descripcion: "", tipo: "Deporte"},{nombre: "Natación", descripcion: "Todos los estilos", tipo: "Deporte"},
              {nombre: "Rock", descripcion: "Desde Elvis hasta la actualidad", tipo: "Musica"},{nombre: "Pop", descripcion: "Todos los artistas del género", tipo: "Musica"},
              {nombre: "Indie", descripcion: "Música distinta", tipo: "Musica"},{nombre: "Kpop", descripcion: "Desde Korea hasta tus audífonos", tipo: "Musica"},
              {nombre: "Pastas", descripcion: "Una de las mejores comidas italianas", tipo: "Comida"},{nombre: "Pizza", descripcion: "Apta para cualquier ocasión", tipo: "Comida"},
              {nombre: "Sushi", descripcion: "Desde Japón a tu plato", tipo: "Comida"},{nombre: "Thai", descripcion: "Agridulce y delicioso", tipo: "Comida"},
              {nombre: "Acción", descripcion: "Batallas y explosiones", tipo: "Genero de pelicula"},{nombre: "Comedia", descripcion: "Para reir a carcajadas", tipo: "Genero de pelicula"},
              {nombre: "Románticas", descripcion: "Reir, llorar y amar", tipo: "Genero de pelicula"},{nombre: "Independiente", descripcion: "Para abrir la mente y pasar el tiempo", tipo: "Genero de pelicula"}])
 	      	     
         