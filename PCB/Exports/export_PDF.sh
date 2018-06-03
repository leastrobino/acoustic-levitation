#!/bin/sh
cd "`dirname "$0"`"
if [ -f acoustic_levitation_main-F.Cu.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_main_pcb.pdf acoustic_levitation_main-F.Cu.ps acoustic_levitation_main-B.Cu.ps acoustic_levitation_main-F.SilkS.ps acoustic_levitation_main-B.SilkS.ps acoustic_levitation_main-F.Mask.ps acoustic_levitation_main-B.Mask.ps -c "<</CropBox [145 268 451 574] /PAGES pdfmark <</Title () /Producer (KiCAD PDF) /DOCINFO pdfmark"
fi
if [ -f acoustic_levitation_wing-F.Cu.ps ]; then
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/All -sOutputFile=acoustic_levitation_wing_pcb.pdf acoustic_levitation_wing-F.Cu.ps acoustic_levitation_wing-B.Cu.ps acoustic_levitation_wing-F.SilkS.ps acoustic_levitation_wing-B.SilkS.ps acoustic_levitation_wing-F.Mask.ps acoustic_levitation_wing-B.Mask.ps -c "<</CropBox [237 253 362 589] /PAGES pdfmark <</Title () /Producer (KiCAD PDF) /DOCINFO pdfmark"
fi
rm acoustic_levitation_main-*.ps acoustic_levitation_wing-*.ps
