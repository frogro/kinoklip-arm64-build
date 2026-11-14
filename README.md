# Unofficial Kinoklip ARM64 build experiment

Build automation for **unchanged** [Kinoklip](https://github.com/SeniorMatt/kinoklip)
1.8.0, commit `95a0580d0a4a4e900614d1bfeb5386ca2e3a589b`.
This repository is not the official Kinoklip project and is not endorsed by it.
It contains no modified application source or copied logos.

The workflow runs natively on Ubuntu 24.04 ARM64, with Qt 6, FFmpeg and optional
HEIF/RAW libraries from Ubuntu. It uses the upstream CMake option to disable KDE
Frameworks 6. No kernel changes are required. Background removal using optional
ONNX Runtime is unavailable unless that library is supplied.

### Ubuntu compiler compatibility setting

The first ARM64 run failed at `KeyframesPanel.h:88`: Qt 6.4's `QPointer` comparison
instantiated a cast to the incomplete forward-declared `CompSession` class.
`compat.cmake` uses CMake's project-include hook to pass GCC `-include` for the
existing upstream `src/ui/comp/CompSession.h` before C++ translation units. This
supplies the complete definition without editing any upstream source file or
disabling compiler diagnostics. The complete build configuration is archived
alongside every result. This is a build workaround, not an upstream source fix.

## Licence and source

Upstream code is GPL-3.0-or-later. Upstream name/logo permissions are separately
defined by `logo-license.md`; they permit unchanged copies and require replacing
marks in modified application forks. This experiment leaves application source
unchanged. If application changes are needed, rebranding must precede sharing
modified builds. Existing copyright notices remain intact.

Every draft result includes the complete exact upstream source archive, these
build scripts, provenance, checksums, build dependency versions and logs.
The binary archive includes the upstream GPL text, mark licence and attributions.
System dependencies are dynamically linked, not redistributed in this archive.
Build scripts in this repository are licensed under GPL-3.0-or-later; see LICENSE.

## Test scope and use

CLI, project, media probing and export tests run headlessly. Inspect test logs for
skipped hardware-dependent cases. Passing them does not establish that Asahi/M1
or Radeon graphics, video acceleration, multiple displays or suspend work.
Upstream media fixtures are generated explicitly before the suite: the CLI
round-trip test expects them to exist but does not generate them itself.
Artifacts stay in draft releases until assessed. Compilation/test failures retain
diagnostic results and must not be described as successful builds.

The binary archive is a test directory, not an AppImage or installer. Extract it
to a new directory and run `./bin/kinoklip` from the Ubuntu desktop. The target
must provide compatible Ubuntu 24.04 ARM64 Qt 6/FFmpeg libraries; consult the
included `runtime-libraries.txt`. Do not replace system libraries to force a match.
Before installing dependencies on the Mac, inspect its OS/library versions.
Compare M1 and Radeon with a small local clip, check playback and an exported
file. No automatic reboot, installation or changes to the working system occur.
