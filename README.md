# Roblox Double Jump Script

A clean, modular client-side **Double Jump script** for Roblox. Features a simple configuration table where you can easily customize jump heights or toggle the double jump feature on and off.

## Features
- **Toggleable:** Easily enable or disable the double jump feature via the `CONFIG` table (`DoubleJump = true/false`).
- **Physics-Based:** Uses modern `AssemblyLinearVelocity` and gravity calculations for a smooth, natural mid-air boost.
- **Configurable Heights:** Set custom jump heights and limits safely.
- **Client-Side Execution:** Handled smoothly on the client for instant responsiveness.

## Setup & Installation

1. Open your place in **Roblox Studio**.
2. Insert a **LocalScript** into **StarterPlayer ➔ StarterPlayerScripts** (or **StarterCharacterScripts**).
3. Paste the code from `DoubleJumpClient.lua` into the script.
4. Adjust the `CONFIG` settings at the top of the script to fit your game's preferences.

## License

This project is open-source and available under the [MIT License](LICENSE).
