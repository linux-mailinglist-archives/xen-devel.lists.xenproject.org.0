Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C56CADC5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515412.798258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqZ-00087s-P3; Mon, 27 Mar 2023 18:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515412.798258; Mon, 27 Mar 2023 18:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqZ-00084V-L3; Mon, 27 Mar 2023 18:45:35 +0000
Received: by outflank-mailman (input) for mailman id 515412;
 Mon, 27 Mar 2023 18:45:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqX-0007pO-Ek
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqX-0004Ok-9B; Mon, 27 Mar 2023 18:45:33 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqX-00044j-1c; Mon, 27 Mar 2023 18:45:33 +0000
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
	bh=W0STCVm9FInPltGQ7FKCUcrUVXGBEkNPTjaWfPociOI=; b=TOKEZygHIvVMAvkz3qCY7e/K8N
	JTj5gYuvrdrLq2w/h/2t2Gm4Zfg1wMiPoty9pypFxa10gI7lvKw2dZMyp7nwBnhoEGqsd4N3ohKpg
	1TiXSRy1Kt9e1bZ6TVqYWWEjX2a+bGZN0aE8Uug6sg8Fx7QbWvW6LM3ZobxsfcG1+XuA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/7] xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.c (part 3)
Date: Mon, 27 Mar 2023 19:45:16 +0100
Message-Id: <20230327184520.81828-4-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0-only
in xen/arch/x86/*.c:

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
        - Switch SPDX to GPL-2.0-only

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
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0-pattern-2.txt GPL-2.0-only {} \;
---
 xen/arch/x86/hvm/dom0_build.c       | 13 +------------
 xen/arch/x86/hvm/domain.c           | 13 +------------
 xen/arch/x86/pv/callback.c          | 13 +------------
 xen/arch/x86/pv/descriptor-tables.c | 13 +------------
 xen/arch/x86/pv/grant_table.c       | 13 +------------
 xen/arch/x86/pv/mm.c                | 13 +------------
 6 files changed, 6 insertions(+), 72 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d44de7f2b2c6..fd2cbf68bc62 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 10e30175a1b6..deec74fdb4f5 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 067ee3b795d0..702a68def69c 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index b4135b450cdf..02647a2c5047 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 81c72e61ed55..247436a0156a 100644
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
index 5ed7b3ccdbf2..24f0d2e4ff7d 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
2.39.2


