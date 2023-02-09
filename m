Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36F691422
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492966.762762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu3-000399-CN; Thu, 09 Feb 2023 23:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492966.762762; Thu, 09 Feb 2023 23:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu3-00031t-58; Thu, 09 Feb 2023 23:00:31 +0000
Received: by outflank-mailman (input) for mailman id 492966;
 Thu, 09 Feb 2023 23:00:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQFu1-0002rn-Gi
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 23:00:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu0-0002z9-Ln; Thu, 09 Feb 2023 23:00:28 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu0-00085P-B8; Thu, 09 Feb 2023 23:00:28 +0000
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
	bh=QoBP6FbuC6DyQyjP3W6Vg4nX2DjQ/IKq+YX7AEDswDA=; b=aElsOwWdCQAktqkGg3RwyDmpiH
	0if86kqr1BWDv/5smXDY8zDtjy1eL62DoUdD/mvsw+yVUyVPmCO6/7ScpC4iikk7pgqmc/JIF+3Ml
	vC96essT3qNBbASva+G+Pyia8Wr9U/yQdo/VHiJA9j5R4Fi62EqScPelkwbugAWxFvQc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: demi@invisiblethingslab.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 2/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 2)
Date: Thu,  9 Feb 2023 23:00:16 +0000
Message-Id: <20230209230020.52695-3-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0 in
xen/arch/x86/*.c:

 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

42sh> cat gpl-2.0-pattern-2.txt
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0-pattern-2.txt GPL-2.0 {} \;
---
 xen/arch/x86/alternative.c             | 14 +-------------
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c | 14 +-------------
 xen/arch/x86/cpu/mcheck/mce_amd.c      | 14 +-------------
 xen/arch/x86/cpu/mcheck/vmce.c         | 14 +-------------
 xen/arch/x86/guest/hyperv/hyperv.c     | 14 +-------------
 xen/arch/x86/guest/hyperv/tlb.c        | 14 +-------------
 xen/arch/x86/guest/hyperv/util.c       | 14 +-------------
 xen/arch/x86/guest/hypervisor.c        | 14 +-------------
 xen/arch/x86/guest/xen/pvh-boot.c      | 14 +-------------
 xen/arch/x86/guest/xen/xen.c           | 14 +-------------
 xen/arch/x86/hvm/grant_table.c         | 14 +-------------
 xen/arch/x86/hvm/hypercall.c           | 14 +-------------
 xen/arch/x86/hypercall.c               | 14 +-------------
 xen/arch/x86/mm.c                      | 14 +-------------
 xen/arch/x86/mm/guest_walk.c           | 14 +-------------
 xen/arch/x86/mm/hap/hap.c              | 14 +-------------
 xen/arch/x86/mm/hap/nested_hap.c       | 14 +-------------
 xen/arch/x86/mm/mem_access.c           | 14 +-------------
 xen/arch/x86/mm/mem_paging.c           | 14 +-------------
 xen/arch/x86/mm/mem_sharing.c          | 14 +-------------
 xen/arch/x86/mm/nested.c               | 14 +-------------
 xen/arch/x86/mm/p2m-basic.c            | 14 +-------------
 xen/arch/x86/mm/p2m-pod.c              | 14 +-------------
 xen/arch/x86/mm/p2m-pt.c               | 14 +-------------
 xen/arch/x86/mm/p2m.c                  | 14 +-------------
 xen/arch/x86/mm/paging.c               | 14 +-------------
 xen/arch/x86/mm/physmap.c              | 14 +-------------
 xen/arch/x86/mm/shadow/common.c        | 14 +-------------
 xen/arch/x86/mm/shadow/hvm.c           | 14 +-------------
 xen/arch/x86/mm/shadow/multi.c         | 14 +-------------
 xen/arch/x86/mm/shadow/pv.c            | 14 +-------------
 xen/arch/x86/mm/shadow/set.c           | 14 +-------------
 xen/arch/x86/msr.c                     | 14 +-------------
 xen/arch/x86/pv/emul-gate-op.c         | 14 +-------------
 xen/arch/x86/pv/emul-inv-op.c          | 14 +-------------
 xen/arch/x86/pv/emul-priv-op.c         | 14 +-------------
 xen/arch/x86/pv/emulate.c              | 14 +-------------
 xen/arch/x86/pv/hypercall.c            | 14 +-------------
 xen/arch/x86/pv/misc-hypercalls.c      | 14 +-------------
 xen/arch/x86/pv/ro-page-fault.c        | 14 +-------------
 xen/arch/x86/pv/shim.c                 | 14 +-------------
 xen/arch/x86/pv/traps.c                | 14 +-------------
 xen/arch/x86/smpboot.c                 | 14 +-------------
 xen/arch/x86/spec_ctrl.c               | 14 +-------------
 xen/arch/x86/traps.c                   | 14 +-------------
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 +-------------
 46 files changed, 46 insertions(+), 598 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 0c6fc7b4fb0c..04c199ff79e4 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -1,18 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * alternative.c
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/delay.h>
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index efb45c931e1f..5bd319d1cc92 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MCA implementation for AMD CPUs
  * Copyright (c) 2007 Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index d7ae8919df77..2bc7d07bb509 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * common MCA implementation for AMD CPUs.
  * Copyright (c) 2012-2014 Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* K8 common MCA documentation published at
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index af30811afd44..a3cb9807a7b5 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * vmce.c - provide software emulated vMCE support to guest
  *
  * Copyright (C) 2010, 2011 Jiang, Yunhong <yunhong.jiang@intel.com>
  * Copyright (C) 2012, 2013 Liu, Jinsong <jinsong.liu@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index b101ba3080b4..3a1a03e9b2f4 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/hyperv/hyperv.c
  *
  * Support for detecting and running under Hyper-V.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
index f249b259253d..7c21b889785f 100644
--- a/xen/arch/x86/guest/hyperv/tlb.c
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/hyperv/tlb.c
  *
  * Support for TLB management using hypercalls
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2020 Microsoft.
  */
 
diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
index 2c5f421b7bd9..fb1c09d8615b 100644
--- a/xen/arch/x86/guest/hyperv/util.c
+++ b/xen/arch/x86/guest/hyperv/util.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/hyperv/util.c
  *
  * Hyper-V utility functions
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2020 Microsoft.
  */
 
diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index 366af1d65001..e896c8879856 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/hypervisor.c
  *
  * Support for detecting and running under a hypervisor.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 #include <xen/cpumask.h>
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 498625eae0a3..9294aaa5cb01 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/pvh-boot.c
  *
  * PVH boot time support
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 9c2defaa6621..9b1bddb12bb6 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/xen.c
  *
  * Support for detecting and running under Xen.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index b7a896ea5855..4a46e9effa6b 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/hvm/grant_table.c
  *
  * Grant table interfaces for HVM guests
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95afd8..e49e29084168 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/hvm/hypercall.c
  *
  * HVM hypercall dispatching routines
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/lib.h>
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 6b73cff9b9ff..42f3d5d6dc46 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/hypercall.c
  *
  * Common x86 hypercall infrastructure.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2015,2016 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0fe14faa5fa7..039d9e187033 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm.c
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 76b4e0425887..532eec159a36 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/guest_walk.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 84cb358df123..5cce88fd8123 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/hap/hap.c
  *
  * hardware assisted paging
  * Copyright (c) 2007 Advanced Micro Devices (Wei Huang)
  * Parts of this code are Copyright (c) 2007 by XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 098e8e5d4ca9..4b0602cf3c2a 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/hap/nested_hap.c
  *
  * Code for Nested Virtualization
  * Copyright (c) 2011 Advanced Micro Devices
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index f3aed9fcc966..23930d50771a 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/mem_access.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h> /* copy_from_guest() */
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786ee0..c1e4508b830c 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/mem_paging.c
  *
  * Memory paging support.
  *
  * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc5444..366f047cd101 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/mem_sharing.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2011 GridCentric, Inc. (Adin Scannell & Andres Lagar-Cavilla)
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/nested.c b/xen/arch/x86/mm/nested.c
index fab62b2b2dc1..b648f590a0ca 100644
--- a/xen/arch/x86/mm/nested.c
+++ b/xen/arch/x86/mm/nested.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/nested.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 47b780d6d63a..63873e59c9eb 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/p2m-basic.c
  *
@@ -8,19 +9,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 2edab5e5cd91..c3fcc6058519 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/p2m-pod.c
  *
  * Populate-on-demand p2m entries.
  *
  * Copyright (c) 2009-2011 Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index cd1af33b6772..38bd6f6f5168 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/p2m-pt.c
  *
@@ -9,19 +10,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c5561fe22160..d075fe2b662a 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/p2m.c
  *
@@ -8,19 +9,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 2991585117a8..c67cb05aae64 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/paging.c
  *
  * x86 specific paging support
  * Copyright (c) 2007 Advanced Micro Devices (Wei Huang)
  * Copyright (c) 2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/mm/physmap.c b/xen/arch/x86/mm/physmap.c
index 2d267b42f73b..c0cb63aed25a 100644
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/physmap.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index a74b15e3e75b..3a2c0b93dcbd 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/common.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 88c3c16322f2..4741140cb692 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 
 /******************************************************************************
  * arch/x86/mm/shadow/hvm.c
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 3b06cfaf9a5a..b02c569af34d 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/multi.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/pv.c b/xen/arch/x86/mm/shadow/pv.c
index ed10d5479c5e..acae2d69aaf0 100644
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/pv.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index bd6c68b547c9..816139aeb8c3 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/set.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #define GUEST_PAGING_LEVELS 0
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 7ddf0078c3a2..44bc2cf7ef56 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/msr.c
  *
  * Policy objects for Model-Specific Registers.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 758a20ad9df4..aa3e85e023a0 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/emul-gate-op.c
  *
  * Emulate gate op for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 2c07eed9a092..304e3f3a4887 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/emul-inv-op.c
  *
  * Emulate invalid op for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..ae7ee41d40c7 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/emul-priv-op.c
  *
  * Emulate privileged instructions for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 0a7907ec5e84..d50c2b42d6f7 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/emulate.c
  *
  * Common PV emulation code
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2eedfbfae864..aad1ed4fdb1f 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/hypercall.c
  *
  * PV hypercall dispatching routines
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index aaaf70eb6330..c2cdbe34a647 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/misc-hypercalls.c
  *
  * Misc hypercall handlers
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..7d38d4549b14 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/ro-page-fault.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ae1a0e6e65af..abcc0c888286 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/shim.c
  *
  * Functionaltiy for PV Shim mode
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/event.h>
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 97fe54b5ee5a..0e1e97ece8c7 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/pv/traps.c
  *
  * PV low level entry points.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b26758c2c89f..9541f4003dac 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * x86 SMP booting functions
  *
  * This inherits a great deal from Linux's SMP boot code:
  *  (c) 1995 Alan Cox, Building #3 <alan@redhat.com>
  *  (c) 1998, 1999, 2000 Ingo Molnar <mingo@redhat.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index a320b81947c8..8038fea377aa 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/spec_ctrl.c
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
 #include <xen/errno.h>
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8fa..b2cb46aafe8f 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1,20 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/traps.c
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e38f98b54726..0f64890519a8 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * x86_emulate.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* Operand sizes: 8-bit operands or specified/overridden size. */
-- 
2.39.1


