# ICPS2023_5

PDK for minimal Fab LSI fabricaition at AIST ACPS supporting 1st metal only
SOI CMOS process. Made public since Nov.1, 2023.

Following contents are documented in Technology/doc/PDK_minimalFabSOICMOS.pdf

- Documentation
    * Device/Process Explanation
    * Device Characteristics
    * Design Manual
- Electrical Data
    * SPICE Model 
    * PCELL 
    * DRC/LVS Rule
 
PDK_reference_manual.pdf (in Japanese) is available under Technology/doc.

PDK User Manual (in Japanese) is: 
https://www.dropbox.com/scl/fi/84uzdzux0urhsd05mfxmb/ICPS2023_5-PDKv0.71.paper?rlkey=yuxkk9qneusfwuql2f5dann33&dl=0

PDK installation is just git clone following two packages 
under ~/KLayout/salt (~/.klayout/salt under Linux and MacOS).
1. https://github.com/mineda-support/AnagixLoader.git
2. https://github.com/mineda-support/ICPS2023_5.git

Tutorial for Semicon 2023 Minimaf Fab design contest is available:
https://github.com/mineda-support/Semicon2023-MinimalFab-Design-Contest

Design contest reception period is until Nov. 30, 2023, but you can use 
the document as a tutorial for using the open source minimal fab PDK with open source EDA.

\***************************************************************************<br>
\* Copyright 2023 minimalFab Promoting Organization<br>
\*<br>
\* Licensed under the Apache License, Version 2.0 (the "License");<br>
\* you may not use this file except in compliance with the License.<br>
\* You may obtain a copy of the License at<br>
\*<br>
\*      http://www.apache.org/licenses/LICENSE-2.0<br>
\*<br>
\* Unless required by applicable law or agreed to in writing, software<br>
\* distributed under the License is distributed on an "AS IS" BASIS,<br>
\* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br>
\* See the License for the specific language governing permissions and<br>
\* limitations under the License<br>
