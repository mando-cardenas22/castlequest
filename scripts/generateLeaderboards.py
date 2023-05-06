import psycopg2


con = psycopg2.connect(
    host='localhost',
    database='castlequest',
    user='castlequest_admin',
    password='Woodruff1787')

print('''Updating leaderboards(top_players,top_player_guild_xp)''')
cursor=con.cursor()
cursor.execute('REFRESH MATERIALIZED VIEW top_players', 'REFRESH MATERIALIZED VIEW top_player_guild_xp')
print('''Top player leaderboads updated''' )
print('''Top player within each guild leaderboads updated''' )

