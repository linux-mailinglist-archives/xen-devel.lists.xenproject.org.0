Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7565F8176
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 02:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418365.663159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxVY-0003rH-AF; Sat, 08 Oct 2022 00:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418365.663159; Sat, 08 Oct 2022 00:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxVY-0003oY-4p; Sat, 08 Oct 2022 00:16:00 +0000
Received: by outflank-mailman (input) for mailman id 418365;
 Sat, 08 Oct 2022 00:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrwE=2J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogxVW-00035E-Qk
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 00:15:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6029d821-469e-11ed-964a-05401a9f4f97;
 Sat, 08 Oct 2022 02:15:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D95361E13;
 Sat,  8 Oct 2022 00:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE2BC433D6;
 Sat,  8 Oct 2022 00:15:52 +0000 (UTC)
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
X-Inumbo-ID: 6029d821-469e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665188154;
	bh=nkf5f1s9b73fs5L0inbQYTQtvT4GFe9oF/f4l6y5xS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N/Eo7HuM/0fTqi8sFEsdzbpcafKvl7xqA6iaV4+eUdzefsftYGWCDrlsGByaI+plB
	 w9Mlh3tu8NAlCP6a9gdSlfpJiAOwy7d4tzShs0SstByuEZuCSDs4FAvQKl5a7A4vBm
	 EmnluaUJckHpUMG0fI0+vTzsmGAbArJRGEabWllQsogW3lKPJ4ANo2VSJwxYN+hxaC
	 QnK9WYu2wJxtGfVuxulTBymJmttWMppbIMaJFEzmeHk92JltkipzTpsoK0XCQGHxLb
	 rp/D//MLoHG81LfOpLHk6lveQWzOj/WkNGhUSaKOio21xJ/IObeWSNc5sQU7DmwlfE
	 Xj8QRXPzmSYBg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	wl@xen.org,
	jbeulich@suse.com,
	george.dunlap@citrix.com,
	andrew.cooper3@citrix.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	roger.pau@citrix.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 3/4] add SPDX to arch/arm/*.c
Date: Fri,  7 Oct 2022 17:15:43 -0700
Message-Id: <20221008001544.78302-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add SPDX license information to all the *.c files under arch/arm.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- change xen/arch/arm/domain_page.c to GPL-2.0-or-later

Changes in v2:
- use /* */
- actually check use the right license
- remove stale copyright info from top of the file header
---
 xen/arch/arm/alternative.c        | 13 +------------
 xen/arch/arm/bootfdt.c            |  5 +----
 xen/arch/arm/cpuerrata.c          |  1 +
 xen/arch/arm/cpufeature.c         | 13 +------------
 xen/arch/arm/decode.c             | 11 +----------
 xen/arch/arm/device.c             | 11 +----------
 xen/arch/arm/dm.c                 | 13 +------------
 xen/arch/arm/domain.c             | 12 +-----------
 xen/arch/arm/domain_build.c       |  1 +
 xen/arch/arm/domain_page.c        |  1 +
 xen/arch/arm/domctl.c             |  1 +
 xen/arch/arm/early_printk.c       |  5 +----
 xen/arch/arm/gic-v2.c             | 11 +----------
 xen/arch/arm/gic-v3-its.c         | 13 +------------
 xen/arch/arm/gic-v3-lpi.c         | 13 +------------
 xen/arch/arm/gic-v3.c             | 11 +----------
 xen/arch/arm/gic-vgic.c           | 11 +----------
 xen/arch/arm/gic.c                | 11 +----------
 xen/arch/arm/guest_atomics.c      | 13 +------------
 xen/arch/arm/guest_walk.c         | 13 +------------
 xen/arch/arm/guestcopy.c          |  1 +
 xen/arch/arm/hvm.c                | 13 +------------
 xen/arch/arm/io.c                 | 11 +----------
 xen/arch/arm/ioreq.c              | 13 +------------
 xen/arch/arm/irq.c                | 11 +----------
 xen/arch/arm/kernel.c             |  1 +
 xen/arch/arm/livepatch.c          |  1 +
 xen/arch/arm/mem_access.c         | 13 +------------
 xen/arch/arm/mm.c                 | 11 +----------
 xen/arch/arm/monitor.c            | 13 +------------
 xen/arch/arm/p2m.c                |  1 +
 xen/arch/arm/percpu.c             |  1 +
 xen/arch/arm/physdev.c            |  1 +
 xen/arch/arm/platform.c           | 11 +----------
 xen/arch/arm/platform_hypercall.c |  1 +
 xen/arch/arm/processor.c          | 11 +----------
 xen/arch/arm/psci.c               | 11 +----------
 xen/arch/arm/setup.c              | 11 +----------
 xen/arch/arm/shutdown.c           |  1 +
 xen/arch/arm/smp.c                |  1 +
 xen/arch/arm/smpboot.c            | 11 +----------
 xen/arch/arm/sysctl.c             |  1 +
 xen/arch/arm/time.c               | 11 +----------
 xen/arch/arm/traps.c              | 11 +----------
 xen/arch/arm/vcpreg.c             | 11 +----------
 xen/arch/arm/vgic-v2.c            | 11 +----------
 xen/arch/arm/vgic-v3-its.c        | 13 +------------
 xen/arch/arm/vgic-v3.c            | 11 +----------
 xen/arch/arm/vgic.c               | 11 +----------
 xen/arch/arm/vm_event.c           | 13 +------------
 xen/arch/arm/vpci.c               | 11 +----------
 xen/arch/arm/vpl011.c             | 13 +------------
 xen/arch/arm/vpsci.c              | 13 +------------
 xen/arch/arm/vsmc.c               | 10 +---------
 xen/arch/arm/vtimer.c             | 11 +----------
 xen/arch/arm/vuart.c              | 11 +----------
 56 files changed, 56 insertions(+), 438 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..f00e3b9b3c 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * alternative runtime patching
  * inspired by the x86 version
  *
  * Copyright (C) 2014-2016 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6014c0f852..0085c28d74 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -1,11 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Early Device Tree
  *
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 #include <xen/types.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index ae649d16ef..99bd4a7d38 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/init.h>
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 62d5e1770a..c4ec38bb25 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Contains CPU feature definitions
  *
  * Copyright (C) 2015 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index f5f6562600..2537dbebc1 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/decode.c
  *
@@ -5,16 +6,6 @@
  *
  * Julien Grall <julien.grall@linaro.org>
  * Copyright (C) 2013 Linaro Limited.
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
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 70cd6c1a19..ca8539dee5 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/device.c
  *
@@ -5,16 +6,6 @@
  *
  * Julien Grall <julien.grall@linaro.org>
  * Copyright (C) 2013 Linaro Limited.
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
  */
 
 #include <asm/device.h>
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 1b3fd6bc7d..5569efa121 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2019 Arm ltd.
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
 
 #include <xen/dm.h>
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2d6253181a..834857ceac 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1,14 +1,4 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/bitops.h>
 #include <xen/errno.h>
 #include <xen/grant_table.h>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 40e3c2e119..e363fb4764 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index 71182575f9..b7c02c9190 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/mm.h>
 #include <xen/pmap.h>
 #include <xen/vmap.h>
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 1baf25c3d9..ad56efb0f5 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * Arch-specific domctl.c
  *
diff --git a/xen/arch/arm/early_printk.c b/xen/arch/arm/early_printk.c
index 333073d97e..03cbe0fb88 100644
--- a/xen/arch/arm/early_printk.c
+++ b/xen/arch/arm/early_printk.c
@@ -1,11 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * printk() for use before the final page tables are setup.
  *
  * Copyright (C) 2012 Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index ae5bd8e95f..61802839cb 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/gic-v2.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/lib.h>
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index e217c21bf8..1ec9934191 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * xen/arch/arm/gic-v3-its.c
  *
  * ARM GICv3 Interrupt Translation Service (ITS) support
  *
  * Copyright (C) 2016,2017 - ARM Ltd
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; under version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 61d90eb386..ca7a0ab39a 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * xen/arch/arm/gic-v3-lpi.c
  *
  * ARM GICv3 Locality-specific Peripheral Interrupts (LPI) support
  *
  * Copyright (C) 2016,2017 - ARM Ltd
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; under version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/cpu.h>
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 018fa0dfa0..37eb7ff95e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/gic-v3.c
  *
@@ -9,16 +10,6 @@
  *
  * Vijaya Kumar K <vijaya.kumar@caviumnetworks.com>, Cavium Inc
  * ported to Xen
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
  */
 
 #include <xen/acpi.h>
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 98c021f1a8..56490dbc43 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/gic-vgic.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/errno.h>
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 9b82325442..d922ea67aa 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/gic.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/lib.h>
diff --git a/xen/arch/arm/guest_atomics.c b/xen/arch/arm/guest_atomics.c
index 1b78a062f0..6ba77f082d 100644
--- a/xen/arch/arm/guest_atomics.c
+++ b/xen/arch/arm/guest_atomics.c
@@ -1,17 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/guest_atomics.c
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
 #include <xen/cpu.h>
 
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 87de40d0cb..43d3215304 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -1,18 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Guest page table walk
  * Copyright (c) 2017 Sergej Proskurin <proskurin@sec.in.tum.de>
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
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index abb6236e27..225fd343dd 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index fc1a52767d..0989309fea 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/hvm.c
  *
  * Arch-specific hardware virtual machine abstractions.
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
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 4ce94243aa..172583df04 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -1,19 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/io.c
  *
  * ARM I/O handlers
  *
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 1338c86adb..5585457189 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arm/ioreq.c: hardware virtual machine I/O emulation
  *
  * Copyright (c) 2019 Arm ltd.
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
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index fd0c15fffd..0fb924978d 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/irq.c
  *
@@ -5,16 +6,6 @@
  *
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/cpu.h>
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 2556a45c38..23b840ea9e 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Kernel image loading.
  *
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 57abc746e6..d646379c8c 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *  Copyright (C) 2016 Citrix Systems R&D Ltd.
  */
diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 3e3620294c..31db846354 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/mem_access.c
  *
  * Architecture-specific mem_access handling routines
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public
- * License v2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/mem_access.h>
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6ccffeaea5..630175276f 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/mm.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/arm/monitor.c b/xen/arch/arm/monitor.c
index 8c4a396e3c..6c93a9e993 100644
--- a/xen/arch/arm/monitor.c
+++ b/xen/arch/arm/monitor.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/monitor.c
  *
  * Arch-specific monitor_op domctl handler.
  *
  * Copyright (c) 2016 Tamas K Lengyel (tamas.lengyel@zentific.com)
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public
- * License v2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 8449f97fe7..4df5fff42d 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 25442c48fe..f1ef844ef3 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/percpu.h>
 #include <xen/cpu.h>
 #include <xen/init.h>
diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index 95a8cdc0ee..7b1682ee10 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * Arch-specific physdev.c
  *
diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
index 4db5bbb4c5..6701ff77bc 100644
--- a/xen/arch/arm/platform.c
+++ b/xen/arch/arm/platform.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/platform.c
  *
@@ -5,16 +6,6 @@
  *
  * Julien Grall <julien.grall@linaro.org>
  * Copyright (C) 2013 Linaro Limited.
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
  */
 
 #include <asm/platform.h>
diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 403cc84324..743687a303 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * platform_hypercall.c
  *
diff --git a/xen/arch/arm/processor.c b/xen/arch/arm/processor.c
index acad8b31d6..6de206c07e 100644
--- a/xen/arch/arm/processor.c
+++ b/xen/arch/arm/processor.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/processor.c
  *
@@ -5,16 +6,6 @@
  *
  * Julien Grall <julien.grall@linaro.org>
  * Copyright (C) 2014 Linaro Limited.
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
  */
 #include <asm/procinfo.h>
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..695d2fa1f1 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/psci.c
  *
@@ -5,16 +6,6 @@
  *
  * Andre Przywara <andre.przywara@linaro.org>
  * Copyright (c) 2013 Linaro Limited.
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
  */
 
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 4395640019..1f26f67b90 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/setup.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/compile.h>
diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 0606cb84b3..205a5e7f8c 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/delay.h>
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index 5823a69d3e..bb65a08fc1 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <xen/mm.h>
 #include <asm/system.h>
 #include <asm/smp.h>
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index f7bda3a18b..635977e489 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -1,19 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/smpboot.c
  *
  * Dummy smpboot support
  *
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/cpu.h>
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e847..b0a78a8b10 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * Arch-specific sysctl.c
  *
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index dec53b5f7d..92baaf8cb2 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/time.c
  *
@@ -5,16 +6,6 @@
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/console.h>
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 79f9ed0725..061c92acbd 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1,19 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/traps.c
  *
  * ARM Trap handlers
  *
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index b5fbbe1cb8..4adfc0a68d 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -1,19 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/arm64/vcpreg.c
  *
  * Emulate co-processor registers trapped.
  *
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b1bd7a46ad..0026cb4360 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vgic-v2.c
  *
@@ -5,16 +6,6 @@
  *
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 58d939b85f..299b384250 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * xen/arch/arm/vgic-v3-its.c
  *
@@ -5,18 +6,6 @@
  *
  * Andre Przywara <andre.przywara@arm.com>
  * Copyright (c) 2016,2017 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; under version 2 of the License.
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
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 7fb99a9ff2..7d2507079d 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vgic-v3.c
  *
@@ -6,16 +7,6 @@
  *
  * Vijaya Kumar K <vijaya.kumar@caviumnetworks.com>
  * Copyright (c) 2014 Cavium Inc.
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
  */
 
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 83386cf3d5..c61c68870c 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vgic.c
  *
@@ -5,16 +6,6 @@
  *
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
index eaac92078d..ba99f56eb2 100644
--- a/xen/arch/arm/vm_event.c
+++ b/xen/arch/arm/vm_event.c
@@ -1,21 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/vm_event.c
  *
  * Architecture-specific vm_event handling routines
  *
  * Copyright (c) 2016 Tamas K Lengyel (tamas.lengyel@zentific.com)
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public
- * License v2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index a9fc5817f9..3bc4bb5508 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -1,15 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vpci.c
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
  */
 #include <xen/sched.h>
 #include <xen/vpci.h>
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 43522d48fd..f6144da1d7 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * arch/arm/vpl011.c
  *
  * Virtual PL011 UART
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
 
 #define XEN_WANT_FLEX_CONSOLE_RING 1
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 744d43ec27..d1615be8a6 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -1,15 +1,4 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/types.h>
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 676740ef15..7335276f3f 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -1,17 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * xen/arch/arm/vsmc.c
  *
  * Generic handler for SMC and HVC calls according to
  * ARM SMC calling convention
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index aeaea78e4c..48f2daa907 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vtimer.c
  *
@@ -5,16 +6,6 @@
  *
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2011 Citrix Systems.
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
  */
 
 #include <xen/lib.h>
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 80d4755d43..d5ba483f1e 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * xen/arch/arm/vuart.c
  *
@@ -19,16 +20,6 @@
  * Julien Grall <julien.grall@linaro.org>
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2012 Citrix Systems.
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
  */
 #include <xen/lib.h>
 #include <xen/sched.h>
-- 
2.25.1


