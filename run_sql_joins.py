import sqlite3

def run_query(conn, query, title):
    print(f"\n--- {title} ---")
    cursor = conn.execute(query)
    cols = [description[0] for description in cursor.description]
    rows = cursor.fetchall()
    print(cols)
    for row in rows:
        print(row)

def main():
    db_file = input("Enter SQLite database file (e.g., task5.db): ")

    conn = sqlite3.connect(db_file)

    queries = {
        "INNER JOIN": """
            SELECT Customers.name, Orders.product, Orders.amount
            FROM Customers
            INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
        """,
        "LEFT JOIN": """
            SELECT Customers.name, Orders.product, Orders.amount
            FROM Customers
            LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
        """,
        "RIGHT JOIN (simulated)": """
            SELECT Customers.name, Orders.product, Orders.amount
            FROM Orders
            LEFT JOIN Customers ON Customers.customer_id = Orders.customer_id;
        """,
        "FULL OUTER JOIN (simulated)": """
            SELECT Customers.name, Orders.product, Orders.amount
            FROM Customers
            LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
            UNION
            SELECT Customers.name, Orders.product, Orders.amount
            FROM Orders
            LEFT JOIN Customers ON Customers.customer_id = Orders.customer_id;
        """
    }

    for title, query in queries.items():
        run_query(conn, query, title)

    conn.close()

if __name__ == "__main__":
    main()
