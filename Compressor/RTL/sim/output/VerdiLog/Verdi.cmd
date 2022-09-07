debImport "-f" \
          "/home/kkh/AIDC/22.08.02_CORE_ENGINE/RTL/sim/..//sim/tb/filelist.f" \
          "-f" \
          "/home/kkh/AIDC/22.08.02_CORE_ENGINE/RTL/sim/..//rtl/filelist.f" \
          "-i" "simv"
srcTBInvokeSim
wvCreateWindow
wvSetCursor -win $_nWave3 411.318553
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_flag" -line 14 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_flag_valid" -line 15 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_flag" -line 14 -pos 1 -win $_nTrace1
srcSelect -signal "comp_flag_valid" -line 15 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_flag" -line 14 -pos 1 -win $_nTrace1
srcSelect -signal "comp_flag_valid" -line 15 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag_valid"
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -word -line 17 -pos 3 -win $_nTrace1
srcSelect -signal "comp_engine_i_intf" -line 21 -pos 1 -win $_nTrace1
srcSelect -signal "comp_engine_o_intf" -line 22 -pos 1 -win $_nTrace1
srcSelect -signal "comp_mc_intf" -line 25 -pos 1 -win $_nTrace1
srcSelect -inst "non_comp_i_intf" -line 27 -pos 1 -win $_nTrace1
srcSelect -inst "non_comp_o_intf" -line 28 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G2" 0)}
wvDumpScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.comp_icnt_intf" \
           "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.comp_engine_i_intf" \
           "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.comp_engine_o_intf" \
           "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.comp_mc_intf" \
           "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.non_comp_i_intf" \
           "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.non_comp_o_intf"
wvRenameGroup -win $_nWave3 {G2} {comp_engine_i_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/ready"
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvRenameGroup -win $_nWave3 {G3} {comp_engine_o_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/ready"
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G4" 0)}
wvRenameGroup -win $_nWave3 {G4} {comp_icnt_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/ready"
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G5" 0)}
wvRenameGroup -win $_nWave3 {G5} {comp_mc_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/ready"
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G6" 0)}
wvRenameGroup -win $_nWave3 {G6} {non_comp_i_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/ready"
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G7" 0)}
wvRenameGroup -win $_nWave3 {G7} {non_comp_o_intf(None)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G8" 0)}
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 3321476.649103 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 676571.834889 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 1009401.527859 -snap {("comp_engine_o_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1344959.333066 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 1376332.623797 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 1409069.970646 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 81346753.433139 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 672479.666533 -snap {("comp_mc_intf(None)" 3)}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvSelectSignal -win $_nWave3 {( "comp_mc_intf(None)" 1 )} 
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 6)}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 6)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 6)}
wvSetCursor -win $_nWave3 1331318.771879 -snap {("comp_engine_o_intf(None)" 4)}
wvSetCursor -win $_nWave3 683392.115483 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 667023.442058 -snap {("non_comp_i_intf(None)" 6)}
wvSelectSignal -win $_nWave3 {( "comp_mc_intf(None)" 2 )} 
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_ENGINE" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode" -line 63 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "compressing" -line 65 -pos 1 -win $_nTrace1
srcSelect -signal "non_compressing" -line 66 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode" -line 63 -pos 1 -win $_nTrace1
srcSelect -signal "compressing" -line 65 -pos 1 -win $_nTrace1
srcSelect -signal "non_compressing" -line 66 -pos 1 -win $_nTrace1
srcSelect -signal "hold" -line 69 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/mode" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/compressing" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_compressing" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/hold"
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 6)}
srcTBSimReset
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSetCursor -win $_nWave3 669751.554296 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 740682.472469 -snap {("G1" 6)}
wvSetCursor -win $_nWave3 1679153.082154 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 668387.498177 -snap {("G1" 6)}
wvScrollDown -win $_nWave3 4
wvSetCursor -win $_nWave3 507428.876167 -snap {("comp_icnt_intf(None)" 1)}
wvSetCursor -win $_nWave3 508792.932286 -snap {("comp_engine_o_intf(None)" 6)}
wvSetCursor -win $_nWave3 497880.483336 -snap {("comp_icnt_intf(None)" 4)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSetCursor -win $_nWave3 514249.156760 -snap {("comp_mc_intf(None)" 4)}
debReload
srcTBInvokeSim
wvSetCursor -win $_nWave3 4130.688448 -snap {("comp_mc_intf(None)" 0)}
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 732498.135757 -snap {("comp_engine_o_intf(None)" 5)}
wvSetCursor -win $_nWave3 652018.824752 -snap {("comp_icnt_intf(None)" 4)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 735226.247994 -snap {("non_comp_o_intf(None)" 6)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 667023.442058 -snap {("comp_mc_intf(None)" 3)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 750230.865300 -snap {("comp_mc_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 673843.722652 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 683392.115483 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 746138.696944 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 995760.966672 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 1001217.191146 -snap {("comp_mc_intf(None)" 5)}
wvSetCursor -win $_nWave3 1021678.032927 -snap {("comp_mc_intf(None)" 5)}
wvSetCursor -win $_nWave3 754323.033657 -snap {("G1" 4)}
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvScrollDown -win $_nWave3 3
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvScrollUp -win $_nWave3 2
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 1001217.191146 -snap {("comp_engine_o_intf(None)" 4)}
wvSetCursor -win $_nWave3 1018949.920690 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 1033954.537996 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 1013493.696215 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 751594.921419 -snap {("comp_engine_o_intf(None)" 5)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 669751.554296 -snap {("comp_icnt_intf(None)" 6)}
wvSetCursor -win $_nWave3 999853.135028 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 751594.921419 -snap {("comp_mc_intf(None)" 3)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 664295.329821 -snap {("G1" 6)}
wvSetCursor -win $_nWave3 671115.610414 -snap {("G1" 6)}
wvSetCursor -win $_nWave3 827982.064068 -snap {("comp_icnt_intf(None)" 5)}
wvSetCursor -win $_nWave3 837530.456899 -snap {("G1" 3)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 744774.640826 -snap {("comp_mc_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 1280848.695486 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 1290397.088317 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 677935.891008 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 837530.456899 -snap {("comp_mc_intf(None)" 4)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 995760.966672 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 990304.742197 -snap {("non_comp_i_intf(None)" 3)}
wvSetCursor -win $_nWave3 1020313.976809 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 747502.753063 -snap {("comp_engine_o_intf(None)" 2)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 669751.554296 -snap {("G1" 6)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 681346.031305 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 690212.396076 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 700442.816967 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 709991.209798 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 720221.630688 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 728405.967401 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 740682.472469 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 748866.809182 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 680664.003245 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 689530.368017 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 702488.901145 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 709309.181739 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 719539.602629 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 730452.051579 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 740000.444410 -snap {("comp_engine_i_intf(None)" 1)}
wvSetCursor -win $_nWave3 751594.921419 -snap {("comp_engine_i_intf(None)" 1)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 669751.554296 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 667023.442058 -snap {("G1" 5)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 750230.865300 -snap {("comp_engine_o_intf(None)" 2)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSetCursor -win $_nWave3 842986.681374 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 750230.865300 -snap {("G1" 4)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 748866.809182 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 499244.539454 -snap {("comp_icnt_intf(None)" 4)}
wvSetCursor -win $_nWave3 508792.932286 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 680664.003245 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 842986.681374 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 751594.921419 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 1478636.832701 -snap {("comp_engine_o_intf(None)" 0)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 1052291.494220 -snap {("comp_mc_intf(None)" 5)}
wvSetCursor -win $_nWave3 1512826.740492 -snap {("comp_mc_intf(None)" 4)}
wvZoomOut -win $_nWave3
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSetCursor -win $_nWave3 2306461.452560 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 2674889.649577 -snap {("comp_mc_intf(None)" 5)}
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 51356715.006591 -snap {("comp_mc_intf(None)" 2)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 50979585.354235 -snap {("G1" 4)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 51370189.542007 -snap {("G1" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 51321287.315303 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 51306433.835231 -snap {("comp_mc_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 49305784.327049 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 49266936.763784 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 51323572.466088 -snap {("G1" 5)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 48862465.075664 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 48405434.919596 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 48871605.678785 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 48419145.824278 -snap {("non_comp_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 48396294.316475 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 48441997.332081 -snap {("non_comp_o_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 48506438.584087 -snap {("non_comp_o_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 49675750.238381 -snap {("non_comp_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 50779478.065285 -snap {("non_comp_o_intf(None)" 4)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 49697459.170799 -snap {("non_comp_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 49728308.706334 -snap {("non_comp_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 49778582.023501 -snap {("non_comp_o_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 2317142.891263 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 3096379.307359 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 3144367.473746 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 3973877.207008 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 4062998.087442 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 4104130.801488 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 4177255.626459 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 4222958.642065 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 4270946.808452 -snap {("comp_mc_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 50785190.942240 -snap {("non_comp_o_intf(None)" 2)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 51564884.388492 -snap {("comp_engine_o_intf(None)" 6)}
debReload
srcTBInvokeSim
srcTBRunSim
srcTBSimBreak
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 163664071.120187 -snap {("comp_icnt_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163664071.120187 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 163665593.633314 -snap {("comp_icnt_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163349938.599170 -snap {("comp_icnt_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163961988.876299 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163814305.102962 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163817350.129216 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163829530.234234 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163931538.613755 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163815827.616089 -snap {("comp_engine_o_intf(None)" 2)}
wvSetCursor -win $_nWave3 163668143.842752 -snap {("G1" 2)}
wvSelectSignal -win $_nWave3 {( "comp_engine_o_intf(None)" 2 )} 
wvSetCursor -win $_nWave3 163494577.346253 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 163348416.086042 -snap {("comp_icnt_intf(None)" 4)}
wvSetCursor -win $_nWave3 163366686.243569 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163441289.386801 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163488487.293744 -snap {("comp_mc_intf(None)" 3)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSetCursor -win $_nWave3 163806692.537326 -snap {("comp_engine_o_intf(None)" 2)}
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "mux_sel" -line 251 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G1" 6)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/mux_sel"
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "mode" -line 264 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/mode"
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 8)}
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163799607.934656 -snap {("G1" 2)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSetCursor -win $_nWave3 163494326.820713 -snap {("comp_mc_intf(None)" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163068359.684948 -snap {("comp_icnt_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163489055.943608 -snap {("non_comp_o_intf(None)" 2)}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 1807554.267248 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 937524277.896361 -snap {("comp_icnt_intf(None)" 1)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 224639462.310385 -snap {("G1" 2)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163490591.486885 -snap {("comp_mc_intf(None)" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.COMP_DATA" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.COMP_DATA" -delim "." -win \
           $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.COMP_DATA" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -delim "." \
           -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 20 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 20 -pos 1 -win $_nTrace1
srcSelect -signal "empty_o" -line 22 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/NON_COMP_SIZE/data_o\[0:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/NON_COMP_SIZE/empty_o"
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 10)}
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE.MA0" -win \
           $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE.MA0" -delim \
           "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE.MA0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_memory" -line 149 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_memory\[wptr_i\[STAGE_BITWIDTH-1:0\]\]" -line 153 -pos 1 \
          -win $_nTrace1
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/NON_COMP_SIZE/MA0/data_memory\[7:0\]"
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSetPosition -win $_nWave3 {("G1" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_memory\[rptr_i\[STAGE_BITWIDTH-1:0\]\]" -line 157 -pos 1 \
          -win $_nTrace1
srcSelect -signal "data_o" -line 157 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/NON_COMP_SIZE/MA0/data_memory\[7:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/NON_COMP_SIZE/MA0/data_o\[0:0\]"
wvSetPosition -win $_nWave3 {("G1" 11)}
wvSetPosition -win $_nWave3 {("G1" 13)}
srcTBSimReset
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163424468.392785 -snap {("G1" 10)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -delim "." \
           -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
wvSelectSignal -win $_nWave3 {( "comp_icnt_intf(None)" 6 )} 
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163336344.990423 -snap {("G1" 10)}
wvSelectSignal -win $_nWave3 {( "G1" 10 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 10 )} 
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSetPosition -win $_nWave3 {("G1" 9)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 9)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 9)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 9)}
wvSetCursor -win $_nWave3 636243.651546 -snap {("G1" 9)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1298814.626604 -snap {("G1" 10)}
wvSetCursor -win $_nWave3 649772.970573 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 679025.552253 -snap {("G1" 10)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSetCursor -win $_nWave3 651601.256928 -snap {("G1" 5)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 691092.242197 -snap {("G1" 10)}
wvSetCursor -win $_nWave3 680122.524067 -snap {("G1" 10)}
wvSetCursor -win $_nWave3 1159133.549081 -snap {("G1" 6)}
wvSetCursor -win $_nWave3 647213.369676 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 636243.651546 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 665496.233226 -snap {("comp_mc_intf(None)" 2)}
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSetCursor -win $_nWave3 636243.651546 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 650869.942386 -snap {("G1" 5)}
wvSetCursor -win $_nWave3 658183.087806 -snap {("G1" 5)}
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -delim "." \
           -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.NON_COMP_SIZE" -win \
           $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_flag_valid" -line 246 -pos 1 -win $_nTrace1
srcSelect -signal "icnt_handshake" -line 246 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -signal "comp_icnt_intf.sop" -line 246 -pos 1
wvSetPosition -win $_nWave3 {("G1" 0)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag_valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/icnt_handshake" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop"
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "hold" -line 247 -pos 1 -win $_nTrace1
srcSelect -signal "s_non_comp_empty_o" -line 247 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/hold" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/s_non_comp_empty_o"
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
srcTBSimReset
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 641728.510611 -snap {("G1" 4)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSetCursor -win $_nWave3 191970.067277 -snap {("G1" 3)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 7 8 9 10 11 12 13 )} 
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 11)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G8" 8)}
wvSetPosition -win $_nWave3 {("G8" 8)}
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvSelectSignal -win $_nWave3 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G8" 5)}
wvSetPosition -win $_nWave3 {("G8" 6)}
wvSetPosition -win $_nWave3 {("G8" 7)}
wvSetPosition -win $_nWave3 {("G8" 8)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSelectGroup -win $_nWave3 {G9}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSelectSignal -win $_nWave3 {( "G9" 1 )} 
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)} {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)} {comp_mc_intf(None)} \
           {comp_engine_o_intf(None)} {non_comp_i_intf(None)} \
           {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_i_intf(None)} {comp_icnt_intf(None)} \
           {comp_mc_intf(None)} {comp_engine_o_intf(None)} \
           {non_comp_i_intf(None)} {non_comp_o_intf(None)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G8" 5)}
wvSetPosition -win $_nWave3 {("G8" 6)}
wvSetPosition -win $_nWave3 {("G8" 7)}
wvSetPosition -win $_nWave3 {("G8" 8)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSetCursor -win $_nWave3 681950.810422 -snap {("G1" 3)}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G8}
wvSelectSignal -win $_nWave3 {( "G8" 1 )} 
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSelectGroup -win $_nWave3 {G8}
wvSetCursor -win $_nWave3 645385.083321 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 678294.237711 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 159060.912887 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 649041.656031 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 184656.921857 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 689263.955842 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 901345.173024 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 1148163.830951 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 1303568.171127 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 1144507.258241 -snap {("G9" 2)}
wvSelectSignal -win $_nWave3 {( "comp_icnt_intf(None)" 1 )} 
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetCursor -win $_nWave3 656354.801451 -snap {("G9" 2)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 638071.937901 -snap {("G9" 1)}
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSetCursor -win $_nWave3 648127.512854 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 681950.810422 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 1162790.121791 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 679208.380889 -snap {("G9" 2)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 163697447.082847 -snap {("comp_icnt_intf(None)" 1)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 652698.228741 -snap {("G9" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 1806346.918757 -snap {("comp_mc_intf(None)" 4)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 1160961.835436 -snap {("comp_mc_intf(None)" 4)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 681950.810422 -snap {("comp_icnt_intf(None)" 3)}
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "comp_o_intf.valid" -line 247 -pos 1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.valid" -line 247 -pos 1
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid"
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetCursor -win $_nWave3 1142678.971886 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 905001.745734 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 654526.515096 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 897688.600314 -snap {("G9" 4)}
wvSearchNext -win $_nWave3
wvSetCursor -win $_nWave3 901345.173024 -snap {("G1" 5)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 916977.021359 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 910578.019116 -snap {("G1" 1)}
wvSelectSignal -win $_nWave3 {( "G9" 4 )} 
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1290770.166642 -snap {("G9" 3)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 649041.656031 -snap {("G9" 2)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 909938.118892 -snap {("G9" 3)}
wvSetCursor -win $_nWave3 899882.543940 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 910852.262070 -snap {("G1" 1)}
wvSetCursor -win $_nWave3 668604.320030 -snap {("G1" 4)}
wvSetCursor -win $_nWave3 650321.456480 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 659462.888255 -snap {("G1" 1)}
wvSetCursor -win $_nWave3 909023.975715 -snap {("G1" 1)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 3930815.663287 -snap {("G9" 2)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 652698.228741 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 683779.096777 -snap {("G9" 2)}
wvSelectSignal -win $_nWave3 {( "G9" 2 )} 
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 1784407.482497 -snap {("comp_engine_o_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 1142678.971886 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 680122.524067 -snap {("G9" 2)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave3 641728.510611 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 638071.937901 -snap {("G9" 1)}
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 163814457.409568 -snap {("G1" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163825609.956309 -snap {("comp_engine_o_intf(None)" 3)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 163955418.287515 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 678294.237711 -snap {("comp_icnt_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 3
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G8}
wvSelectSignal -win $_nWave3 {( "G8" 2 )} 
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSelectSignal -win $_nWave3 {( "G9" 4 )} 
wvSelectGroup -win $_nWave3 {G8}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1151820.403661 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 1298083.312062 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 650869.942386 -snap {("G9" 1)}
wvSetCursor -win $_nWave3 649041.656031 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 917799.750219 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 958022.050029 -snap {("G9" 1)}
wvSetCursor -win $_nWave3 921456.322929 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 910486.604799 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 921456.322929 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 910486.604799 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 919628.036574 -snap {("G9" 2)}
wvSetCursor -win $_nWave3 897688.600314 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 917799.750219 -snap {("G9" 2)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 909069.682874 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 679848.281113 -snap {("G9" 2)}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 1163430.022015 -snap {("comp_mc_intf(None)" 4)}
wvSetCursor -win $_nWave3 1298723.212287 -snap {("comp_mc_intf(None)" 5)}
wvSetCursor -win $_nWave3 1158859.306128 -snap {("comp_mc_intf(None)" 3)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSetCursor -win $_nWave3 905641.645958 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 958661.950253 -snap {("G9" 1)}
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 197180.683389 -snap {("non_comp_i_intf(None)" 6)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 236488.840022 -snap {("non_comp_o_intf(None)" 4)}
wvSetCursor -win $_nWave3 680762.424291 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 670706.849338 -snap {("comp_icnt_intf(None)" 5)}
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSetCursor -win $_nWave3 681676.567468 -snap {("comp_icnt_intf(None)" 3)}
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSetCursor -win $_nWave3 678019.994758 -snap {("comp_icnt_intf(None)" 3)}
wvSetCursor -win $_nWave3 671620.992516 -snap {("comp_icnt_intf(None)" 5)}
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSetCursor -win $_nWave3 670706.849338 -snap {("comp_icnt_intf(None)" 5)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 678934.137936 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 688989.712888 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 699502.359430 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 709100.862793 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 721898.867279 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 729212.012699 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 739724.659240 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 749323.162604 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 759835.809145 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 770348.455687 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 780404.030639 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 789088.390825 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 800515.180544 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 810570.755497 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 817883.900917 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 830224.833813 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 837995.050822 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 850335.983719 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 859477.415494 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 870904.205212 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 879131.493810 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 889644.140351 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 899699.715304 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 909755.290257 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 920267.936798 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 929409.368573 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 939464.943526 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 949520.518478 -snap {("comp_mc_intf(None)" 1)}
wvSetCursor -win $_nWave3 959576.093431 -snap {("comp_mc_intf(None)" 1)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSetCursor -win $_nWave3 1159133.549081 -snap {("comp_mc_intf(None)" 2)}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G8}
wvSelectSignal -win $_nWave3 {( "G8" 4 )} 
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSelectGroup -win $_nWave3 {G8}
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvSelectGroup -win $_nWave3 {G10}
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvDumpScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.SIZE"
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G10/SIZE" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {SIZE}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/data_i\[0:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/wr_i" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/rd_i" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/rst_n" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/data_o\[0:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/full_o" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/empty_o" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/threshold_o" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/overflow_o" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/SIZE/underflow_o"
wvSetPosition -win $_nWave3 {("G10/SIZE" 0)}
wvSetPosition -win $_nWave3 {("G10/SIZE" 11)}
wvScrollDown -win $_nWave3 8
wvSelectGroup -win $_nWave3 {G10}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 709375.105747 -snap {("SIZE" 2)}
wvSetCursor -win $_nWave3 892203.741249 -snap {("SIZE" 2)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "comp_rd_i" -line 169 -pos 1 -win $_nTrace1
srcSelect -signal "comp_wr_i" -line 168 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G10/SIZE" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_rd_i" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_wr_i"
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G10" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "non_comp_wr_i" -line 198 -pos 1 -win $_nTrace1
srcSelect -signal "non_comp_rd_i" -line 199 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_wr_i" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_rd_i"
wvSetPosition -win $_nWave3 {("G10" 2)}
wvSetPosition -win $_nWave3 {("G10" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.valid" -line 267 -pos 1
srcSelect -signal "wait_comp_flag" -line 267 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -signal "comp_o_intf.valid" -line 264 -pos 1
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G10" 2)}
wvSetPosition -win $_nWave3 {("G10/SIZE" 0)}
wvSetPosition -win $_nWave3 {("G10" 4)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid"
wvSetPosition -win $_nWave3 {("G10" 4)}
wvSetPosition -win $_nWave3 {("G10" 7)}
wvSelectSignal -win $_nWave3 {( "G10" 5 )} 
wvSelectSignal -win $_nWave3 {( "G10" 7 )} 
srcTBSimReset
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G10" 2 )} 
wvSelectSignal -win $_nWave3 {( "G10" 1 )} 
wvSelectSignal -win $_nWave3 {( "G10" 7 )} 
wvSelectSignal -win $_nWave3 {( "G10" 5 )} 
wvSelectSignal -win $_nWave3 {( "G10" 7 )} 
wvSelectSignal -win $_nWave3 {( "G10" 6 )} 
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 163697447.082846 -snap {("comp_mc_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {G10/SIZE}
wvScrollUp -win $_nWave3 13
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G9}
wvSelectGroup -win $_nWave3 {G10}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetCursor -win $_nWave3 610647.642576 -snap {("G1" 4)}
debReload
srcTBInvokeSim
wvSelectSignal -win $_nWave3 {( "G1" 5 )} 
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
wvSelectSignal -win $_nWave3 {( "G9" 1 )} 
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 70 -pos 5 -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size_wr_i" -line 58 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "size_wr_i" -line 58 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size_wr_i" -line 58 -pos 1 -win $_nTrace1
srcSelect -signal "size_rd_i" -line 59 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/size_wr_i" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/size_rd_i"
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 5)}
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 588708.206316 -snap {("G9" 4)}
wvSelectSignal -win $_nWave3 {( "G9" 4 )} 
wvSelectSignal -win $_nWave3 {( "G9" 5 )} 
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 20
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 20
wvScrollUp -win $_nWave3 6
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 20
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 20
wvScrollUp -win $_nWave3 6
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 1144507.258241 -snap {("G9" 3)}
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 652698.228741 -snap {("G9" 5)}
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 6)}
wvSetCursor -win $_nWave3 197454.926342 -snap {("G9" 4)}
wvSetCursor -win $_nWave3 643556.796966 -snap {("G9" 5)}
wvSetCursor -win $_nWave3 649041.656031 -snap {("G9" 5)}
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10/SIZE}
wvSelectSignal -win $_nWave3 {( "G10/SIZE" 6 )} 
wvSetCursor -win $_nWave3 630758.792481 -snap {("SIZE" 3)}
wvSetCursor -win $_nWave3 643556.796966 -snap {("SIZE" 3)}
wvSetCursor -win $_nWave3 649041.656031 -snap {("SIZE" 3)}
wvSetCursor -win $_nWave3 667324.519581 -snap {("SIZE" 2)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "G9" 6 )} 
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "size" -line 75 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/size"
wvSetPosition -win $_nWave3 {("G9" 6)}
wvSetPosition -win $_nWave3 {("G9" 7)}
srcTBSimReset
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 650869.942386 -snap {("G9" 7)}
wvSetCursor -win $_nWave3 669152.805936 -snap {("G9" 4)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 650869.942386 -snap {("G9" 6)}
wvSetCursor -win $_nWave3 709375.105747 -snap {("G9" 6)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 1298083.312062 -snap {("G9" 6)}
wvSetCursor -win $_nWave3 667324.519581 -snap {("G9" 4)}
wvSelectSignal -win $_nWave3 {( "G9" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G9" 2)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 5)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetCursor -win $_nWave3 670981.092291 -snap {("G9" 5)}
wvSetCursor -win $_nWave3 681950.810422 -snap {("G9" 5)}
wvSetCursor -win $_nWave3 892203.741249 -snap {("G9" 5)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 6
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163457909.644402 -snap {("comp_mc_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 7
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 163372191.002717 -snap {("comp_mc_intf(None)" 2)}
wvSelectGroup -win $_nWave3 {non_comp_i_intf(None)}
wvSetCursor -win $_nWave3 163491943.758971 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163509312.479344 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163349337.423280 -snap {("non_comp_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163374019.289072 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163489201.329438 -snap {("comp_engine_o_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 665496.233226 -snap {("SIZE" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 6
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 3381232.784969 -snap {("G9" 8)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 8
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 6
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 6
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G8}
wvSelectSignal -win $_nWave3 {( "G8" 2 )} 
wvSelectSignal -win $_nWave3 {( "G8" 2 3 )} 
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 3360207.491886 -snap {("comp_engine_o_intf(None)" 2)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G10" 6 )} 
wvSetPosition -win $_nWave3 {("G10" 6)}
wvSetPosition -win $_nWave3 {("G10" 5)}
wvSetPosition -win $_nWave3 {("G8" 5)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G9" 8)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 8)}
wvSetPosition -win $_nWave3 {("G9" 9)}
wvSetCursor -win $_nWave3 3149954.561059 -snap {("G9" 9)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 3367520.637306 -snap {("G9" 8)}
wvSetCursor -win $_nWave3 3355636.775998 -snap {("G8" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 3388545.930388 -snap {("comp_mc_intf(None)" 2)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G8" 4 )} 
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G9" 9)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 9)}
wvSetPosition -win $_nWave3 {("G9" 10)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G9" 6 )} 
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetCursor -win $_nWave3 3106989.831716 -snap {("non_comp_o_intf(None)" 5)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 2741332.560712 -snap {("G9" 8)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSetCursor -win $_nWave3 2731276.985760 -snap {("G9" 7)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 3117502.478258 -snap {("G10" 3)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 163500545.537657 -snap {("comp_mc_intf(None)" 3)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163484090.960412 -snap {("comp_engine_o_intf(None)" 3)}
wvSetCursor -win $_nWave3 163378050.351821 -snap {("comp_mc_intf(None)" 3)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSetCursor -win $_nWave3 3388911.587659 -snap {("G9" 8)}
wvSetCursor -win $_nWave3 3379770.155884 -snap {("G9" 8)}
wvSetCursor -win $_nWave3 3356002.433269 -snap {("G8" 2)}
wvSetCursor -win $_nWave3 3151234.361507 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 3390739.874014 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 3142092.929732 -snap {("G9" 10)}
wvSetCursor -win $_nWave3 3392568.160369 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 2728900.213498 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 3356002.433269 -snap {("G9" 6)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 3394762.103996 -snap {("comp_mc_intf(None)" 2)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 3387814.615846 -snap {("G9" 8)}
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSelect -signal "compress" -line 294 -pos 1 -win $_nTrace1
srcSelect -signal "non_compress" -line 294 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -signal "comp_o_intf.ready" -line 297 -pos 1
srcSelect -win $_nTrace1 -signal "comp_o_intf.valid" -line 297 -pos 1
srcSelect -win $_nTrace1 -signal "comp_o_intf.eop" -line 297 -pos 1
srcSelect -signal "wait_comp_flag" -line 297 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.eop" -line 300 -pos 1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.valid" -line 300 -pos 1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.ready" -line 300 -pos 1
srcSelect -signal "wait_comp_flag" -line 303 -pos 1 -win $_nTrace1
srcSelect -signal "wait_comp_flag" -line 300 -pos 1 -win $_nTrace1
srcSelect -signal "rst_n" -line 291 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G9" 7)}
wvSetPosition -win $_nWave3 {("G9" 8)}
wvSetPosition -win $_nWave3 {("G9" 9)}
wvSetPosition -win $_nWave3 {("G9" 10)}
wvDumpScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX"
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/compress" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_compress" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/rst_n"
wvSetPosition -win $_nWave3 {("G9" 10)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/u_COMP_NONCOMP_MUX" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {u_COMP_NONCOMP_MUX}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/rst_n" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag_valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/ready"
wvSetPosition -win $_nWave3 {("G9/u_COMP_NONCOMP_MUX" 0)}
wvSetPosition -win $_nWave3 {("G9/u_COMP_NONCOMP_MUX" 28)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/non_comp_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {non_comp_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("G9/non_comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/non_comp_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/non_comp_i_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {non_comp_i_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/ready"
wvSetPosition -win $_nWave3 {("G9/non_comp_i_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/non_comp_i_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/comp_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/clk"
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/data\[63:0\]"
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/sop"
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("G9/comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/comp_o_intf(STREAM_INTF)" 3)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/comp_mc_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_mc_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/ready"
wvSetPosition -win $_nWave3 {("G9/comp_mc_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/comp_mc_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/comp_icnt_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_icnt_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/ready"
wvSetPosition -win $_nWave3 {("G9/comp_icnt_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/comp_icnt_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/comp_engine_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_engine_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/ready"
wvSetPosition -win $_nWave3 {("G9/comp_engine_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/comp_engine_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvSetPosition -win $_nWave3 {("G9/comp_engine_i_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_engine_i_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/ready"
wvSetPosition -win $_nWave3 {("G9/comp_engine_i_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9/comp_engine_i_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 20)}
wvScrollUp -win $_nWave3 21
wvSelectGroup -win $_nWave3 {G9}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvScrollDown -win $_nWave3 103
wvSelectGroup -win $_nWave3 {G11}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("G11" 0)}
wvDumpScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX"
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/compress" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_compress" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/rst_n"
wvSetPosition -win $_nWave3 {("G11" 0)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/u_COMP_NONCOMP_MUX" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {u_COMP_NONCOMP_MUX}
wvAddSignal -win $_nWave3 "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/rst_n" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_flag_valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/ready"
wvSetPosition -win $_nWave3 {("G11/u_COMP_NONCOMP_MUX" 0)}
wvSetPosition -win $_nWave3 {("G11/u_COMP_NONCOMP_MUX" 28)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/non_comp_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {non_comp_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("G11/non_comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/non_comp_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/non_comp_i_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {non_comp_i_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_i_intf/ready"
wvSetPosition -win $_nWave3 {("G11/non_comp_i_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/non_comp_i_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/clk"
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/data\[63:0\]"
wvAddSignal -win $_nWave3 \
           "tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/sop"
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 3)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_mc_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_mc_intf/ready"
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_icnt_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_icnt_intf/ready"
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_engine_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_o_intf/ready"
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_engine_i_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_engine_i_intf/ready"
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSelectGroup -win $_nWave3 {G11/comp_engine_i_intf(STREAM_INTF)}
wvScrollDown -win $_nWave3 10
wvScrollDown -win $_nWave3 37
wvSelectGroup -win $_nWave3 {G11/u_COMP_NONCOMP_MUX}
wvScrollDown -win $_nWave3 0
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wait_comp_flag" -line 303 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.ready" -line 300 -pos 1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.valid" -line 300 -pos 1
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G12" 0)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/valid"
wvSetPosition -win $_nWave3 {("G12" 0)}
wvSetPosition -win $_nWave3 {("G12" 3)}
wvSetPosition -win $_nWave3 {("G12" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "non_comp_o_intf.eop" -line 300 -pos 1
srcSelect -signal "wait_comp_flag" -line 300 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G12" 0)}
wvSetPosition -win $_nWave3 {("G12" 1)}
wvSetPosition -win $_nWave3 {("G12" 2)}
wvSetPosition -win $_nWave3 {("G12" 3)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag"
wvSetPosition -win $_nWave3 {("G12" 3)}
wvSetPosition -win $_nWave3 {("G12" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "comp_o_intf.ready" -line 297 -pos 1
srcSelect -win $_nTrace1 -signal "comp_o_intf.valid" -line 297 -pos 1
srcSelect -win $_nTrace1 -signal "comp_o_intf.eop" -line 297 -pos 1
srcSelect -signal "wait_comp_flag" -line 297 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G12" 3)}
wvSetPosition -win $_nWave3 {("G12" 4)}
wvSetPosition -win $_nWave3 {("G12" 5)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/wait_comp_flag"
wvSetPosition -win $_nWave3 {("G12" 5)}
wvSetPosition -win $_nWave3 {("G12" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "compress" -line 294 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "non_compress" -line 294 -pos 1 -win $_nTrace1
srcSelect -signal "compress" -line 294 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G12" 8)}
wvSetPosition -win $_nWave3 {("G12" 9)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/non_compress" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/compress"
wvSetPosition -win $_nWave3 {("G12" 9)}
wvSetPosition -win $_nWave3 {("G12" 11)}
srcTBSimReset
srcTBRunSim
wvSelectGroup -win $_nWave3 {G12}
wvSetPosition -win $_nWave3 {("G12" 0)}
wvSetPosition -win $_nWave3 {("G11/non_comp_o_intf(STREAM_INTF)" 4)}
wvSetPosition -win $_nWave3 {("G11/non_comp_i_intf(STREAM_INTF)" 1)}
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 2)}
wvSetPosition -win $_nWave3 {("G11/comp_o_intf(STREAM_INTF)" 1)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 5)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 4)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 2)}
wvSetPosition -win $_nWave3 {("G11/comp_mc_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 5)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 4)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 2)}
wvSetPosition -win $_nWave3 {("G11/comp_icnt_intf(STREAM_INTF)" 1)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 5)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 3)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 5)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 4)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 3)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 2)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 1)}
wvSetPosition -win $_nWave3 {("G11/comp_engine_i_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G11" 10)}
wvSetPosition -win $_nWave3 {("G11" 9)}
wvSetPosition -win $_nWave3 {("G11" 8)}
wvSetPosition -win $_nWave3 {("G11" 7)}
wvSetPosition -win $_nWave3 {("G11" 6)}
wvSetPosition -win $_nWave3 {("G11" 5)}
wvSetPosition -win $_nWave3 {("G11" 4)}
wvSetPosition -win $_nWave3 {("G11" 3)}
wvSetPosition -win $_nWave3 {("G11" 2)}
wvSetPosition -win $_nWave3 {("G11" 1)}
wvSetPosition -win $_nWave3 {("G11" 0)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("non_comp_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("non_comp_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_engine_o_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_icnt_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("comp_engine_i_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSelectGroup -win $_nWave3 {G12}
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 3
wvScrollUp -win $_nWave3 2
wvScrollDown -win $_nWave3 2
wvScrollDown -win $_nWave3 133
wvScrollUp -win $_nWave3 4
wvScrollUp -win $_nWave3 132
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G9}
wvSelectSignal -win $_nWave3 {( "G9" 11 )} 
wvSelectSignal -win $_nWave3 {( "G9" 9 )} 
wvSelectSignal -win $_nWave3 {( "G9" 11 )} 
wvSelectSignal -win $_nWave3 {( "G9" 11 12 13 14 15 16 17 18 19 20 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G10/SIZE" 3)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSelectGroup -win $_nWave3 {G9/comp_engine_i_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/comp_engine_o_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/comp_icnt_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/comp_mc_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/comp_o_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/non_comp_i_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/non_comp_o_intf(STREAM_INTF)}
wvSelectGroup -win $_nWave3 {G9/u_COMP_NONCOMP_MUX}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G9" 10 )} 
wvSelectSignal -win $_nWave3 {( "G9" 8 10 )} 
wvSelectSignal -win $_nWave3 {( "G9" 7 8 10 )} 
wvSelectSignal -win $_nWave3 {( "G9" 6 7 8 10 )} 
wvSelectSignal -win $_nWave3 {( "G9" 5 6 7 8 10 )} 
wvSetPosition -win $_nWave3 {("G9" 5)}
wvSetPosition -win $_nWave3 {("G9" 3)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSelectGroup -win $_nWave3 {G9}
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 3382512.585418 -snap {("G1" 9)}
wvSelectSignal -win $_nWave3 {( "G12" 8 )} 
wvSelectSignal -win $_nWave3 {( "G12" 5 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSelectSignal -win $_nWave3 {( "G12" 8 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSelectSignal -win $_nWave3 {( "G8" 4 )} 
wvSetPosition -win $_nWave3 {("G8" 4)}
wvSetPosition -win $_nWave3 {("G12" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G12" 1)}
wvSetCursor -win $_nWave3 1289124.708923 -snap {("G12" 1)}
wvSelectSignal -win $_nWave3 {( "G12" 5 )} 
wvSetCursor -win $_nWave3 1296437.854343 -snap {("G12" 1)}
wvSetCursor -win $_nWave3 1301922.713408 -snap {("G12" 8)}
wvSelectSignal -win $_nWave3 {( "G12" 6 )} 
wvSelectSignal -win $_nWave3 {( "G12" 8 )} 
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
debReload
srcTBInvokeSim
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 163490295.215075 -snap {("comp_mc_intf(None)" 3)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "G1" 10 )} 
wvSetCursor -win $_nWave3 163517719.510451 -snap {("comp_mc_intf(None)" 2)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 81
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 19
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 7
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 7
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 19
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 81
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvZoomOut -win $_nWave3
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G12" 9)}
wvSetPosition -win $_nWave3 {("G12" 3)}
wvSetPosition -win $_nWave3 {("G12" 2)}
wvSetPosition -win $_nWave3 {("G12" 1)}
wvSetPosition -win $_nWave3 {("G12" 0)}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("G8" 3)}
wvSetPosition -win $_nWave3 {("G8" 2)}
wvSetPosition -win $_nWave3 {("G8" 1)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G12}
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvSelectGroup -win $_nWave3 {G11}
wvSelectGroup -win $_nWave3 {comp_mc_intf(None)}
wvSelectSignal -win $_nWave3 {( "G1" 10 )} 
wvSetCursor -win $_nWave3 3396956.047623 -snap {("comp_mc_intf(None)" 1)}
wvSelectSignal -win $_nWave3 {( "G1" 8 )} 
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 1767587.248031 -snap {("comp_mc_intf(None)" 2)}
wvSetCursor -win $_nWave3 1950415.883533 -snap {("G1" 8)}
wvSelectGroup -win $_nWave3 {G9}
wvSelectGroup -win $_nWave3 {G9}
wvSelectSignal -win $_nWave3 {( "G9" 5 )} 
wvSetPosition -win $_nWave3 {("G9" 5)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 4)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 3)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 10)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 10)}
wvSetPosition -win $_nWave3 {("G1" 11)}
wvSelectGroup -win $_nWave3 {G9}
wvSetCursor -win $_nWave3 1375054.167609 -snap {("G13" 0)}
wvSetCursor -win $_nWave3 3380684.299063 -snap {("G1" 8)}
wvSetCursor -win $_nWave3 3358744.862803 -snap {("G1" 7)}
wvSelectGroup -win $_nWave3 {G12}
wvSetCursor -win $_nWave3 2724329.497611 -snap {("G12" 7)}
wvSetCursor -win $_nWave3 3364229.721868 -snap {("G12" 10)}
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoom -win $_nWave3 21732773.144876 21935779.687500
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 3376967.644857 -snap {("G1" 9)}
wvSetCursor -win $_nWave3 3384547.819144 -snap {("comp_mc_intf(None)" 3)}
wvSelectSignal -win $_nWave3 {( "G12" 8 )} 
wvSelectSignal -win $_nWave3 {( "G12" 6 )} 
wvSelectSignal -win $_nWave3 {( "G12" 7 )} 
wvSelectSignal -win $_nWave3 {( "G12" 6 )} 
wvSelectSignal -win $_nWave3 {( "G12" 7 )} 
wvSelectSignal -win $_nWave3 {( "G12" 8 )} 
wvSelectSignal -win $_nWave3 {( "G12" 6 )} 
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163507122.473265 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163368172.710283 -snap {("comp_mc_intf(None)" 3)}
wvZoomOut -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
wvSelectGroup -win $_nWave3 {G12}
wvSelectGroup -win $_nWave3 {G12}
wvSelectGroup -win $_nWave3 {G12}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSelectSignal -win $_nWave3 {( "G12" 1 )} 
wvSelectGroup -win $_nWave3 {G12}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G9}
wvSelectGroup -win $_nWave3 {G9}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSetCursor -win $_nWave3 162861554.561283 -snap {("G1" 6)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 163370732.311181 -snap {("G1" 5)}
wvSelectGroup -win $_nWave3 {comp_icnt_intf(None)}
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 159655654.437785 -snap {("G13" 0)}
wvSelectSignal -win $_nWave3 {( "G1" 8 )} 
wvSelectGroup -win $_nWave3 {comp_engine_o_intf(None)}
wvSelectGroup -win $_nWave3 {non_comp_o_intf(None)}
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G9}
wvSelectSignal -win $_nWave3 {( "G9" 4 )} 
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 5)}
wvSetPosition -win $_nWave3 {("G1" 8)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSelectGroup -win $_nWave3 {G9}
wvSetCursor -win $_nWave3 632587.078836 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 1148163.830951 -snap {("G1" 7)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163339200.311972 -snap {("G1" 7)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 12 )} 
wvSelectSignal -win $_nWave3 {( "G1" 11 )} 
wvSelectSignal -win $_nWave3 {( "G1" 12 )} 
wvSelectSignal -win $_nWave3 {( "G1" 11 )} 
wvSelectSignal -win $_nWave3 {( "G1" 12 )} 
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G9}
wvSelectSignal -win $_nWave3 {( "G9" 1 )} 
wvSetPosition -win $_nWave3 {("G9" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 6)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 2)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSelectGroup -win $_nWave3 {G9}
wvSetCursor -win $_nWave3 163477954.325191 -snap {("comp_mc_intf(None)" 5)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcSetScope "tbench_top.DUT" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp" -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcSetScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -delim "." -win $_nTrace1
srcHBSelect "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 28 -pos 3 -win $_nTrace1
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 1)}
wvSetPosition -win $_nWave3 {("comp_mc_intf(None)" 0)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvDumpScope "tbench_top.DUT.u_comp.u_COMP_NONCOMP_MUX.comp_o_intf"
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSetPosition -win $_nWave3 {("G1/comp_o_intf(STREAM_INTF)" 0)}
wvAddSubGroup -win $_nWave3 -holdpost {comp_o_intf(STREAM_INTF)}
wvAddSignal -win $_nWave3 \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/clk" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/valid" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/data\[63:0\]" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/sop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/eop" \
           "/tbench_top/DUT/u_comp/u_COMP_NONCOMP_MUX/comp_o_intf/ready"
wvSetPosition -win $_nWave3 {("G1/comp_o_intf(STREAM_INTF)" 0)}
wvSetPosition -win $_nWave3 {("G1/comp_o_intf(STREAM_INTF)" 6)}
wvSetPosition -win $_nWave3 {("G1" 13)}
srcTBSimReset
debReload
srcTBInvokeSim
srcTBRunSim
wvScrollUp -win $_nWave3 4
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 163957106.628985 -snap {("comp_engine_o_intf(None)" 2)}
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G8}
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10/SIZE}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvSetCursor -win $_nWave3 163659546.243228 -snap {("comp_icnt_intf(None)" 1)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
debReload
srcTBInvokeSim
srcTBRunSim
wvZoomAll -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave3 163995023.945243 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163832002.803767 -snap {("comp_mc_intf(None)" 3)}
wvSetCursor -win $_nWave3 163993373.027531 -snap {("comp_mc_intf(None)" 3)}
