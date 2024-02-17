# UI Module Modeling

## Summary

This module is responsible for taking information from most other modules in order to communicate it on-screen in the form of a HUD. It also handles interactivity on menus.

## Data

- Most data is received from other modules on the fly
- Screen coordinates of where to draw things
- Color to draw things in
- Information about how to draw text
- Order to draw UI elements in, if applicable

## Functionality

- Receive information and pass it into its drawing functions
- Draw graphics
- Draw text
- Draw buttons on menus
- Handle button inputs
- Pass messages to other modules to transition from menus to other game states