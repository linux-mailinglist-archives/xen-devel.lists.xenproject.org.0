Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE25695DB3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 09:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495057.765307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRr7Q-0006N9-Vh; Tue, 14 Feb 2023 08:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495057.765307; Tue, 14 Feb 2023 08:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRr7Q-0006LN-Sc; Tue, 14 Feb 2023 08:56:56 +0000
Received: by outflank-mailman (input) for mailman id 495057;
 Tue, 14 Feb 2023 08:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anql=6K=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pRr7Q-00066D-1y
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 08:56:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 87da0b50-ac45-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 09:56:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B5E81BCB;
 Tue, 14 Feb 2023 00:57:37 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67A0E3F703;
 Tue, 14 Feb 2023 00:56:53 -0800 (PST)
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
X-Inumbo-ID: 87da0b50-ac45-11ed-933c-83870f6b2ba8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	bertrand.marquis@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/misra: add entries to exclude-list.json
Date: Tue, 14 Feb 2023 08:56:35 +0000
Message-Id: <20230214085635.3170962-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214085635.3170962-1-luca.fancellu@arm.com>
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclude-list.json for those files that need to be
excluded from the analysis scan.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This list is originated from Michal's work here:
https://patchwork.kernel.org/project/xen-devel/patch/20221116092032.4423-1-michal.orzel@amd.com/#25123099
the only files removed are the *arm/smmu* that, if I understand
correctly, we would like to include in the scan.
---
---
 docs/misra/exclude-list.json | 207 ++++++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 1fb0ac67747b..3a6dc0809af5 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -1,4 +1,209 @@
 {
     "version": "1.0",
-    "content": []
+    "content": [
+        {
+            "rel_path": "arch/arm/arm64/cpufeature.c"
+        },
+        {
+            "rel_path": "arch/arm/arm64/insn.c"
+        },
+        {
+            "rel_path": "arch/arm/arm64/lib/find_next_bit.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/boot.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpu_idle.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/cpuidle_menu.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/lib.c"
+        },
+        {
+            "rel_path": "arch/x86/acpi/power.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/amd.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/centaur.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/common.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/hygon.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/intel.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/intel_cacheinfo.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mcheck/mce-apei.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mtrr/*"
+        },
+        {
+            "rel_path": "arch/x86/cpu/mwait-idle.c"
+        },
+        {
+            "rel_path": "arch/x86/delay.c"
+        },
+        {
+            "rel_path": "arch/x86/dmi_scan.c"
+        },
+        {
+            "rel_path": "arch/x86/domain.c"
+        },
+        {
+            "rel_path": "arch/x86/genapic/*"
+        },
+        {
+            "rel_path": "arch/x86/i387.c"
+        },
+        {
+            "rel_path": "arch/x86/irq.c"
+        },
+        {
+            "rel_path": "arch/x86/mpparse.c"
+        },
+        {
+            "rel_path": "arch/x86/srat.c"
+        },
+        {
+            "rel_path": "arch/x86/time.c"
+        },
+        {
+            "rel_path": "arch/x86/traps.c"
+        },
+        {
+            "rel_path": "arch/x86/usercopy.c"
+        },
+        {
+            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c"
+        },
+        {
+            "rel_path": "common/bitmap.c"
+        },
+        {
+            "rel_path": "common/bunzip2.c"
+        },
+        {
+            "rel_path": "common/cpu.c"
+        },
+        {
+            "rel_path": "common/earlycpio.c"
+        },
+        {
+            "rel_path": "common/inflate.c"
+        },
+        {
+            "rel_path": "common/libfdt/*"
+        },
+        {
+            "rel_path": "common/lz4/decompress.c"
+        },
+        {
+            "rel_path": "common/notifier.c"
+        },
+        {
+            "rel_path": "common/radix-tree.c"
+        },
+        {
+            "rel_path": "common/rcupdate.c"
+        },
+        {
+            "rel_path": "common/softirq.c"
+        },
+        {
+            "rel_path": "common/tasklet.c"
+        },
+        {
+            "rel_path": "common/ubsan/ubsan.c"
+        },
+        {
+            "rel_path": "common/un*.c"
+        },
+        {
+            "rel_path": "common/vsprintf.c"
+        },
+        {
+            "rel_path": "common/xz/*"
+        },
+        {
+            "rel_path": "common/zstd/*"
+        },
+        {
+            "rel_path": "crypto/rijndael.c"
+        },
+        {
+            "rel_path": "crypto/vmac.c"
+        },
+        {
+            "rel_path": "drivers/acpi/apei/*"
+        },
+        {
+            "rel_path": "drivers/acpi/hwregs.c"
+        },
+        {
+            "rel_path": "drivers/acpi/numa.c"
+        },
+        {
+            "rel_path": "drivers/acpi/osl.c"
+        },
+        {
+            "rel_path": "drivers/acpi/reboot.c"
+        },
+        {
+            "rel_path": "drivers/acpi/tables.c"
+        },
+        {
+            "rel_path": "drivers/acpi/tables/*"
+        },
+        {
+            "rel_path": "drivers/acpi/utilities/*"
+        },
+        {
+            "rel_path": "drivers/char/ehci-dbgp.c"
+        },
+        {
+            "rel_path": "drivers/char/xhci-dbc.c"
+        },
+        {
+            "rel_path": "drivers/cpufreq/*"
+        },
+        {
+            "rel_path": "drivers/video/font_*"
+        },
+        {
+            "rel_path": "lib/list-sort.c"
+        },
+        {
+            "rel_path": "lib/mem*.c"
+        },
+        {
+            "rel_path": "lib/rbtree.c"
+        },
+        {
+            "rel_path": "lib/str*.c"
+        },
+        {
+            "rel_path": "lib/xxhash32.c"
+        },
+        {
+            "rel_path": "lib/xxhash64.c"
+        }
+    ]
 }
-- 
2.25.1


