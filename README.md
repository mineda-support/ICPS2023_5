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

PDK User Manual is: 
https://www.dropbox.com/scl/fi/84uzdzux0urhsd05mfxmb/ICPS2023_5-PDK-Users-Manual-v1.05.paper?rlkey=04jeibh2hrzlrlx4x9h5ghp4s&dl=0
https://www.dropbox.com/scl/fi/xpbs2515cgc8ptyq67hix/ICPS2023_5-PDKv1.05.paper?rlkey=twak2s8lfh915b38o76o038q5&dl=0 (日本語版 in Japanese) 

PDK installation is just git clone following two packages 
under \~/KLayout/salt (\~/.klayout/salt under Linux and MacOS).
1. https://github.com/mineda-support/AnagixLoader.git
2. https://github.com/mineda-support/ICPS2023_5.git

Tutorial for Semicon 2023 Minimaf Fab design contest is available:
https://github.com/mineda-support/Semicon2023-MinimalFab-Design-Contest

Design contest reception period is until Nov. 30, 2023, but you can use 
the document as a tutorial for using the open source minimal fab PDK with open source EDA.

Leo Moser-san has kindly written an excellent tutorial titled 'Design of a NAND gate using the ICPS PDK' on his blog page:

https://mole99.uber.space/2024/NAND_tutorial/Design%20of%20a%20NAND%20gate%20using%20the%20ICPS%20PDK.html

His interview with Matt Ven-san is also worth viewing:

https://discordapp.com/channels/1107477879891181639/1162283404008640533/1207705636591374336

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
