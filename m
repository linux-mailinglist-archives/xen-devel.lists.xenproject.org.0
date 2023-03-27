Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D76CADBB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515415.798284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqd-0000M4-08; Mon, 27 Mar 2023 18:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515415.798284; Mon, 27 Mar 2023 18:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqc-0000D4-Pj; Mon, 27 Mar 2023 18:45:38 +0000
Received: by outflank-mailman (input) for mailman id 515415;
 Mon, 27 Mar 2023 18:45:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqb-000093-FM
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqZ-0004PB-5T; Mon, 27 Mar 2023 18:45:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqY-00044j-Qa; Mon, 27 Mar 2023 18:45:35 +0000
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
	bh=WbncluMJqXFuclE/Z6KpLTTiH8u6lIjghGGIazdqqQw=; b=eGSVOR+lYIgZPMjq9isWYRcmKK
	8Otj2R1XfEhvR9yiAuV0txVGSIC+kUA+ABnKugmXx9gs/se7GXYROF97iBZjSdLc/d8O4RScl2leN
	BcNym1sACb6pJrWzDzYwswjhvYM0/W6oialg6NOLmn9viO3Ap0rpQVeKoCEYB8IjxDfk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 4/7] xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.h
Date: Mon, 27 Mar 2023 19:45:17 +0100
Message-Id: <20230327184520.81828-5-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0-only
in xen/arch/x86/*.h:

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
        * Use GPL-2.0-only
        * Regenerate the patch as some headers were moved

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
42sh> find xen/arch/x86/ -name '*.h' -exec replace_license.py gpl-2.0.txt GPL-2.0-only {} \;
---
 xen/arch/x86/include/asm/altp2m.h            | 13 +------------
 xen/arch/x86/include/asm/hvm/asid.h          | 13 +------------
 xen/arch/x86/include/asm/hvm/domain.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/hvm.h           | 13 +------------
 xen/arch/x86/include/asm/hvm/io.h            | 13 +------------
 xen/arch/x86/include/asm/hvm/ioreq.h         | 13 +------------
 xen/arch/x86/include/asm/hvm/irq.h           | 13 +------------
 xen/arch/x86/include/asm/hvm/monitor.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/nestedhvm.h     | 13 +------------
 xen/arch/x86/include/asm/hvm/save.h          | 13 +------------
 xen/arch/x86/include/asm/hvm/support.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/svm.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h  | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/vmcb.h      | 13 +------------
 xen/arch/x86/include/asm/hvm/vcpu.h          | 13 +------------
 xen/arch/x86/include/asm/hvm/vlapic.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/vm_event.h      | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h      | 13 +------------
 xen/arch/x86/include/asm/hvm/vpt.h           | 13 +------------
 xen/arch/x86/include/asm/iommu.h             | 14 +-------------
 xen/arch/x86/include/asm/ioreq.h             | 13 +------------
 xen/arch/x86/include/asm/vm_event.h          | 13 +------------
 xen/arch/x86/include/asm/vpmu.h              | 13 +------------
 xen/arch/x86/mm/hap/private.h                | 13 +------------
 xen/arch/x86/x86_64/mmconfig.h               | 13 +------------
 28 files changed, 28 insertions(+), 337 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index b206e95863a6..e5e59cbd6836 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
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
 
 #ifndef __ASM_X86_ALTP2M_H
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 633ddb72e494..0207f8fc29db 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * asid.h: ASID management
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
 
 #ifndef __ASM_X86_HVM_ASID_H__
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444ea8..02c32cf26d6b 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * domain.h: HVM per domain definitions
  *
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2005, International Business Machines Corporation
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
 
 #ifndef __ASM_X86_HVM_DOMAIN_H__
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 43d3fc249887..de320177294d 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm.h: Hardware virtual machine assist interface definitions.
  *
  * Leendert van Doorn, leendert@watson.ibm.com
  * Copyright (c) 2005, International Business Machines Corporation.
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
 
 #ifndef __ASM_X86_HVM_HVM_H__
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 54e0161b492c..8df33eb6cc42 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * io.h: HVM IO support
  *
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
 
 #ifndef __ASM_X86_HVM_IO_H__
diff --git a/xen/arch/x86/include/asm/hvm/ioreq.h b/xen/arch/x86/include/asm/hvm/ioreq.h
index 9b2eb6fedf99..84be14fd0850 100644
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm.h: Hardware virtual machine assist interface definitions.
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
 
 #ifndef __ASM_X86_HVM_IOREQ_H__
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index c4369ceb7aaa..2d136ab99b79 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /******************************************************************************
  * irq.h
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
 
 #ifndef __ASM_X86_HVM_IRQ_H__
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 639f6dfa374c..da521064b9d0 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * include/asm-x86/hvm/monitor.h
  *
  * Arch-specific hardware virtual machine monitor abstractions.
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
 
 #ifndef __ASM_X86_HVM_MONITOR_H__
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 7184928c2bb1..3d1ec53a6ff9 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
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
 
 #ifndef _HVM_NESTEDHVM_H
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index e975011ddb71..9d838c48e357 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * save.h: HVM support routines for save/restore
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
 
 #ifndef __XEN_HVM_SAVE_H__
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 6b583738ecb5..8d4707e58c9c 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * support.h: HVM support routines used by VT-x and SVM.
  *
  * Leendert van Doorn, leendert@watson.ibm.com
  * Copyright (c) 2005, International Business Machines Corporation.
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
 
 #ifndef __ASM_X86_HVM_SUPPORT_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 230f818df80c..406fc082b107 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * nestedsvm.h: Nested Virtualization
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
 #ifndef __ASM_X86_HVM_SVM_NESTEDSVM_H__
 #define __ASM_X86_HVM_SVM_NESTEDSVM_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 7d5de0122a40..687d35be4027 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * svm.h: SVM Architecture related definitions
  * Copyright (c) 2005, AMD Corporation.
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
 
 #ifndef __ASM_X86_HVM_SVM_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
index 330c1d91aad5..f1cde676dca1 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * svmdebug.h: SVM related debug defintions
  * Copyright (c) 2011, AMD Corporation.
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
 
 #ifndef __ASM_X86_HVM_SVM_SVMDEBUG_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index b809e85507aa..7da50dbc6cbd 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmcb.h: VMCB related definitions
  * Copyright (c) 2005-2007, Advanced Micro Devices, Inc
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
 #ifndef __ASM_X86_HVM_SVM_VMCB_H__
 #define __ASM_X86_HVM_SVM_VMCB_H__
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 8adf4555c2ab..c9ef2b325bd4 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vcpu.h: HVM per vcpu definitions
  *
  * Copyright (c) 2005, International Business Machines Corporation.
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
 
 #ifndef __ASM_X86_HVM_VCPU_H__
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 8f908928c35c..f27454a13698 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * hvm_vlapic.h: virtualize LAPIC definitions.
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
 
 #ifndef __ASM_X86_HVM_VLAPIC_H__
diff --git a/xen/arch/x86/include/asm/hvm/vm_event.h b/xen/arch/x86/include/asm/hvm/vm_event.h
index 28cb07ce8ff6..506a85c7748b 100644
--- a/xen/arch/x86/include/asm/hvm/vm_event.h
+++ b/xen/arch/x86/include/asm/hvm/vm_event.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * include/asm-x86/hvm/vm_event.h
  *
  * Hardware virtual machine vm_event abstractions.
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
 
 #ifndef __ASM_X86_HVM_VM_EVENT_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 0a84e7447805..51641caa9fd3 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmcs.h: VMCS related definitions
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
 #ifndef __ASM_X86_HVM_VMX_VMCS_H__
 #define __ASM_X86_HVM_VMX_VMCS_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 82a9487b40f5..36c108d8797d 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vmx.h: VMX Architecture related definitions
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
 #ifndef __ASM_X86_HVM_VMX_VMX_H__
 #define __ASM_X86_HVM_VMX_VMX_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index 2c3adb5dd6b3..dc9db69258d2 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 
 /*
  * vvmx.h: Support virtual VMX for nested virtualization.
@@ -6,18 +7,6 @@
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
 #ifndef __ASM_X86_HVM_VVMX_H__
 #define __ASM_X86_HVM_VVMX_H__
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 74c0cedd11cc..935cbe333b11 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpt.h: Virtual Platform Timer definitions
  *
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
 
 #ifndef __ASM_X86_HVM_VPT_H__
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 586c7434f243..0540cd9faa87 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -1,16 +1,4 @@
-/*
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
-*/
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef __ARCH_X86_IOMMU_H__
 #define __ARCH_X86_IOMMU_H__
 
diff --git a/xen/arch/x86/include/asm/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
index d06ce9a6ea56..5fe811eff598 100644
--- a/xen/arch/x86/include/asm/ioreq.h
+++ b/xen/arch/x86/include/asm/ioreq.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * ioreq.h: Hardware virtual machine assist interface definitions.
  *
@@ -5,18 +6,6 @@
  * from the common code.
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
 
 #ifndef __ASM_X86_IOREQ_H__
diff --git a/xen/arch/x86/include/asm/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
index 075612407523..46e77ed6d936 100644
--- a/xen/arch/x86/include/asm/vm_event.h
+++ b/xen/arch/x86/include/asm/vm_event.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vm_event.h: architecture specific vm_event handling routines
  *
  * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
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
 
 #ifndef __ASM_X86_VM_EVENT_H__
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 05e1fbfccfcf..b165acc6c273 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * vpmu.h: PMU virtualization for HVM domain.
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
 
diff --git a/xen/arch/x86/mm/hap/private.h b/xen/arch/x86/mm/hap/private.h
index 1040eaf69f43..7eb672fa413a 100644
--- a/xen/arch/x86/mm/hap/private.h
+++ b/xen/arch/x86/mm/hap/private.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * arch/x86/mm/hap/private.h
  *
  * Copyright (c) 2007, AMD Corporation (Wei Huang)
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
 #ifndef __HAP_PRIVATE_H__
 #define __HAP_PRIVATE_H__
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 433046be663a..2d49fc79a0bb 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2006, Intel Corporation.
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
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
 
-- 
2.39.2


