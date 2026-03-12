# XML Parser Script (Bash)

## Description

This is a Bash script that allows you to read and write XML elements directly from the terminal.  
It provides a simple menu-driven interface with two main operations:

- **Read an element:** Retrieve the value of a specific XML element from a file.
- **Write an element:** Add or update an XML element with a given value in a file.

---

## Features

- Search for an element and display its value if it exists.
- Detect if an element is a parent element (without direct value).
- Update the value of an existing element.
- Add a new element before the root closing tag if it does not exist.
- Basic error handling (missing root, invalid option, etc.).

---

## Usage

1. Make the script executable:

```bash
chmod +x xml_parser.sh
