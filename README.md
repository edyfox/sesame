# Sesame

Sesame is a project designed to enhance the security of a Linux server by
dynamically managing network connections using `ip-tables`. This project aims to
minimize the exposure of the SSH port to potential exploit attempts by keeping
it hidden unless explicitly needed.

## Features

Sesame has three main components:
1. **Script for Named Pipe Commands**:
    - Listens to line input from a named pipe.
    - Opens a specific port by accepting SYN packets when a certain command is
      received.
    - Reverts to dropping all SYN packets with another command, preventing new
      connections.
2. **Interactive Shell Script**:
    - Users can run `sesame open`, `sesame close`, and `sesame status` to manage
      and check the server's state.
3. **PHP Web Interface**:
    - Provides a web page with a password input box and "Open" and "Close"
      buttons.
    - Allows users to toggle the server status using a web interface.

## Installation

### Prerequisites

- Linux server with `ip-tables` installed.
- PHP and a web server (e.g., Apache) for the web interface.

## Security

- Ensure the named pipe and scripts have appropriate permissions to prevent
  unauthorized access.
- Use strong passphrases for the PHP web interface to protect against
  unauthorized access.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request
with your changes. For major changes, please open an issue first to discuss what
you would like to change.

## License

This project is licensed under GNU General Public License, Version 3. See the
[LICENSE](LICENSE) file for details.
