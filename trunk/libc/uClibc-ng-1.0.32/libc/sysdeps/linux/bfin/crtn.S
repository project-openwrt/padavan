/* Specialized code needed to support construction and destruction of
   file-scope objects in C++ and Java code, and to support exception handling.
   Copyright (C) 1999 Free Software Foundation, Inc.
   Contributed by Charles-Antoine Gauthier (charles.gauthier@iit.nrc.ca).

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, see
<http://www.gnu.org/licenses/>.  */

/* As a special exception, if you link this library with files
   compiled with GCC to produce an executable, this does not cause
   the resulting executable to be covered by the GNU General Public License.
   This exception does not however invalidate any other reasons why
   the executable file might be covered by the GNU General Public License.  */

/*
 * This file supplies function epilogues for the .init and .fini sections.
 * It is linked in after all other files.
 */

	.file   "crtn.o"
	.ident  "GNU C crtn.o"

	.section .init
	unlink; 
#if defined __ID_SHARED_LIB__
	P5 = [SP++];
#elif defined __BFIN_FDPIC__
	P3 = [SP++];
#endif
	rts;

	.section .fini
	unlink;
#if defined __ID_SHARED_LIB__
	P5 = [SP++];
#elif defined __BFIN_FDPIC__
	P3 = [SP++];
#endif
	rts;

.section .note.GNU-stack,"",%progbits
