#set document(title: "G-Code Viewer — User Manual", author: "Black Sphere Industries")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#set heading(numbering: "1.1")

// Title page
#align(center)[
  #v(3cm)
  #text(size: 28pt, weight: "bold")[G-Code Viewer]
  #v(0.5cm)
  #text(size: 16pt, fill: rgb("#666"))[User Manual]
  #v(1cm)
  #text(size: 12pt)[Black Sphere Industries]
  #v(0.3cm)
  #text(size: 11pt, fill: rgb("#999"))[Version 1.0 --- March 2026]
  #v(3cm)
]
#pagebreak()

#outline(title: "Table of Contents", indent: 1.5em)
#pagebreak()

= Introduction

G-Code Viewer is a Progressive Web App (PWA) developed by Black Sphere Industries for previewing and simulating CNC toolpaths. It parses standard G-code files and renders the resulting toolpaths in both 2D and 3D views, with a full-featured simulation engine for step-by-step or continuous playback.

The application supports the most common G-code commands used in CNC milling and 3D printing, including linear and arc interpolation, tool changes, coordinate systems, and work offsets.

== Key Capabilities

- Parse and validate G-code from text input or file upload
- 2D top-down toolpath visualization with color-coded moves
- 3D perspective toolpath visualization
- Simulation playback with play, pause, stop, step forward, and step back controls
- Adjustable simulation speed (0.01x to 100x)
- Real-time machine state display (X, Y, Z, F, S, T)
- Comprehensive statistics: total distance, cut distance, rapid distance, bounding box, machine time, command count, tool changes, feed rate range
- Tool diameter configuration
- Syntax-highlighted G-code display
- Three built-in example programs
- Export functionality
- File drag-and-drop upload (.nc, .gcode, .tap, .ngc)
- Installable as a PWA
- Dark theme with amber accents

= Getting Started

== Accessing the Application

G-Code Viewer is accessible at its standalone URL or through the BSI Portal app grid. The application runs entirely in the browser with no server-side processing.

== Loading G-Code

There are three ways to load G-code into the viewer:

+ *Paste Tab* --- Paste G-code text directly into the editor textarea, then click "Parse & Render."
+ *Upload Tab* --- Click the upload area or drag and drop a G-code file. Supported formats: `.nc`, `.gcode`, `.tap`, `.ngc`, `.txt`.
+ *Examples* --- Click the "Examples" button in the header to load a built-in example program.

== System Requirements

A modern browser with Canvas API support is required. Three.js is used for 3D rendering. No plugins or extensions are needed.

= Features

== G-Code Parser

The built-in parser processes standard G-code line by line, handling:

=== G-Codes (Preparatory)

#table(
  columns: (1fr, 3fr),
  [*Code*], [*Function*],
  [G0], [Rapid positioning (traverse)],
  [G1], [Linear interpolation (cutting move)],
  [G2], [Clockwise arc interpolation],
  [G3], [Counter-clockwise arc interpolation],
  [G17], [XY plane selection],
  [G18], [XZ plane selection],
  [G19], [YZ plane selection],
  [G20], [Inch units],
  [G21], [Millimeter units],
  [G28], [Return to home position],
  [G54--G59], [Work coordinate system selection],
  [G90], [Absolute positioning mode],
  [G91], [Incremental positioning mode],
  [G92], [Set position (coordinate offset)],
)

=== M-Codes (Machine)

#table(
  columns: (1fr, 3fr),
  [*Code*], [*Function*],
  [M0/M1], [Program stop / optional stop],
  [M2/M30], [Program end],
  [M3], [Spindle on (clockwise)],
  [M4], [Spindle on (counter-clockwise)],
  [M5], [Spindle off],
  [M6], [Tool change],
  [M8], [Coolant on],
  [M9], [Coolant off],
)

=== Address Codes

The parser recognizes X, Y, Z, A, B, C axis positions, I, J, K arc center offsets, F feed rate, S spindle speed, T tool number, and P/Q dwell and cycle parameters.

Comments are stripped (text after `;` or within parentheses).

== Visualization

=== 2D View

The 2D view renders a top-down (XY plane) projection of the toolpath on a Canvas element. Features include:

- Color-coded paths: rapid moves vs. cutting moves.
- Current position indicator during simulation.
- Pan by click-drag and zoom by scroll wheel.
- Tool diameter visualization.

=== 3D View

The 3D view renders the full XYZ toolpath with:

- Perspective projection with orbit controls.
- Color-coded path segments.
- Axis indicators.
- Interactive rotation, zoom, and pan.

Switch between views using the "2D View" and "3D View" tabs.

== Simulation Engine

The simulation engine provides frame-by-frame or continuous playback of the parsed toolpath.

=== Playback Controls

- *Play* --- Start continuous simulation from the current position.
- *Pause* --- Pause the simulation at the current line.
- *Stop* --- Reset the simulation to the beginning.
- *Step Back* --- Move one G-code command backward.
- *Step Forward* --- Advance one G-code command forward.

=== Speed Control

The speed slider adjusts playback rate from 0.01x (very slow, for detailed inspection) to 100x (fast overview). The current speed is displayed next to the slider.

=== Progress Indicator

A progress bar and line counter (e.g., "47/230") show the current position within the G-code program.

== Real-Time State Display

The "Current State" panel shows live machine state during simulation:

- *X, Y, Z* --- Current tool position coordinates.
- *F* --- Active feed rate.
- *S* --- Spindle speed.
- *T* --- Active tool number.

Values update in real time as the simulation advances.

== Statistics

After parsing, the statistics panel displays:

/ Total Distance: Combined length of all tool movements in mm.
/ Cut Distance: Distance of cutting moves (G1, G2, G3) in mm.
/ Rapid Distance: Distance of rapid traverse moves (G0) in mm.
/ Bounding Box: The X, Y, and Z extents of the toolpath in mm.
/ Machine Time: Estimated machining time based on feed rates in seconds.
/ Commands: Total number of G-code lines and count of valid commands.
/ Tool Changes: Number of M6 tool change commands.
/ Feed Rate Range: Minimum and maximum feed rates used in the program.

== Tool Settings

The tool diameter input (default: 3.175 mm) affects the toolpath width rendering in the visualization. Adjust this to match your actual tool for more accurate visual representation.

== Syntax Highlighting

The G-code editor displays parsed code with color-coded syntax:

- G-codes in amber
- M-codes in green
- Coordinates in cyan
- Feed rates in yellow
- Comments in gray

The current simulation line is highlighted with an amber border.

== Export

The Export button in the header allows exporting the visualization or parsed data for use in other applications.

== Built-In Examples

Three example programs are included for quick evaluation:

/ Rectangle Pocket: A simple rectangular pocket milled to depth. Demonstrates linear interpolation and depth stepping.
/ Circle & Drilling: A circular pocket with a drilling pattern. Shows arc interpolation and canned cycles.
/ Contour with Arcs: A complex contour using arc interpolation (G2/G3). Demonstrates clockwise and counter-clockwise arcs.

= User Interface

== Layout

The application uses a three-panel layout:

- *Left panel* (1/3 width) --- G-code editor with Paste and Upload tabs.
- *Center panel* (flexible) --- Visualization canvas with 2D/3D view tabs.
- *Right panel* (320px) --- Simulation controls, tool settings, machine state, and statistics.

== Header

The header bar contains:

- Terminal-style dots (red, yellow, green) for visual identity.
- Application title "G-CODE VIEWER" in amber monospace.
- Export button.
- Examples button for loading built-in programs.

== Theming

The application uses a dark theme with:

- Background: zinc-950 (\#09090b)
- Accent: amber-500 (\#f59e0b)
- Text: zinc-100 (\#e4e4e7)
- Code highlighting with distinct colors for G-codes, M-codes, coordinates, and comments.

= Workflows

== Previewing a CNC Program

+ Open G-Code Viewer.
+ Click the "Upload File" tab.
+ Drag and drop your `.nc` or `.gcode` file onto the drop zone.
+ The G-code is parsed automatically and the toolpath is rendered.
+ Switch between 2D and 3D views to inspect the toolpath.
+ Review statistics for distance, bounding box, and estimated time.

== Step-by-Step Simulation

+ Load a G-code program (paste, upload, or example).
+ Click *Step Forward* to advance one command at a time.
+ Observe the current state panel updating with X, Y, Z positions.
+ The current line is highlighted in the G-code editor.
+ Click *Step Back* to go back and re-examine a move.
+ Use this workflow to debug unexpected tool movements.

== Verifying Feed Rates

+ Load the G-code program.
+ Click *Play* to start the simulation.
+ Watch the F value in the Current State panel.
+ Review the Feed Rate Range in the statistics panel.
+ Verify that feed rates are within your machine's capabilities.

== Checking Bounding Box

+ Load and parse the G-code program.
+ Review the Bounding Box statistics (X, Y, Z extents).
+ Verify that the toolpath fits within your machine's work envelope.
+ Check for unexpected negative coordinates or excessive travel.

= Architecture

This section presents the UML diagrams for the G-Code Viewer application.

== Architecture Overview

#figure(
  image("uml-architecture.svg", width: 100%),
  caption: [System architecture showing the parser, simulation engine, and rendering components.]
)

== Sequence Diagram --- Main Parse and Render Flow

#figure(
  image("uml-seq-main.svg", width: 100%),
  caption: [Sequence diagram showing the G-code parsing, move generation, and canvas rendering flow.]
)

== Sequence Diagram --- File Upload

#figure(
  image("uml-seq-file.svg", width: 100%),
  caption: [Sequence diagram for the file upload and drag-and-drop workflow.]
)

== Sequence Diagram --- Simulation

#figure(
  image("uml-seq-simulation.svg", width: 100%),
  caption: [Sequence diagram showing the simulation playback loop with state updates.]
)

== State Diagram

#figure(
  image("uml-states.svg", width: 100%),
  caption: [State diagram showing parser, simulation, and view mode states.]
)

= Configuration

== Supported File Extensions

The file upload accepts the following extensions:

#table(
  columns: (1fr, 2fr),
  [*Extension*], [*Description*],
  [`.nc`], [Numerical control (standard)],
  [`.gcode`], [G-code (common for 3D printers)],
  [`.tap`], [CNC tap file],
  [`.ngc`], [LinuxCNC native format],
  [`.txt`], [Plain text G-code],
)

== Default Tool Settings

- *Tool Diameter*: 3.175 mm (1/8 inch end mill)
- *Units*: Millimeters (G21 default, switchable via G20)
- *Feed Mode*: Absolute (G90 default)
- *Plane*: XY (G17 default)

= Troubleshooting

== G-Code Not Parsing

- Ensure G-code commands follow standard syntax (e.g., `G1 X10 Y20 F500`).
- Comments must use `;` or parentheses `( )` notation.
- Check for unsupported or proprietary machine codes.
- The parser handles the most common G/M codes; machine-specific extensions may not be recognized.

== 3D View Not Rendering

- Verify that WebGL is enabled in your browser.
- Some older or integrated graphics drivers may not support WebGL. Try updating drivers.
- Check the browser console for rendering errors.

== Simulation Stuttering

- Reduce the simulation speed.
- Large G-code programs (10,000+ lines) may cause slower rendering. Allow time for the initial parse.
- Close other browser tabs to free resources.

== Incorrect Bounding Box

- Verify the correct units mode (G20 for inches, G21 for mm).
- Check for G92 coordinate offsets that may shift the apparent toolpath.
- Arc interpolation (G2/G3) may extend beyond the start/end points.

== File Upload Not Working

- Ensure the file has a supported extension (.nc, .gcode, .tap, .ngc, .txt).
- Check that the file is not empty.
- Try pasting the file contents directly into the Paste tab as a workaround.
