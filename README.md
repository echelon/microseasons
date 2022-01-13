Japanese Microseasons Screensaver
=================================
A Mac screensaver written in Swift. Displays the current
[Japanese microseason](http://www.nippon.com/en/features/h00124/).

This is a good bootstrap project to see how Mac Screensavers are made
and how they can be written in Swift (most web documentation applied
only to Objective-C when I started this project).

Installation
------------
- Clone the repo and open in Xcode. (This was built on Xcode 13.2.1 on
  macOS 11.6.1).
- Click build. You may need to change the signing settings.
- The `Microseasons.saver` file will be dumped in
  `/Users/{you}/Library/Developer/Xcode/DerivedData/Microseasons-{hash}/Build/Products/Debug`.
  - Top Menu > Product > Show Build folder in Finder
- Click to install.


Problems? Did it crash at start?
--------------------------------
If it crashes, you don't have the required fonts installed.

- See which fonts are named in the source. (That appears to be 
  "*Hannotate SC Regular*" at the time of this writing)
- Open the system font dialog and select "Computer".
- If the font is listed but not installed (ie. it's gray instead of black
  in the list), install it.
- If the font isn't in the list, find a new font or change the font in
  the source.

Further debugging
-----------------
- Check the log file when openning the screen saver:
  `tail -f /var/log/system.log`
- Add debugging logs with `NSLog("message")`, configure as screensaver from settings,
  then launch from the command line:
  `/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine`

License
-------
**BSD 4-clause**

Copyright (c) 2017, Brandon Thomas. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:

   This product includes software developed by Brandon Thomas
   (bt@brand.io, echelon@gmail.com).

4. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY COPYRIGHT HOLDER "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
