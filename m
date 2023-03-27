Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF46CADBC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515414.798276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqc-0000D2-Hp; Mon, 27 Mar 2023 18:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515414.798276; Mon, 27 Mar 2023 18:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqc-0000AP-Db; Mon, 27 Mar 2023 18:45:38 +0000
Received: by outflank-mailman (input) for mailman id 515414;
 Mon, 27 Mar 2023 18:45:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqa-0008PK-GJ
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqa-0004PH-B5; Mon, 27 Mar 2023 18:45:36 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqa-00044j-3S; Mon, 27 Mar 2023 18:45:36 +0000
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
	bh=eag0yULGjEkDeN5lzxlGdsA7K2MYhuGrowzj21CvemI=; b=wo/R6Q2PlgLvv/gApeMMRYPWa5
	x4XoL6tIKVOit/x3svI/GMP+0oFrxSn5eE1aoO80PI3wv+wY60+X0PeRMVOK3lxU3hDw6PiitQFr6
	ABE0h//3NSVcunY647nU5XyTLT9Y4yYSXcpcn4RjkA3KLZZQJKSKOIgJ8VK/pqAS0ogg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 5/7] xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.h (part 3)
Date: Mon, 27 Mar 2023 19:45:18 +0100
Message-Id: <20230327184520.81828-6-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0-only
in xen/arch/x86/*.h:

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

---

    Changes in v2:
        - Switch to GPL-2.0-only

42sh> cat gpl-2.0-pattern-2.txt
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
42sh> find xen/arch/x86/ -name '*.h' -exec replace_license.py gpl-2.0-pattern-2.txt GPL-2.0-only {} \;
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
index ccf1ffbb729a..c3124c7b8d3a 100644
--- a/xen/arch/x86/include/asm/guest.h
+++ b/xen/arch/x86/include/asm/guest.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 423ca0860b5d..b76dbf9ccca3 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 1a1b47831c8d..c05efdce71a4 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 0a6c3b47ab36..4cffea386609 100644
--- a/xen/arch/x86/include/asm/guest/hypervisor.h
+++ b/xen/arch/x86/include/asm/guest/hypervisor.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 48ffd1a0b1b4..247ba6899e72 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 03d5868a9efd..665b472d05ac 100644
--- a/xen/arch/x86/include/asm/guest/xen-hcall.h
+++ b/xen/arch/x86/include/asm/guest/xen-hcall.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 2042a9a0c253..c330c4d40078 100644
--- a/xen/arch/x86/include/asm/guest/xen.h
+++ b/xen/arch/x86/include/asm/guest/xen.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index a5612585b35e..33c1da1a25f3 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 924508bbb4f0..db7a40f68e92 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 85442b60749f..88f36c6595f0 100644
--- a/xen/arch/x86/include/asm/pv/grant_table.h
+++ b/xen/arch/x86/include/asm/pv/grant_table.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 9983f8257c63..182764542c1f 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index a43c3689b48a..5625b90b72bd 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 855203c4e288..404f5b169ca8 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
2.39.2


