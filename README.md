Minecraft puppet module
=======================

This intention of this module is that it should be able to manage multiple minecraft servers, each with a different config.

Parameters:
All the usual parameters that can be found in the server.properties file with the only difference that the '-' are changed to '_'.
Other not so usual parameters:
- base_url:
  This is the url that is used to download the minecraft_server.jar file.
- eula:
  This is the value in the eula.txt file, it is default set to 'false' as by changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
- group:
  The group to run the minecraft server under.
  Values: 'true','false'.
- user:
  The user to run the minecraft server under.
- user_home:
  The home directory for the user.
- version:
  The minecraft version to install.

Example uses:

The most simple usecase:
As the port and the version need to be defined.

```puppet
minecraft { 'minecraft-1.8.1':
  server_port => '25565',
  version     => '1.8.1',
}
```

Usecase with different config parameters:

```puppet
minecraft { 'minecraft-1.8.1-creative':
  gamemode    => '1',
  server_port => '25566',
  version     => '1.8.1',
}
```

Usecase with different user:

```puppet
minecraft { 'minecraft-1.8.1':
  group       => 'somegroup',
  user        => 'someuser',
  user_home   => '/opt/minecraft',
  server_port => '25565',
  version     => '1.8.1',
}
```