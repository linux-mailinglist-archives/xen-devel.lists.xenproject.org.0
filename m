Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3969141F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492968.762784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu6-0003ka-KB; Thu, 09 Feb 2023 23:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492968.762784; Thu, 09 Feb 2023 23:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu6-0003h7-DJ; Thu, 09 Feb 2023 23:00:34 +0000
Received: by outflank-mailman (input) for mailman id 492968;
 Thu, 09 Feb 2023 23:00:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQFu4-0003cJ-Nc
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 23:00:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu3-0002zd-Pt; Thu, 09 Feb 2023 23:00:31 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu3-00085P-IU; Thu, 09 Feb 2023 23:00:31 +0000
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
	bh=MrRIIHWAZk7Sn1zkqMOz+M0nmfhsUTbnBLesFNoF668=; b=LBZA2klrN/u3jnUNSKU65Bm4jJ
	EW28C8UNxq5DaBRsfx3slTtObcMWCTnPUspdnMbMPUanulwVCA8XC2Mk+fldnq2+gn80KspDoCoTE
	yyODpipUO9kIRwVcd2odl3itv3iSOf3BLQpRUPWVNVj3R7cxUHdHtpZTxR6IDwDEH1Cw=;
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
	Tim Deegan <tim@xen.org>
Subject: [PATCH 4/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 2)
Date: Thu,  9 Feb 2023 23:00:18 +0000
Message-Id: <20230209230020.52695-5-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0 in
xen/arch/x86/*.h:

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
42sh> find xen/arch/x86/ -name '*.h' -exec replace_license.py gpl-2.0-pattern-2.txt GPL-2.0 {} \;
---
 xen/arch/x86/cpu/mcheck/x86_mca.h        | 14 +-------------
 xen/arch/x86/guest/hyperv/private.h      | 14 +-------------
 xen/arch/x86/include/asm/endbr.h         | 14 +-------------
 xen/arch/x86/include/asm/guest_pt.h      | 14 +-------------
 xen/arch/x86/include/asm/hap.h           | 14 +-------------
 xen/arch/x86/include/asm/mem_access.h    | 14 +-------------
 xen/arch/x86/include/asm/mem_paging.h    | 14 +-------------
 xen/arch/x86/include/asm/mem_sharing.h   | 14 +-------------
 xen/arch/x86/include/asm/p2m.h           | 14 +-------------
 xen/arch/x86/include/asm/paging.h        | 14 +-------------
 xen/arch/x86/include/asm/shstk.h         | 14 +-------------
 xen/arch/x86/include/asm/spec_ctrl.h     | 14 +-------------
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 14 +-------------
 xen/arch/x86/include/asm/traps.h         | 14 +-------------
 xen/arch/x86/include/asm/xenoprof.h      | 14 +-------------
 xen/arch/x86/mm/mm-locks.h               | 14 +-------------
 xen/arch/x86/mm/p2m.h                    | 14 +-------------
 xen/arch/x86/mm/shadow/multi.h           | 14 +-------------
 xen/arch/x86/mm/shadow/private.h         | 14 +-------------
 xen/arch/x86/mm/shadow/types.h           | 14 +-------------
 xen/arch/x86/x86_emulate/x86_emulate.h   | 14 +-------------
 21 files changed, 21 insertions(+), 273 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x86_mca.h
index 8f7fced0fee0..81cabc9ddb97 100644
--- a/xen/arch/x86/cpu/mcheck/x86_mca.h
+++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MCA implementation for AMD CPUs
  * Copyright (c) 2007-2012 Advanced Micro Devices, Inc. 
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
 
 #ifndef X86_MCA_H
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index fea3e291e944..f768f647d877 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/guest/hyperv/private.h
  *
  * Definitions / declarations only useful to Hyper-V code.
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
 
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index d946fac13130..80a53187782c 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -1,17 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
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
  * Copyright (c) 2021-2022 Citrix Systems Ltd.
  */
 #ifndef XEN_ASM_ENDBR_H
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 6802db2a415a..2afaf20a775c 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * xen/asm-x86/guest_pt.h
  *
@@ -10,19 +11,6 @@
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
 
 #ifndef _XEN_ASM_GUEST_PT_H
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 90dece29deca..5de40d599ca4 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/hap.h
  *
@@ -7,19 +8,6 @@
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
 
 #ifndef _XEN_HAP_H
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 18091610aea0..9584ae2260a2 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/mem_access.h
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
 
 #ifndef __ASM_X86_MEM_ACCESS_H__
diff --git a/xen/arch/x86/include/asm/mem_paging.h b/xen/arch/x86/include/asm/mem_paging.h
index d3635e96cffc..04e17b827fce 100644
--- a/xen/arch/x86/include/asm/mem_paging.h
+++ b/xen/arch/x86/include/asm/mem_paging.h
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/mem_paging.h
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
 
 #ifndef __ASM_X86_MEM_PAGING_H__
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 2c00069bc91c..c072953c6c0b 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/mem_sharing.h
  *
  * Memory sharing support.
  *
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
 #ifndef __MEM_SHARING_H__
 #define __MEM_SHARING_H__
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index bd684d02f367..f72dd62064f0 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/paging.h
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
 
 #ifndef _XEN_ASM_X86_P2M_H
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8c0b0ef29a10..dab2ad598cc3 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/paging.h
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
 
 #ifndef _XEN_PAGING_H
diff --git a/xen/arch/x86/include/asm/shstk.h b/xen/arch/x86/include/asm/shstk.h
index fdc9cc65a3fa..21eed6c2fb0c 100644
--- a/xen/arch/x86/include/asm/shstk.h
+++ b/xen/arch/x86/include/asm/shstk.h
@@ -1,17 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
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
  * Copyright (c) 2022 Citrix Systems Ltd.
  */
 #ifndef XEN_ASM_SHSTK_H
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index e928596450f7..847e0659f67a 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/spec_ctrl.h
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
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532b..5239f274369e 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * include/asm-x86/spec_ctrl.h
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
 
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index b0dd2d24614d..99585d091931 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2007, 2008 Advanced Micro Devices, Inc.
  * Author: Christoph Egger <Christoph.Egger@amd.com>
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
 
 #ifndef ASM_TRAP_H
diff --git a/xen/arch/x86/include/asm/xenoprof.h b/xen/arch/x86/include/asm/xenoprof.h
index cf6af8c5df52..bef9d5278634 100644
--- a/xen/arch/x86/include/asm/xenoprof.h
+++ b/xen/arch/x86/include/asm/xenoprof.h
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/xenoprof.h
  * xenoprof x86 arch specific header file
  *
  * Copyright (c) 2006 Isaku Yamahata <yamahata at valinux co jp>
  *                    VA Linux Systems Japan K.K.
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
 
 #ifndef __ASM_X86_XENOPROF_H__
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index c1523aeccf99..a8df7fc0530f 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/mm-locks.h
  *
@@ -7,19 +8,6 @@
  * Copyright (c) 2007 Advanced Micro Devices (Wei Huang)
  * Copyright (c) 2006-2007 XenSource Inc.
  * Copyright (c) 2006 Michael A Fetterman
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
 
 #ifndef _MM_LOCKS_H
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index cc0f6766e4df..261cf6f7aeec 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -1,18 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/p2m.h
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
 
 struct p2m_domain *p2m_init_one(struct domain *d);
diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index 5bcd6ae1a8da..77e71299f02c 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/multi.h
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
 
 extern int
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 79d82364fc92..257befe30ada 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/private.h
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
 
 #ifndef _XEN_SHADOW_PRIVATE_H
diff --git a/xen/arch/x86/mm/shadow/types.h b/xen/arch/x86/mm/shadow/types.h
index fac59522b008..afe0180d6298 100644
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * arch/x86/mm/shadow/types.h
  *
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
 
 #ifndef _XEN_SHADOW_TYPES_H
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index bb7af967ffee..324cb5607ad4 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * x86_emulate.h
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
 
 #ifndef __X86_EMULATE_H__
-- 
2.39.1


