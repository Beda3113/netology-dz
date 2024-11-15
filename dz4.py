import psycopg2

def create_db(conn):
    with conn.cursor() as cur:

        cur.execute("""
        CREATE TABLE IF NOT EXISTS clients (
            id SERIAL PRIMARY KEY,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            email VARCHAR(100) UNIQUE NOT NULL
        );
        """)

        cur.execute("""
        CREATE TABLE IF NOT EXISTS phones (
            id SERIAL PRIMARY KEY,
            client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
            phone VARCHAR(15) UNIQUE NOT NULL
        );
        """)
        conn.commit()

def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO clients (first_name, last_name, email) VALUES (%s, %s, %s) RETURNING id;",
                    (first_name, last_name, email))
        client_id = cur.fetchone()[0]

        if phones:
            for phone in phones:
                add_phone(conn, client_id, phone)

        conn.commit()
        return client_id

def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO phones (client_id, phone) VALUES (%s, %s);",
                    (client_id, phone))
        conn.commit()

def change_client(conn, client_id, first_name=None, last_name=None, email=None):
    with conn.cursor() as cur:
        if first_name:
            cur.execute("UPDATE clients SET first_name=%s WHERE id=%s;", (first_name, client_id))
        if last_name:
            cur.execute("UPDATE clients SET last_name=%s WHERE id=%s;", (last_name, client_id))
        if email:
            cur.execute("UPDATE clients SET email=%s WHERE id=%s;", (email, client_id))
        conn.commit()

def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("DELETE FROM phones WHERE client_id=%s AND phone=%s;", (client_id, phone))
        conn.commit()

def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("DELETE FROM clients WHERE id=%s;", (client_id,))
        conn.commit()

def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        query = "SELECT c.id, c.first_name, c.last_name, c.email FROM clients c"
        conditions = []

        if first_name:
            conditions.append("c.first_name ILIKE %s")
        if last_name:
            conditions.append("c.last_name ILIKE %s")
        if email:
            conditions.append("c.email ILIKE %s")

        if phone:
            query += " JOIN phones p ON c.id = p.client_id"
            conditions.append("p.phone ILIKE %s")

        if conditions:
            query += " WHERE " + " AND ".join(conditions)

        params = [param for param in [first_name, last_name, email, phone] if param]

        cur.execute(query, params)
        return cur.fetchall()

if __name__ == "__main__":
    with psycopg2.connect(database="clients_db", user="postgres", password="postgres") as conn:
        create_db(conn)

        client_id = add_client(conn, 'ben', 'Doe', 'ben.doe@example.com', ['1234567890', '0987654321'])
        print(f"Added client with ID: {client_id}")

        add_phone(conn, client_id, '1112223333')

        change_client(conn, client_id, email='ben.new@example.com')

        found_clients = find_client(conn, first_name='ben')
