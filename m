Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835056CADC4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515413.798263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqa-0008Et-4r; Mon, 27 Mar 2023 18:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515413.798263; Mon, 27 Mar 2023 18:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqa-00087w-0b; Mon, 27 Mar 2023 18:45:36 +0000
Received: by outflank-mailman (input) for mailman id 515413;
 Mon, 27 Mar 2023 18:45:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqX-0007pU-Ms
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqW-0004OZ-7I; Mon, 27 Mar 2023 18:45:32 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqV-00044j-Ru; Mon, 27 Mar 2023 18:45:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=QocsWa+ZWvxdn5Tw2Ssm0euyN93Y3Z7uWoyB+fBuNPg=; b=ELLp6C9YnWaUcr293M/dWBdV0k
	k53VWnJPAfZjnuUCD/lmSGq7SAmaUjzMCB4f6fk2vlWoUEjrBYBP1NvgIlhAQZ+yN8UwIL3ilHrLs
	SiFpsB15OWvhYHRGwIveNeYcD8GOZguUNU21pVuNpZgGoaWr/4lao+3LsY1ikyg8bHFo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 2/7] xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.c
Date: Mon, 27 Mar 2023 19:45:15 +0100
Message-Id: <20230327184520.81828-3-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0-only
in xen/arch/x86/*.c:

 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; If not, see <http://www.gnu.org/licenses/>.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v2:
        * Switch to GPL-2.0-only
        * Rebase

42sh> cat gpl-2.0.txt
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; If not, see <http://www.gnu.org/licenses/>.
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0.txt GPL-2.0-only {} \;
---
 xen/arch/x86/cpu/mwait-idle.c    | 13 +------------
 xen/arch/x86/cpu/vpmu.c          | 13 +------------
 xen/arch/x86/cpu/vpmu_amd.c      | 13 +------------
 xen/arch/x86/cpu/vpmu_intel.c    | 13 +------------
 xen/arch/x86/genapic/x2apic.c    | 13 +------------
 xen/arch/x86/hvm/asid.c          | 13 +------------
 xen/arch/x86/hvm/dm.c            | 13 +------------
 xen/arch/x86/hvm/hpet.c          | 13 +------------
 xen/arch/x86/hvm/hvm.c           | 13 +------------
 xen/arch/x86/hvm/intercept.c     | 13 +------------
 xen/arch/x86/hvm/io.c            | 13 +------------
 xen/arch/x86/hvm/ioreq.c         | 13 +------------
 xen/arch/x86/hvm/irq.c           | 13 +------------
 xen/arch/x86/hvm/mtrr.c          | 13 +------------
 xen/arch/x86/hvm/nestedhvm.c     | 13 +------------
 xen/arch/x86/hvm/pmtimer.c       | 13 +------------
 xen/arch/x86/hvm/quirks.c        | 13 +------------
 xen/arch/x86/hvm/save.c          | 13 +------------
 xen/arch/x86/hvm/svm/asid.c      | 13 +------------
 xen/arch/x86/hvm/svm/emulate.c   | 13 +------------
 xen/arch/x86/hvm/svm/intr.c      | 13 +------------
 xen/arch/x86/hvm/svm/nestedsvm.c | 13 +------------
 xen/arch/x86/hvm/svm/svm.c       | 13 +------------
 xen/arch/x86/hvm/svm/svmdebug.c  | 13 +------------
 xen/arch/x86/hvm/svm/vmcb.c      | 13 +------------
 xen/arch/x86/hvm/vlapic.c        | 13 +------------
 xen/arch/x86/hvm/vmx/intr.c      | 13 +------------
 xen/arch/x86/hvm/vmx/vmcs.c      | 13 +------------
 xen/arch/x86/hvm/vmx/vmx.c       | 13 +------------
 xen/arch/x86/hvm/vmx/vvmx.c      | 13 +------------
 xen/arch/x86/hvm/vpt.c           | 13 +------------
 xen/arch/x86/mm/altp2m.c         | 13 +------------
 xen/arch/x86/mm/hap/guest_walk.c | 13 +------------
 xen/arch/x86/mm/hap/nested_ept.c | 13 +------------
 xen/arch/x86/mm/p2m-ept.c        | 13 +------------
 35 files changed, 35 insertions(+), 420 deletions(-)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 9e981e7e26dc..ff5c808bc952 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * mwait_idle.c - native hardware idle loop for modern processors
  *
  * Copyright (c) 2013, Intel Corporation.
  * Len Brown <len.brown@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b6b7342fb466..f31c32bcf3a6 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpmu.c: PMU virtualization for HVM domain.
  *
  * Copyright (c) 2007, Intel Corporation.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
 #include <xen/cpu.h>
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 9df739aa3f03..18266b9521a9 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpmu_amd.c: AMD specific PMU virtualization.
  *
@@ -7,18 +8,6 @@
  * Author: Wei Wang <wei.wang2@amd.com>
  * Tested by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index bcfa187a14b6..35e350578b84 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpmu_intel.c: CORE 2 specific PMU virtualization.
  *
  * Copyright (c) 2007, Intel Corporation.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
 
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 0a7ee820f578..ca1db27157e2 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * x2APIC driver.
  *
  * Copyright (c) 2008, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 1fd2770a3ae0..0faaa24a8f6e 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * asid.c: ASID management
  * Copyright (c) 2007, Advanced Micro Devices, Inc.
  * Copyright (c) 2009, Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index f8e6089870b0..462691f91d3c 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2016 Citrix Systems Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index c65e1b27d09e..dff27b760eb6 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hpet.c: HPET emulation for HVM guests.
  * Copyright (c) 2006, Intel Corporation.
  * Copyright (c) 2006, Keir Fraser <keir@xensource.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/hvm/vpt.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d326fa1c0136..5733829e4db4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm.c: Common hardware virtual machine abstractions.
  *
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2005, International Business Machines Corporation.
  * Copyright (c) 2008, Citrix Systems, Inc.
- * 
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/ctype.h>
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index ffa31b746716..61664c0ad13f 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * intercept.c: Handle performance critical I/O packets in hypervisor space
  *
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2008, Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 5ae209d3b6b3..c6fca689ba78 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * io.c: Handling I/O and interrupts.
  *
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2005, International Business Machines Corporation.
  * Copyright (c) 2008, Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0bdcca1e1a5f..20dbb4c8cfb4 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm/io.c: hardware virtual machine I/O emulation
  *
  * Copyright (c) 2016 Citrix Systems Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain.h>
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 4fe87a71c12b..1258371eb029 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /******************************************************************************
  * irq.c
  * 
  * Interrupt distribution and delivery logic.
  * 
  * Copyright (c) 2006, K A Fraser, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index f1a88d761635..29f3fb160776 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * mtrr.c: MTRR/PAT virtualization
  *
  * Copyright (c) 2007, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 58370190ffc9..ec68551127b7 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Nested HVM
  * Copyright (c) 2011, Advanced Micro Devices, Inc.
  * Author: Christoph Egger <Christoph.Egger@amd.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/msr.h>
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index b89d0fd53ba1..2145c531b62f 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm/pmtimer.c: emulation of the ACPI PM timer 
  *
  * Copyright (c) 2007, XenSource inc.
  * Copyright (c) 2006, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 2adab1f4b84b..bd30b0f881cb 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /******************************************************************************
  * x86/hvm/quirks.c
- * 
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index c1675e3d9fb0..79713cd6cad0 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm/save.c: Save and restore HVM guest's emulated hardware state.
  *
@@ -6,18 +7,6 @@
  * Copyright (c) 2007, Isaku Yamahata <yamahata at valinux co jp>
  *                     VA Linux Systems Japan K.K.
  *                     split x86 specific part
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 150d8dfc8178..09f8c23fd99a 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * asid.c: handling ASIDs in SVM.
  * Copyright (c) 2007, Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/amd.h>
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 391f0255162e..a5977aa6a61f 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * emulate.c: handling SVM emulate instructions help.
  * Copyright (c) 2005 AMD Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index dbb0022190a8..0d2c0a86fdb3 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * intr.c: Interrupt handling for SVM.
  * Copyright (c) 2005, AMD Inc.
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 63ed9fc248e1..36e458d665fe 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * nestedsvm.c: Nested Virtualization
  * Copyright (c) 2011, Advanced Micro Devices, Inc
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  */
 
 #include <asm/hvm/support.h>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfe03316def6..f3cd4db306fd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * svm.c: handling SVM architecture-related VM exits
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2005-2007, Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index bce86f0ef706..7d6dc9ef47db 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * svmdebug.c: debug functions
  * Copyright (c) 2011, Advanced Micro Devices, Inc.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index ba93375e87d2..314e1fab419e 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmcb.c: VMCB management
  * Copyright (c) 2005-2007, Advanced Micro Devices, Inc.
  * Copyright (c) 2004, Intel Corporation.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dc93b5e930b1..faa07db03d06 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vlapic.c: virtualize LAPIC for HVM vcpus.
  *
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2006 Keir Fraser, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6a8316de0e25..3b6fa1519a1d 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * intr.c: handling I/O, interrupts related VMX entry/exit
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2004-2007, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d3c75b380381..92b833f3f890 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmcs.c: VMCS management
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7d5ed8d470e1..7fa72c162a2a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmx.c: handling VMX architecture-related VM exits
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 674cdabb0736..b8c92d643780 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vvmx.c: Support virtual VMX for nested virtualization.
  *
@@ -5,18 +6,6 @@
  * Author: Qing He <qing.he@intel.com>
  *         Eddie Dong <eddie.dong@intel.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 621f5bb88b63..8f53e88d6706 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpt.c: Virtual Platform Timer
  *
  * Copyright (c) 2006, Xiaowei Yang, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 07393befeeed..a04297b646ff 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Alternate p2m HVM
  * Copyright (c) 2014, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index 1da8d3b99edc..d1b7c5762c9e 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * arch/x86/mm/hap/guest_walk.c
  *
  * Guest page table walker
  * Copyright (c) 2007, AMD Corporation (Wei Huang)
  * Copyright (c) 2007, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index 605e47c16cd5..d6df48af5427 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * nested_ept.c: Handling virtulized EPT for guest in nested case.
  *
  * Copyright (c) 2012, Intel Corporation
  *  Xiantao Zhang <xiantao.zhang@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 #include <xen/vm_event.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index bb143c6c42c6..ffd34a1cc65f 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * ept-p2m.c: use the EPT page table as p2m
  * Copyright (c) 2007, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
-- 
2.39.2


