/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_2(char*, char *);
IKI_DLLESPEC extern void execute_3(char*, char *);
IKI_DLLESPEC extern void execute_4(char*, char *);
IKI_DLLESPEC extern void execute_5(char*, char *);
IKI_DLLESPEC extern void execute_6(char*, char *);
IKI_DLLESPEC extern void execute_7(char*, char *);
IKI_DLLESPEC extern void execute_8(char*, char *);
IKI_DLLESPEC extern void execute_9(char*, char *);
IKI_DLLESPEC extern void execute_10(char*, char *);
IKI_DLLESPEC extern void execute_11(char*, char *);
IKI_DLLESPEC extern void execute_49(char*, char *);
IKI_DLLESPEC extern void execute_50(char*, char *);
IKI_DLLESPEC extern void execute_51(char*, char *);
IKI_DLLESPEC extern void execute_52(char*, char *);
IKI_DLLESPEC extern void execute_19(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_174(char*, char *);
IKI_DLLESPEC extern void execute_175(char*, char *);
IKI_DLLESPEC extern void execute_176(char*, char *);
IKI_DLLESPEC extern void execute_177(char*, char *);
IKI_DLLESPEC extern void execute_178(char*, char *);
IKI_DLLESPEC extern void execute_179(char*, char *);
IKI_DLLESPEC extern void execute_180(char*, char *);
IKI_DLLESPEC extern void execute_181(char*, char *);
IKI_DLLESPEC extern void execute_182(char*, char *);
IKI_DLLESPEC extern void execute_183(char*, char *);
IKI_DLLESPEC extern void execute_184(char*, char *);
IKI_DLLESPEC extern void execute_185(char*, char *);
IKI_DLLESPEC extern void execute_186(char*, char *);
IKI_DLLESPEC extern void execute_21(char*, char *);
IKI_DLLESPEC extern void execute_55(char*, char *);
IKI_DLLESPEC extern void execute_27(char*, char *);
IKI_DLLESPEC extern void execute_58(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_60(char*, char *);
IKI_DLLESPEC extern void execute_30(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_63(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_61(char*, char *);
IKI_DLLESPEC extern void execute_32(char*, char *);
IKI_DLLESPEC extern void execute_33(char*, char *);
IKI_DLLESPEC extern void execute_34(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_75(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_77(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_80(char*, char *);
IKI_DLLESPEC extern void execute_81(char*, char *);
IKI_DLLESPEC extern void execute_82(char*, char *);
IKI_DLLESPEC extern void execute_83(char*, char *);
IKI_DLLESPEC extern void execute_84(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_1(char*, char *);
IKI_DLLESPEC extern void vlog_timingcheck_execute_0(char*, char*, char*);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_2(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_31(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_32(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_33(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_34(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_35(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_36(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_37(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_38(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_39(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_40(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_41(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_42(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_43(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_44(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_45(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_46(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_47(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_48(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_49(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_50(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_51(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_52(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_53(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_54(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_27(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_28(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_29(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_30(char*, char *);
IKI_DLLESPEC extern void execute_103(char*, char *);
IKI_DLLESPEC extern void execute_108(char*, char *);
IKI_DLLESPEC extern void execute_109(char*, char *);
IKI_DLLESPEC extern void execute_110(char*, char *);
IKI_DLLESPEC extern void execute_111(char*, char *);
IKI_DLLESPEC extern void execute_166(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_58(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_91(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_130(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[138] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_11, (funcp)execute_49, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_19, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_174, (funcp)execute_175, (funcp)execute_176, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_180, (funcp)execute_181, (funcp)execute_182, (funcp)execute_183, (funcp)execute_184, (funcp)execute_185, (funcp)execute_186, (funcp)execute_21, (funcp)execute_55, (funcp)execute_27, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_30, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_61, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_79, (funcp)execute_80, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_1, (funcp)vlog_timingcheck_execute_0, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_2, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_31, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_32, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_33, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_34, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_35, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_36, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_37, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_38, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_39, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_40, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_41, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_42, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_43, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_44, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_45, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_46, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_47, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_48, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_49, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_50, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_51, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_52, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_53, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_54, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_27, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_28, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_29, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_30, (funcp)execute_103, (funcp)execute_108, (funcp)execute_109, (funcp)execute_110, (funcp)execute_111, (funcp)execute_166, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_34, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_42, (funcp)transaction_43, (funcp)transaction_44, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_91, (funcp)transaction_130};
const int NumRelocateId= 138;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_full_addr_clk_time_impl/xsim.reloc",  (void **)funcTab, 138);
	iki_vhdl_file_variable_register(dp + 36248);
	iki_vhdl_file_variable_register(dp + 36304);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_full_addr_clk_time_impl/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_full_addr_clk_time_impl/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 41872, dp + 42928, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 41928, dp + 43040, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 41984, dp + 43152, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 42152, dp + 43600, 0, 0, 0, 0, 1, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_full_addr_clk_time_impl/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_full_addr_clk_time_impl/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_full_addr_clk_time_impl/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
