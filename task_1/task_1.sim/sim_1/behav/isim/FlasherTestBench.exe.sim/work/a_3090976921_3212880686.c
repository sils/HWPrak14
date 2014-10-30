/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//nap.rz.tu-harburg.de/fs2$/19/sils1297/windows/hwprak/task_1/task_1.srcs/sim_1/new/FlasherTestBench.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_3090976921_3212880686_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(17, ng0);

LAB3:    t1 = (7.5757575700000004 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 3120);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 3120);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 3040);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3090976921_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int64 t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 2720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 4U);
    xsi_set_current_line(23, ng0);
    t5 = (0.50000000000000000 * 1000000000000LL);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t6 = 1;
    if (4U == 4U)
        goto LAB10;

LAB11:    t6 = 0;

LAB12:    if ((!(t6)) == 0)
        goto LAB8;

LAB9:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 4U);
    xsi_set_current_line(26, ng0);
    t5 = (0.50000000000000000 * 1000000000000LL);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t5);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t9 = (t0 + 5449);
    xsi_report(t9, 19U, 2);
    goto LAB9;

LAB10:    t7 = 0;

LAB13:    if (t7 < 4U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t2 = (t3 + t7);
    t8 = (t4 + t7);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB11;

LAB15:    t7 = (t7 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t6 = 1;
    if (4U == 4U)
        goto LAB22;

LAB23:    t6 = 0;

LAB24:    if ((!(t6)) == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 4U);
    xsi_set_current_line(29, ng0);
    t5 = (0.50000000000000000 * 1000000000000LL);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t5);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    t9 = (t0 + 5469);
    xsi_report(t9, 19U, 2);
    goto LAB21;

LAB22:    t7 = 0;

LAB25:    if (t7 < 4U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t2 = (t3 + t7);
    t8 = (t4 + t7);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB23;

LAB27:    t7 = (t7 + 1);
    goto LAB25;

LAB28:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t6 = 1;
    if (4U == 4U)
        goto LAB34;

LAB35:    t6 = 0;

LAB36:    if ((!(t6)) == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 4U);
    xsi_set_current_line(32, ng0);
    t5 = (0.50000000000000000 * 1000000000000LL);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t5);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t9 = (t0 + 5489);
    xsi_report(t9, 19U, 2);
    goto LAB33;

LAB34:    t7 = 0;

LAB37:    if (t7 < 4U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t2 = (t3 + t7);
    t8 = (t4 + t7);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB35;

LAB39:    t7 = (t7 + 1);
    goto LAB37;

LAB40:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t6 = 1;
    if (4U == 4U)
        goto LAB46;

LAB47:    t6 = 0;

LAB48:    if ((!(t6)) == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 4U);
    xsi_set_current_line(35, ng0);
    t5 = (0.50000000000000000 * 1000000000000LL);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t5);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    t9 = (t0 + 5509);
    xsi_report(t9, 19U, 2);
    goto LAB45;

LAB46:    t7 = 0;

LAB49:    if (t7 < 4U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t2 = (t3 + t7);
    t8 = (t4 + t7);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB47;

LAB51:    t7 = (t7 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t6 = 1;
    if (4U == 4U)
        goto LAB58;

LAB59:    t6 = 0;

LAB60:    if ((!(t6)) == 0)
        goto LAB56;

LAB57:    xsi_set_current_line(37, ng0);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    t9 = (t0 + 5529);
    xsi_report(t9, 19U, 2);
    goto LAB57;

LAB58:    t7 = 0;

LAB61:    if (t7 < 4U)
        goto LAB62;
    else
        goto LAB60;

LAB62:    t2 = (t3 + t7);
    t8 = (t4 + t7);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB59;

LAB63:    t7 = (t7 + 1);
    goto LAB61;

LAB64:    goto LAB2;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

}


extern void work_a_3090976921_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3090976921_3212880686_p_0,(void *)work_a_3090976921_3212880686_p_1};
	xsi_register_didat("work_a_3090976921_3212880686", "isim/FlasherTestBench.exe.sim/work/a_3090976921_3212880686.didat");
	xsi_register_executes(pe);
}
