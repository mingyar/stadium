# Stadium API

A simple implementation using poison to fetch data from the PokeAPI.

### Create a battle with random pokemons:
````
/api/battle/create
````
### Create a battle with specific pokemons:
````
/api/battle/create?pokemon_id_1={your-pokemon-id}&pokemon_id_2={your-pokemon-id}
````
### Check a battle result:
````
/api/battle/{batle_id}
````
### List all battle results:
````
/api/battles
````
