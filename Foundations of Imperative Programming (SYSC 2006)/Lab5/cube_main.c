/* SYSC 2006 Fall 2016, Lab 5, Extra Practice */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#include "sput.h"
/* By default, Pelles C generates "warning #2154: Unreachable code"
   and "warning #2130: Result of comparison is constant" when the 
   macros in sput.h are used. The following pragma directive disables the
   generation of these warnings.
 */
#pragma warn(disable: 2130 2154)

/* ----  Do not change any of the statements above this line. --------- */

/* Exercise 1. */

void cube_area_volume(double len, double *area, double *volume)
{

}

/*---------------------------------------------------------------------------
 * Test harness for this lab. Do not modify any of the code below this line.
 */

static void test_cube_area_volume(void)
{
    double surface_area, volume;
    cube_area_volume(2, &surface_area, &volume);
    sput_fail_unless(fabs(surface_area - 24.0) < 0.001, 
		             "cube_area_volume(2, &surface_area, &volume)"
                     "\nsurface_area == 24.0"); 
    sput_fail_unless(fabs(volume - 8.0) < 0.001, 
		             "cube_area_volume(2, &surface_area, &volume)"
                     "\nvolume == 8.0"); 
}

int main(void)
{
    sput_start_testing();

    sput_enter_suite("Exercise 1: cube_area_volume()");
    sput_run_test(test_cube_area_volume);

    sput_finish_testing();
    return sput_get_return_value();
}
