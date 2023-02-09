Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD53691420
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492970.762810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu8-0004R4-N9; Thu, 09 Feb 2023 23:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492970.762810; Thu, 09 Feb 2023 23:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu8-0004Jr-GB; Thu, 09 Feb 2023 23:00:36 +0000
Received: by outflank-mailman (input) for mailman id 492970;
 Thu, 09 Feb 2023 23:00:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQFu6-0003mg-HT
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 23:00:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu6-00030C-1f; Thu, 09 Feb 2023 23:00:34 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu5-00085P-QW; Thu, 09 Feb 2023 23:00:34 +0000
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
	bh=0krr1/40/JlLOTiOy4EMHtxQHCIKvf7q62mQbRVJo8Q=; b=WTGF/tpeIxAkgEdAGJjU2Y1PkT
	ZERB9K4+VdsxOaUBUzOp8wcYXg+hSAXRS4UUbhMuzLcjgocz7Agil7pe2QyMiSwVamP/XEoZ0Px4Y
	tAKGl8bdP8EGFkbDxFHkF8+dvF6HdSGuEtZk6pOQaZrE22wd8efl75ayKeF37eWJGtjs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: demi@invisiblethingslab.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 6/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 3)
Date: Thu,  9 Feb 2023 23:00:20 +0000
Message-Id: <20230209230020.52695-7-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0 in
xen/arch/x86/*.h:

 * This program is free software; you can redistribute it and/or
 * modify it under the terms and conditions of the GNU General Public
 * License, version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; If not, see <http://www.gnu.org/licenses/>.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

42sh> cat gpl-2.0-pattern-3.txt
 * This program is free software; you can redistribute it and/or
 * modify it under the terms and conditions of the GNU General Public
 * License, version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; If not, see <http://www.gnu.org/licenses/>.
42sh> find xen/arch/x86/ -name '*.h' -exec replace_license.py gpl-2.0-pattern-3.txt GPL-2.0 {} \;
---
 xen/arch/x86/include/asm/guest.h              | 13 +------------
 xen/arch/x86/include/asm/guest/hyperv-hcall.h | 13 +------------
 xen/arch/x86/include/asm/guest/hyperv.h       | 13 +------------
 xen/arch/x86/include/asm/guest/hypervisor.h   | 13 +------------
 xen/arch/x86/include/asm/guest/pvh-boot.h     | 13 +------------
 xen/arch/x86/include/asm/guest/xen-hcall.h    | 13 +------------
 xen/arch/x86/include/asm/guest/xen.h          | 13 +------------
 xen/arch/x86/include/asm/hvm/grant_table.h    | 13 +------------
 xen/arch/x86/include/asm/pv/domain.h          | 13 +------------
 xen/arch/x86/include/asm/pv/grant_table.h     | 13 +------------
 xen/arch/x86/include/asm/pv/mm.h              | 13 +------------
 xen/arch/x86/include/asm/pv/shim.h            | 13 +------------
 xen/arch/x86/include/asm/pv/traps.h           | 13 +------------
 13 files changed, 13 insertions(+), 156 deletions(-)

diff --git a/xen/arch/x86/include/asm/guest.h b/xen/arch/x86/include/asm/guest.h
index ccf1ffbb729a..5f30de747c8c 100644
--- a/xen/arch/x86/include/asm/guest.h
+++ b/xen/arch/x86/include/asm/guest.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
index 423ca0860b5d..6af8c5c57b09 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/hyperv-hcall.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index 1a1b47831c8d..9e16961dc52f 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/hyperv.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/hypervisor.h b/xen/arch/x86/include/asm/guest/hypervisor.h
index 0a6c3b47ab36..f06ea0a85cd8 100644
--- a/xen/arch/x86/include/asm/guest/hypervisor.h
+++ b/xen/arch/x86/include/asm/guest/hypervisor.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/hypervisor.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 48ffd1a0b1b4..215955e24ce1 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/pvh-boot.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/xen-hcall.h b/xen/arch/x86/include/asm/guest/xen-hcall.h
index 03d5868a9efd..87274e21ff29 100644
--- a/xen/arch/x86/include/asm/guest/xen-hcall.h
+++ b/xen/arch/x86/include/asm/guest/xen-hcall.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/xen-hcall.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/include/asm/guest/xen.h b/xen/arch/x86/include/asm/guest/xen.h
index 2042a9a0c253..e81fafd080c6 100644
--- a/xen/arch/x86/include/asm/guest/xen.h
+++ b/xen/arch/x86/include/asm/guest/xen.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/xen.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
index a5612585b35e..d2cee25f5de3 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * asm-x86/hvm/grant_table.h
  *
  * Grant table interfaces for HVM guests
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_HVM_GRANT_TABLE_H__
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 924508bbb4f0..11426dd7cb75 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * pv/domain.h
  *
  * PV guest interface definitions
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_DOMAIN_H__
diff --git a/xen/arch/x86/include/asm/pv/grant_table.h b/xen/arch/x86/include/asm/pv/grant_table.h
index 85442b60749f..402bbd345a83 100644
--- a/xen/arch/x86/include/asm/pv/grant_table.h
+++ b/xen/arch/x86/include/asm/pv/grant_table.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * asm-x86/pv/grant_table.h
  *
  * Grant table interfaces for PV guests
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_GRANT_TABLE_H__
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 9983f8257c63..39b42f5d706a 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * asm-x86/pv/mm.h
  *
  * Memory management interfaces for PV guests
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_MM_H__
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index a43c3689b48a..311b83972600 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm-x86/guest/shim.h
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 855203c4e288..36bff76e0d74 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * pv/traps.h
  *
  * PV guest traps interface definitions
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms and conditions of the GNU General Public
- * License, version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_TRAPS_H__
-- 
2.39.1


