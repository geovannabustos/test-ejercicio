@featurePetStore
Feature: Set de Pruebas

    Scenario: Ejecutar set de pruebas
      #Crear Usuario
      * def datosUsuario = read('datosUsuario.json')
      * def usuario = call read('crearUsuario.feature'){id: '#(datosUsuario.id)',username: '#(datosUsuario.username)',firstName: '#(datosUsuario.firstName)',lastName: '#(datosUsuario.lastName)',email: '#(datosUsuario.email)',password: '#(datosUsuario.password)',phone: '#(datosUsuario.phone)',userStatus: '#(datosUsuario.userStatus)'}
      * print "Id Usuario: " + usuario.response.message

      #Buscar el usuario creado
      * def idUsuario = usuario.response.message
      * def usuario = call read('buscarUsuario.feature'){username: '#(datosUsuario.username)'}
      * print "Usuario: " + usuario.response.username

      #Actualizar el nombre y el correo del usuario
      * set datosUsuario.firstName = "Patricia"
      * set datosUsuario.email = "paty@gmail.com"
      * def usuarioActualizado = call read('actualizarUsuario.feature'){id: '#(idUsuario)',username: '#(datosUsuario.username)',firstName: '#(datosUsuario.firstName)',lastName: '#(datosUsuario.lastName)',email: '#(datosUsuario.email)',password: '#(datosUsuario.password)',phone: '#(datosUsuario.phone)',userStatus: '#(datosUsuario.userStatus)'}
      * print "Id Usuario actualizado: " + usuarioActualizado.response.message

      #Buscar el usuario actualizado
      * def usuario = call read('buscarUsuario.feature'){username: '#(datosUsuario.username)'}
      * print "Usuario: " + usuario.response.username

      #Eliminar el usuario
      * def eliminar = call read('eliminarUsuario.feature'){username: '#(datosUsuario.username)'}
      * print "Usuario eliminado: " + eliminar.response.message

