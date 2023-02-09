Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121D69141C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492965.762754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu2-00031p-TP; Thu, 09 Feb 2023 23:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492965.762754; Thu, 09 Feb 2023 23:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu2-0002vF-OU; Thu, 09 Feb 2023 23:00:30 +0000
Received: by outflank-mailman (input) for mailman id 492965;
 Thu, 09 Feb 2023 23:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQFu0-0002rg-Ti
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 23:00:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFty-0002z1-Un; Thu, 09 Feb 2023 23:00:26 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFty-00085P-Im; Thu, 09 Feb 2023 23:00:26 +0000
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
	bh=LljhuvpwgXyxpkGUKmVnFpYI6mcRI4zQJLFFFZ5wgts=; b=pBiaBDG7mHoQDSDoCg3R0hpQOF
	25ztjt2Lw261AYCROpdpsRKAmZekA0EFdNXZwSkIW5/V7Ae48g7PZYkcE4gxSKfLBvML2uWkP0Vqy
	xAy+bgECfAGvPBqPcgDkmGSRJ8MejRywk0EH/si0Lv1YV2xhbvL8K0Czp7XN2XZJfFZ4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: demi@invisiblethingslab.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c
Date: Thu,  9 Feb 2023 23:00:15 +0000
Message-Id: <20230209230020.52695-2-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0 in
xen/arch/x86/*.c:

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

----

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
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0.txt GPL-2.0 {} \;
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
index 9e981e7e26dc..83bd9956ed36 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index b6b7342fb466..22d5d476ac3f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 58794a16f06c..229b46268052 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * vpmu.c: PMU virtualization for HVM domain.
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
index a8df52579db8..24c3b91eda56 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * vpmu_core2.c: CORE 2 specific PMU virtualization for HVM domain.
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
index f73390cdb017..f38cb160ce6e 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 1fd2770a3ae0..81969ba483e9 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index f8e6089870b0..ffe7a48a55c7 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index c65e1b27d09e..b760a321cbf2 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 5c1e64189600..8718401655e4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index ffa31b746716..6eef70d4ae8c 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 5ae209d3b6b3..77a14bdd0fa3 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 0bdcca1e1a5f..ab2fcae8836e 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 4fe87a71c12b..a75c514917f8 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 344edc2d6a96..0bd8852dd3e8 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 58370190ffc9..b7ad5cb94788 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index b89d0fd53ba1..8075cc139b09 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 2adab1f4b84b..d0b91031cf07 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index c1675e3d9fb0..a4b7d90d55aa 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index ab06dd3f3ae2..a48666f0e2fe 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 16fc134883cf..37ad64e60e5d 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 9525f3559392..807ce82b4861 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 9f5f35f16aff..c5658ae9f131 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index fa7325720328..22a7dab03924 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index bce86f0ef706..87a2fe49638a 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 305d4767e387..b9354e359514 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index eb32f12e2d14..57f599dee4ea 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 6a8316de0e25..38f86530c37d 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 09edbd23b399..c0b1ae9ba296 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index ade2a25ce7c2..60a1dd6aca2f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 674cdabb0736..5696ba89d113 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 621f5bb88b63..f0a6424d7f36 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 07393befeeed..4077889f204c 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 1da8d3b99edc..4dd67027e50b 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index 605e47c16cd5..f9a600213444 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
index bb143c6c42c6..f643085d236d 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
2.39.1


