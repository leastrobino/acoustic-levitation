#!/bin/sh
cd "`dirname "$0"`"
if [ -f acoustic_levitation_main.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_main_sch.pdf acoustic_levitation_main.ps "piezo_x6-Piezo A.ps" "piezo_x6-Piezo B.ps" "piezo_x6-Piezo C.ps" "piezo_x6-Piezo D.ps" "piezo_x6-Piezo E.ps" "piezo_x6-Piezo F.ps" "conn_x14-Wing conn. 1.ps" "conn_x14-Wing conn. 2.ps" "conn_x14-Wing conn. 3.ps" "conn_x14-Wing conn. 4.ps" power-Power.ps -c "<</Title (Acoustic levitation) /Author (Léa Strobino) /DOCINFO pdfmark"
fi
if [ -f acoustic_levitation_wing.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_wing_sch.pdf acoustic_levitation_wing.ps "piezo_x7-Piezo A.ps" "piezo_x7-Piezo B.ps" -c "<</Title (Acoustic levitation) /Author (Léa Strobino) /DOCINFO pdfmark"
fi
if [ -f acoustic_levitation_main-F.Cu.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_main_pcb.pdf acoustic_levitation_main-F.Cu.ps acoustic_levitation_main-B.Cu.ps acoustic_levitation_main-F.SilkS.ps acoustic_levitation_main-B.SilkS.ps acoustic_levitation_main-F.Mask.ps acoustic_levitation_main-B.Mask.ps -c "<</CropBox [145 268 451 574] /PAGES pdfmark <</Title (Acoustic levitation) /Author (Léa Strobino) /DOCINFO pdfmark"
fi
if [ -f acoustic_levitation_wing-F.Cu.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_wing_pcb.pdf acoustic_levitation_wing-F.Cu.ps acoustic_levitation_wing-B.Cu.ps acoustic_levitation_wing-F.SilkS.ps acoustic_levitation_wing-B.SilkS.ps acoustic_levitation_wing-F.Mask.ps acoustic_levitation_wing-B.Mask.ps -c "<</CropBox [237 253 362 589] /PAGES pdfmark <</Title (Acoustic levitation) /Author (Léa Strobino) /DOCINFO pdfmark"
fi
rm *.ps
