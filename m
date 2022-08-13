Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB75917EF
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 02:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386004.621843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMfUh-0006lJ-NK; Sat, 13 Aug 2022 00:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386004.621843; Sat, 13 Aug 2022 00:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMfUh-0006jG-KF; Sat, 13 Aug 2022 00:59:15 +0000
Received: by outflank-mailman (input) for mailman id 386004;
 Sat, 13 Aug 2022 00:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oMfUg-0006jA-Oc
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 00:59:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2509d1a1-1aa3-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 02:59:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23D61B8243B;
 Sat, 13 Aug 2022 00:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67478C433D7;
 Sat, 13 Aug 2022 00:59:09 +0000 (UTC)
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
X-Inumbo-ID: 2509d1a1-1aa3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660352349;
	bh=0/pexWT/DEuEPtPWJumWd+HrqXmjzkeKrdyDHXlbYSI=;
	h=Date:From:To:cc:Subject:From;
	b=AstT8saLQNctM63NSYkPMOBrIoQ4mRfNLQze7fMnLJbEgXzeJB1hni5kRgtgik9Xk
	 mjxM6c0S+vexQincFX6o+MfkHpVPRyO7OuknBmz98MryqQ8499e0ah3p05KhrH3uh+
	 gjaV17WpfG7R7OBn8+CAzQBemYItoNRYYUYGQRC9ZyF7jz+plECAri0+KLivgPlxLi
	 b88EaIWIIjnAVFUbWvZUi1SpxrtbsUysbY2vwEcDC4ilWHj/fJMT/PYmjcVx8nKzWG
	 bcNAYYBztnQD1/esp7DANPd1J15aF/Tfk4i54Wr30cxiT+1PB41e1H/ksR2IvguhB1
	 dPjnT6HBKjbug==
Date: Fri, 12 Aug 2022 17:59:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: julien@xen.org, bertrand.marquis@arm.com
cc: sstabellini@kernel.org, george.dunlap@citrix.com, 
    andrew.cooper3@citrix.com, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org
Subject: [PATCH] add SPDX to arch/arm/*.c
Message-ID: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add SPDX license information to all the *.c files under arch/arm.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

We need to start from somewhere and I thought arch/arm/*.c would be a
good place to start.

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..8115f89408 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * alternative runtime patching
  * inspired by the x86 version
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..7c986ecb18 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Early Device Tree
  *
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index ae649d16ef..887b5426c7 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/init.h>
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 62d5e1770a..a6253cb57f 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Contains CPU feature definitions
  *
diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index f5f6562600..f586c3d781 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/decode.c
  *
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 70cd6c1a19..e5e8f806e0 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/device.c
  *
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 1b3fd6bc7d..90d403b767 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2019 Arm ltd.
  *
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2cd481979c..1a2dac95a9 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..a29207b582 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index 71182575f9..d6f62a5db0 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/mm.h>
 #include <xen/pmap.h>
 #include <xen/vmap.h>
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 1baf25c3d9..c882afe6ca 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
  * Arch-specific domctl.c
  *
diff --git a/xen/arch/arm/early_printk.c b/xen/arch/arm/early_printk.c
index 333073d97e..ef74bac110 100644
--- a/xen/arch/arm/early_printk.c
+++ b/xen/arch/arm/early_printk.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * printk() for use before the final page tables are setup.
  *
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index bd773bcc67..7a019196ed 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic-v2.c
  *
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9558bad96a..2f3abbcc7c 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic-v3-its.c
  *
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 61d90eb386..96efd38707 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic-v3-lpi.c
  *
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 64b36cec25..1565d6036a 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic-v3.c
  *
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 98c021f1a8..daf044e62d 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic-vgic.c
  *
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3b0331b538..fc2789b2dd 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/gic.c
  *
diff --git a/xen/arch/arm/guest_atomics.c b/xen/arch/arm/guest_atomics.c
index 1b78a062f0..e321840cd1 100644
--- a/xen/arch/arm/guest_atomics.c
+++ b/xen/arch/arm/guest_atomics.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/guest_atomics.c
  *
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 87de40d0cb..60c3090da9 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Guest page table walk
  * Copyright (c) 2017 Sergej Proskurin <proskurin@sec.in.tum.de>
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index abb6236e27..1a88d8bc2b 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index fc1a52767d..c062846da6 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/hvm.c
  *
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 4ce94243aa..3e513cd778 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/io.c
  *
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 1338c86adb..cf0cb465c6 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arm/ioreq.c: hardware virtual machine I/O emulation
  *
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index fd0c15fffd..9f007a524b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/irq.c
  *
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 2556a45c38..8cccd2fa7c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Kernel image loading.
  *
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 57abc746e6..bbd8e14012 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2016 Citrix Systems R&D Ltd.
  */
diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 3e3620294c..8a6cc267c4 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/mem_access.c
  *
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b42cddb1b4..7ad285902b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/mm.c
  *
diff --git a/xen/arch/arm/monitor.c b/xen/arch/arm/monitor.c
index 8c4a396e3c..328808e1cf 100644
--- a/xen/arch/arm/monitor.c
+++ b/xen/arch/arm/monitor.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/monitor.c
  *
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 8449f97fe7..b2a5bd4fba 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 25442c48fe..557983ddf5 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/percpu.h>
 #include <xen/cpu.h>
 #include <xen/init.h>
diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index 95a8cdc0ee..851a1f6569 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
  * Arch-specific physdev.c
  *
diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
index 4db5bbb4c5..a32aeeb52e 100644
--- a/xen/arch/arm/platform.c
+++ b/xen/arch/arm/platform.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/platform.c
  *
diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 403cc84324..2119a2f2c9 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
  * platform_hypercall.c
  *
diff --git a/xen/arch/arm/processor.c b/xen/arch/arm/processor.c
index acad8b31d6..bce17bd1e0 100644
--- a/xen/arch/arm/processor.c
+++ b/xen/arch/arm/processor.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/processor.c
  *
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..4ea13e56ca 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/psci.c
  *
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 500307edc0..1394d15406 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/setup.c
  *
diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 0606cb84b3..9691765716 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/delay.h>
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index 5823a69d3e..03890cd9c4 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <xen/mm.h>
 #include <asm/system.h>
 #include <asm/smp.h>
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index f7bda3a18b..edbd0171a9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/smpboot.c
  *
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e847..fe1dbe3d9d 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
  * Arch-specific sysctl.c
  *
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index dec53b5f7d..78ec806c5f 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/time.c
  *
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 79f9ed0725..8036fcd1ed 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/traps.c
  *
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index b5fbbe1cb8..b549bca406 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/arm64/vcpreg.c
  *
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b1bd7a46ad..30419554af 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vgic-v2.c
  *
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 58d939b85f..30238448b1 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vgic-v3-its.c
  *
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 7fb99a9ff2..201b68492e 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vgic-v3.c
  *
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 83386cf3d5..a93f872709 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vgic.c
  *
diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
index eaac92078d..1edb5acabb 100644
--- a/xen/arch/arm/vm_event.c
+++ b/xen/arch/arm/vm_event.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/vm_event.c
  *
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index a9fc5817f9..57048ae705 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vpci.c
  *
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 43522d48fd..34e85b7a9e 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * arch/arm/vpl011.c
  *
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 744d43ec27..4a14ab1384 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 676740ef15..e8520cdd35 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vsmc.c
  *
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index aeaea78e4c..0ae135b0bc 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vtimer.c
  *
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 80d4755d43..c75ecec95f 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * xen/arch/arm/vuart.c
  *

