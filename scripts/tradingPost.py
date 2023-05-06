from pickle import TRUE
import psycopg2


con = psycopg2.connect(
    host='localhost',
    database='castlequest',
    user='castlequest_admin',
    password='Woodruff1787')


cursor = con.cursor()


def check_username(username):
    cursor.execute('''SELECT "Player_Username" FROM Public."Player_Table" ''')
    usernames = [row[0] for row in cursor.fetchall()]
    while TRUE:
        if username in usernames:
            print("Username found!")
            return True
        else:
            print("Username not found.")
            return False



#It would be nice to show them their inventory.
def get_player_items(username):
    cursor.execute('''
        SELECT i."Item_Name",i."Price_Gold", pi."Item_Quantity"
        FROM Public."Item_Table" i
        JOIN Public."PlayerItem_Table" pi ON i."Item_ID" = pi."Item_ID"
        JOIN Public."Player_Table" p ON p."Player_ID" = pi."Player_ID"
        WHERE p."Player_Username" = %s
    ''', (username,))
    items =  cursor.fetchall()
    return(items)


def update_player_gold(player_id, new_gold):
    cursor.execute('''UPDATE Public."Player_Table" SET "Player_Gold" = %s WHERE "Player_ID" = %s''', (new_gold, player_id))
    con.commit()
    print("Player's gold balance updated successfully.")


# Use a while loop to prompt the user to input a player name until a match is found


def update_item_quantity(player_id, item_name, new_quantity):
    cursor.execute('''
        UPDATE Public."PlayerItem_Table" AS pit
        SET "Item_Quantity" = %s
        FROM Public."Item_Table" AS it
        WHERE pit."Item_ID" = it."Item_ID"
        AND pit."Player_ID" = %s
        AND it."Item_Name" = %s
    ''', (new_quantity, player_id, item_name))
    con.commit()
    print('''Players Inventory Updated''')


# Use a while loop to prompt the user to input a player name until a match is found
def main():
    # Use a while loop to prompt the user to input a player name until a match is found
    while True:
        username = input("Enter a player username: ")
        if check_username(username):
            break


    # Retrieve the items owned by the player
    player_items = get_player_items(username)


    # Display the items owned by the player
    if player_items:
        print(f"{username} owns the following items:")
        for index, item in enumerate(player_items, start=1):
            item_name, price_gold, quantity = item
            print(f"{index}. Item Name: {item_name}, Gold Value: {price_gold}, Quantity: {quantity}")


        # Prompt the user to select an item to sell
        while True:
            item_number = input("Enter the number of the item to sell (or 'q' to quit): ")
            if item_number.lower() == "q":
                break


            # Check if the entered item number is valid
            if not item_number.isdigit() or int(item_number) < 1 or int(item_number) > len(player_items):
                print("Invalid item number. Please try again.")
                continue


            # Get the item details
            item_name, gold_value, current_quantity = player_items[int(item_number) - 1]


            # Prompt the user to enter the quantity to sell
            while True:
                sell_quantity = input(f"Enter the quantity of {item_name} to sell (or 'q' to quit): ")
                if sell_quantity.lower() == "q":
                    break
                if not sell_quantity.isdigit() or int(sell_quantity) < 1 or int(sell_quantity) > current_quantity:
                    print("Invalid sell quantity. Please try again.")
                    continue


                # Calculate the total gold value from selling the item
               


                # Update the player's gold balance
                cursor.execute('''
                    SELECT "Player_ID", "Player_Gold"
                    FROM Public."Player_Table"
                    WHERE "Player_Username" = %s
                ''', (username,))
                player_data = cursor.fetchone()
                player_id, current_gold = player_data

        # Calculate the new gold balance
                total_gold_value = gold_value * int(sell_quantity)

        # Calculate the new gold balance
                new_gold = current_gold + total_gold_value


        # Update the player's gold balance
                update_player_gold(player_id, new_gold)


                # Update the item quantity
                new_quantity = current_quantity - int(sell_quantity)
                update_item_quantity(player_id, item_name, new_quantity)


                # Update the player_items list with the updated quantity
                player_items[int(item_number) - 1] = (item_name, gold_value, new_quantity)


                print(f"You sold {sell_quantity} {item_name}(s) --- new balance: {new_gold} gold.")


    con.close()


if __name__ == "__main__":
    main()
 
