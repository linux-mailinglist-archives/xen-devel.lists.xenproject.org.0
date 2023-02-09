Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44D69141E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492969.762792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu7-0003vK-5f; Thu, 09 Feb 2023 23:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492969.762792; Thu, 09 Feb 2023 23:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFu6-0003rp-Vg; Thu, 09 Feb 2023 23:00:34 +0000
Received: by outflank-mailman (input) for mailman id 492969;
 Thu, 09 Feb 2023 23:00:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQFu5-0003dE-80
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 23:00:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu4-0002zz-SB; Thu, 09 Feb 2023 23:00:32 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQFu4-00085P-Kt; Thu, 09 Feb 2023 23:00:32 +0000
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
	bh=QGBspIB/BwKX6V8510VRb5qkohNT9oZRupuWADfxJJE=; b=Kayc5UunpXPJgu7VoS08TQ62wD
	twR91Q4Nm3G4/daA+A1dr9ZmiKQXeLUKiZx2NrpboM+FE77qYXzhcgYL7mJm0bfF0QRuYrbR5go/H
	LQsrSPJmyALzBt9/FurBaCN7utEUDtSKdNNokPDwefO/eFWZvVDCUqZJOdCFdNGreJqI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: demi@invisiblethingslab.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 3)
Date: Thu,  9 Feb 2023 23:00:19 +0000
Message-Id: <20230209230020.52695-6-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0 in
xen/arch/x86/*.c:

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
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0-pattern-3.txt GPL-2.0 {} \;
---
 xen/arch/x86/hvm/dom0_build.c       | 13 +------------
 xen/arch/x86/hvm/domain.c           | 13 +------------
 xen/arch/x86/pv/callback.c          | 13 +------------
 xen/arch/x86/pv/descriptor-tables.c | 13 +------------
 xen/arch/x86/pv/grant_table.c       | 13 +------------
 xen/arch/x86/pv/mm.c                | 13 +------------
 6 files changed, 6 insertions(+), 72 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3ac6b7b423b1..d5be115e90c9 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * hvm/dom0_build.c
  *
  * Dom0 builder for PVH guest.
  *
  * Copyright (C) 2017 Citrix Systems R&D
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
 
 #include <xen/acpi.h>
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 10e30175a1b6..282784572ad6 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * HVM domain specific functions.
  *
  * Copyright (C) 2017 Citrix Systems R&D
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
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 067ee3b795d0..5db0dd4226d2 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * pv/callback.c
  *
  * hypercall handles and helper functions for guest callback
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
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index b4135b450cdf..9002c262a1fb 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/x86/pv/descriptor-tables.c
  *
@@ -5,18 +6,6 @@
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
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
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/grant_table.c b/xen/arch/x86/pv/grant_table.c
index 81c72e61ed55..910c50141278 100644
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * pv/grant_table.c
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
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 5ed7b3ccdbf2..69d746be6e8a 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * pv/mm.c
  *
@@ -5,18 +6,6 @@
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
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
 
 #include <xen/guest_access.h>
-- 
2.39.1


