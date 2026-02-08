# G-Code Viewer

A web-based 3D visualization tool for G-code files used in CNC machining and 3D printing operations.

## Features

- **3D Toolpath Rendering**: Visualize complete CNC and 3D printer toolpaths in three dimensions
- **G-code Parsing**: Comprehensive parsing of standard G-code syntax
- **File Upload**: Load G-code files via drag-and-drop or file picker
- **Interactive Viewing**:
  - Rotate and zoom toolpath visualization
  - Pan to explore different areas
  - Adjust viewing angle for optimal inspection
- **Simulation Preview**: Preview the exact machine operations before execution
- **Color Coding**: Visual distinction between different G-code commands
- **Performance Optimized**: Smooth rendering even for large G-code files

## Tech Stack

- **HTML5** - Semantic markup
- **JavaScript** - G-code parsing and application logic
- **Three.js** - 3D visualization and rendering
- **PWA** - Progressive Web App capabilities

## Getting Started

### Online Demo
Visit the live application: [https://arnoutzw.github.io/g-code-viewer/](https://arnoutzw.github.io/g-code-viewer/)

### Local Installation
Simply open `index.html` in a modern web browser. No build tools or dependencies required.

### Usage
1. Open the application in your browser
2. Drag and drop a G-code file onto the viewer, or use the file picker
3. Use mouse controls to navigate the 3D visualization:
   - Left-click + drag to rotate
   - Scroll to zoom in/out
   - Right-click + drag to pan
4. Inspect the toolpath before running on your CNC machine or 3D printer
5. Verify machine movements and detect potential collisions

## Browser Support

Requires a modern browser with WebGL support (Chrome, Firefox, Edge, Safari)

## License

MIT License - See LICENSE file for details
