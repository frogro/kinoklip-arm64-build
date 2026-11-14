# SPDX-License-Identifier: GPL-3.0-or-later
# Ubuntu 24.04 Qt 6.4 instantiates QPointer<CompSession>::data() from the inline
# comparison in KeyframesPanel.h. Several translation units only see the forward
# declaration. Pre-include the EXISTING upstream definition, without editing the
# upstream source. Apply after project() so compiler detection remains untouched.
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:SHELL:-include ${CMAKE_SOURCE_DIR}/src/ui/comp/CompSession.h>")
