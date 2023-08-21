Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4D782ED6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587724.919104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BH-0002mA-OB; Mon, 21 Aug 2023 16:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587724.919104; Mon, 21 Aug 2023 16:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BH-0002jX-Kh; Mon, 21 Aug 2023 16:55:07 +0000
Received: by outflank-mailman (input) for mailman id 587724;
 Mon, 21 Aug 2023 16:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIpk=EG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qY8BG-0002jB-7h
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:55:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79982c8e-4043-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 18:55:04 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 75C424EE073C;
 Mon, 21 Aug 2023 18:55:03 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 79982c8e-4043-11ee-8782-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 1/3] docs/misra: add documentation for MISRA C:2012 Dir 4.1
Date: Mon, 21 Aug 2023 18:54:37 +0200
Message-Id: <3635c6896e8c31a9b3bf12e0c8f0718ce0b7ee77.1692636338.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692636338.git.nicola.vetrini@bugseng.com>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aforementioned directive requires the project to supply documentation
on the measures taken towards the minimization of run-time failures.

The 'rules.rst' file is updated accordingly to mention the newly
added documentation.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/C-runtime-failures.rst | 239 ++++++++++++++++++++++++++++++
 docs/misra/rules.rst              |   7 +-
 2 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 docs/misra/C-runtime-failures.rst

diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
new file mode 100644
index 000000000000..f72385b08417
--- /dev/null
+++ b/docs/misra/C-runtime-failures.rst
@@ -0,0 +1,239 @@
+===================================================================
+Measures taken towards the minimization of Run-time failures in Xen
+===================================================================
+
+This document specifies which procedures and techinques are used troughout the
+Xen codebase to prevent or minimize the impact of certain classes of run-time
+errors that can occurr in the execution of a C program, due to the very minimal
+built-in checks that are present in the language.
+
+The presence of such documentation is requested by MISRA C:2012 Directive 4.1,
+whose headline states: "Run-time failures shall be minimized".
+
+
+Documentation for MISRA C:2012 Dir 4.1: overflow
+________________________________________________
+
+To be written.
+Example: Pervasive use of assertions and extensive test suite.
+
+
+Documentation for MISRA C:2012 Dir 4.1: unexpected wrapping
+___________________________________________________________
+
+To be written.
+Example: The only wrapping the is present in the code concerns
+unsigned integers and they are all expected.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid shift
+_____________________________________________________
+
+To be written.
+Example: Pervasive use of assertions and extensive test suite.
+
+
+Documentation for MISRA C:2012 Dir 4.1: division/remainder by zero
+__________________________________________________________________
+
+To be written.
+Example:
+There division or remainder operations in the project code ensure that
+their second argument is never zero.
+
+
+Documentation for MISRA C:2012 Dir 4.1: unsequenced side effects
+________________________________________________________________
+
+To be written.
+Example:
+No function in this project is meant to be executed from interrupt handlers
+or in multi-threading environments.
+
+
+Documentation for MISRA C:2012 Dir 4.1: read from uninitialized automatic object
+________________________________________________________________________________
+
+To be written.
+Example:
+Automatic variables are used to store temporary parameters and they
+are always initialized to either a default value or a proper value
+before usage.
+
+
+Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
+________________________________________________________________________________
+
+To be written.
+Example:
+The code does not use dynamically allocated storage.
+
+
+Documentation for MISRA C:2012 Dir 4.1: write to string literal or const object
+_______________________________________________________________________________
+
+To be written.
+Example:
+The toolchain puts every string literal and const object into a read-only
+section of memory.  The hardware exception raised when a write is attempted
+on such a memory section is correctly handled.
+
+
+Documentation for MISRA C:2012 Dir 4.1: non-volatile access to volatile object
+______________________________________________________________________________
+
+To be written.
+Example:
+Volatile access is limited to registers that are always accessed
+through macros or inline functions.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead allocated object
+_______________________________________________________________________
+
+To be written.
+Example:
+The code does not use dynamically allocated storage.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead automatic object
+_______________________________________________________________________
+
+To be written.
+Example:
+Pointers to automatic variables are never returned, nor stored in
+wider-scoped objects.  No function does the same on any pointer
+received as a parameter.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead thread object
+____________________________________________________________________
+
+To be written.
+Example:
+The program does not use per-thread variables.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using null pointer
+_________________________________________________________________
+
+To be written.
+Example:
+All possibly null pointers are checked before access.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using invalid pointer
+____________________________________________________________________
+
+To be written.
+Example:
+Usage of pointers is limited.  Pointers passed as parameters are
+always checked for validity.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using out-of-bounds pointer
+__________________________________________________________________________
+
+To be written.
+Example:
+Pointers are never uses to access arrays: indices are always used
+instead.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using unaligned pointer
+______________________________________________________________________
+
+To be written.
+Example:
+Pointer conversion that may result in unaligned pointers are never used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: mistyped access to object
+-----------------------------------------------------------------
+
+To be written.
+Example:
+Pointer conversions that may result in mistyped accesses to objects
+are never used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
+___________________________________________________________________
+
+To be written.
+Example:
+The code never uses function pointers.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid pointer arithmetic
+__________________________________________________________________
+
+To be written.
+Example:
+Pointer arithmetic is never used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid pointer comparison
+__________________________________________________________________
+
+To be written.
+Example:
+Arrays are always accessed using indices instead of pointers.  Pointers
+are only compared to NULL.
+
+
+Documentation for MISRA C:2012 Dir 4.1: overlapping copy
+________________________________________________________
+
+To be written.
+Example:
+The code never uses memcpy() and does not perform assignment of
+overlapping objects (which is doable only via pointers).
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid arguments to function
+_____________________________________________________________________
+
+To be written.
+Example:
+All parameters to functions are checked for validity.
+
+
+Documentation for MISRA C:2012 Dir 4.1: returned function error
+_______________________________________________________________
+
+To be written.
+Example:
+All functions that may produce an error, do returns a suitable status code
+that is checked at each call site.
+
+
+Documentation for MISRA C:2012 Dir 4.1: tainted input
+_____________________________________________________
+
+To be written.
+Example:
+All parameters of all functions in the API are checked before being used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: data race
+_________________________________________________
+
+To be written.
+Example:
+No function in this code is meant to be executed from interrupt handlers or
+in a multi-threading environment.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invariant violation
+___________________________________________________________
+
+To be written.
+
+
+Documentation for MISRA C:2012 Dir 4.1: communication error
+___________________________________________________________
+
+To be written.
+Example:
+This project does not involve any external communication.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8f0e4d3f25f4..cebff854a95c 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -47,7 +47,12 @@ maintainers if you want to suggest a change.
    * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
      - Required
      - All source files shall compile without any compilation errors
-     -
+
+   * - `Dir 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_01.c>`_
+     - Required
+     - Run-time failures shall be minimized
+     - The strategies adopted by Xen to prevent certain classes of runtime
+       failures are documented by `C-runtime-failures.rst <docs/misra/C-runtime-failures.rst>`_
 
    * - `Dir 4.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c>`_
      - Required
-- 
2.34.1


