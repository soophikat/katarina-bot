
> [!IMPORTANT]
> _Katarina bot isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing Riot Games properties. Riot Games, and all associated properties are trademarks or registered trademarks of Riot Games, Inc._



> [!NOTE]
> 
>  - [Install](#Install)
>  - [Features](#Features)
> 	 - [Discord management features](#Discord%20management%20features)
> 	 - [League](#League)


## Install
**Configure the environment variables first.** For local development, create a `.env` file based on `.env-example`.

```bash
node i
#or
bun i
#or equivalent
```
### scripts
**Note**: scripts uses `node` runtime by default, change it if you want to.

`npm run deploy`
to deploy the commands to the bot, commands on the folder 'dev' will only be deployed to the server specified on .env GUILD_ID, commands on others folders will be deployed to all servers. 

`npm run server`
starts the bot on foreground 

`npm run deamon`
**Note**: You will need to install the "forever" package locally or globally manually, I didn't include on the dependencies since It gives some security warnings

starts the server as a deamon (background)

`npm run deamon-stop`
stops the deamon. 

### .env 

 **setup the .env according to .env-example**

`BOT_TOKEN` - refers to the bot's token given by discord when you create a bot

`CLIENT_ID` - refers to the Id of the bot

`GUILD_ID` - refers to the guild (server) used for development.

`RIOT_TOKEN`- refers to the token given by riot to use riot api.

`DATABASE_URL` - PostgreSQL connection string, for example:

`DATABASE_URL="postgresql://user:password@hostname:5432/database?schema=public"`

### Docker

The image executes `prisma migrate deploy`, deploys the Discord commands, and then runs the bot in the foreground. This happens each time the container starts. The database is not included in the image; it must already be running and reachable through `DATABASE_URL`.

Build the image:

```bash
docker build -t katarina-bot .
```

Run it using the variables in your local `.env` file:

```bash
docker run -d --name katarina-bot --restart unless-stopped --env-file .env katarina-bot
```

Set `DATABASE_URL` to an address reachable from the container. For a database running on the same host, `localhost` inside the URL refers to the bot container, not the host.

## Features
### Discord management features
#### Commands

- `/common-role` -  set a "common role", this role will be given to any new members of the server, if the role doesn't exist it will create. If the role already exists make sure that the bot role is higher then it on `Server Settings > Roles`

#### Events

- New member - When a new member joins the server, it will greet the member and add the "common role" to it.


### League
#### Commands
- `/add-player` - adds a new player to the server leaderboard.
	**It takes 2 options**: a required "`game-name`" and an optional "`server`", with "`BR1`" as the default if not provided.

- `/remove-player` - removes a player from the leaderboard.

- `/dance` - Katarina-dancing.gif

	![katarina](./assets/katarina.gif)

- `/leaderboard` - shows the server leaderboard, e.g.

	![leaderboard](./assets/leaderboard.png)



`O_o`
