Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E0A81183
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942757.1341854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVe-0002v0-BO; Tue, 08 Apr 2025 16:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942757.1341854; Tue, 08 Apr 2025 16:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVe-0002tW-7N; Tue, 08 Apr 2025 16:09:10 +0000
Received: by outflank-mailman (input) for mailman id 942757;
 Tue, 08 Apr 2025 16:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVc-0002e3-E0
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2417::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4e7e22-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:06 +0200 (CEST)
Received: from MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Tue, 8 Apr 2025 16:09:02 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::e3) by MN2PR01CA0046.outlook.office365.com
 (2603:10b6:208:23f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Tue,
 8 Apr 2025 16:08:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:02 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:00 -0500
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
X-Inumbo-ID: cb4e7e22-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTFE9824XvjfiH9b3+ZuyHYaPZ9x+mdyDjtaNaXJyzFz45xfCg3mKadTGtLtz6Ean3dI35GVZN8unTiTwMtv2WGkcN1VBFeMAYK5wpIAuNHuWn5BXvQ/+fu2Jt87RJm+VKlXUJjbOx0WUjiEfH7bXE7HmZPNYwhgwG7ZyKjlfKdVBiQfoxY5c3U+5G2YbTcfpfajge1OengPM1cx7QJCiOySfaoCJvxlsu6+VHZMdmLZu5OQmf2qeSf18CY/cFKFOIaxY5hrZ6aNee7bFJGiLcpN5FScT7Mo8S1sNGS+YFZ/z3+SR1Fe5qeoPe/7jnwrPVU7Ua8d6RfMF0tal1Fflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acKtpqdz5rKNc8zWQXTuBR08dJPveEi+YEopFwkWo8w=;
 b=cYxBvsoiFYFvShJOAx8rx1mebMqsaMRyVFt/upYe4UmEz9OvsOJqYU5E6yjhfDb78OjTzI3c/S1BtKhvyZhoXNZDPkWCYb/7wSfyn/fgiPpVemsghKmkTvQpkE/aEb7y+lJzLdGUQf0CUoWEFLDq7TvTLljOO5y8k+t+49PLFDSpzEIsXAjqr1ipOVByXXR+BFN57UstEkuXlUWbr1o/rCEGIXoA5zT+ZFqwliE2EeKP4KqU2SwHpRvm1ODmuOYQjgddzaIA62vxzhl63Z3evyGf5JaaHqBDL4b+k4K3D91+J7Hfv6G+7L4NroNp4hD7Wzx1Y7EzjahRFtlvs8qOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acKtpqdz5rKNc8zWQXTuBR08dJPveEi+YEopFwkWo8w=;
 b=bi0exNWpXUr5omJEPM2wf6OflVwNrnUga3X7wCXenMJb84FP/hG0q1no+xB5oVLmyxcEyqbpo+3FdTi+tEUW7Bcnatep/ukd32SkYVL2reoO2cScfVdqKp+mEQ+NjomKgzWAvOejs+9gU5jzP0p5L86jPjjZVXn8owlsbWBh+NE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Alejandro Vallejo" <agarciav@amd.com>
Subject: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
Date: Tue, 8 Apr 2025 17:07:25 +0100
Message-ID: <20250408160802.49870-4-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 9435efbe-6024-4f3b-8173-08dd76b7adac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f63r3c4TkUhcP5Z+KKCL7F1L9SWwsmAWYFqyKhZvVqXX7AeCDYgFHKSap1ai?=
 =?us-ascii?Q?QWX55EHZ3TybxLZnS6HRptJ9Z+23Sry7Wg49QHP39vE6diMb3TgpKKnTmpOk?=
 =?us-ascii?Q?yGErlL/EuJD47+waHttjTSwWnsGdHON4vQ9dNCtYt1/ukA4lQHAhF25yb9a+?=
 =?us-ascii?Q?Ukp9+HeEKI84Wk6M+QpSfD9nKjOdcvHogXoUAiuSQGZm6diNhBh07pyaaDA6?=
 =?us-ascii?Q?qvIgJHC4dRqHX9GWDyLLdH8+ecC0ppLW9BzFx8rpzOZ0dvKaevSX/8SQwAy3?=
 =?us-ascii?Q?HAqCA2e4U5Ay84FQMeTh6RvSEuo7M9IGsm9IKpQjR81n9mP3k/bAFQKqcQKd?=
 =?us-ascii?Q?F7L8Cx9i0EPHH3QbfLh3wofZSJ7XOaPuUENx01wZjAa8tv+FeOd9sJueDfDt?=
 =?us-ascii?Q?XDsonNksm5WD0nUMf1g4aUv5ZmHj79fJQ/pEdJs8AdlMlgvTkLaukOGHfTpV?=
 =?us-ascii?Q?wNJ5UHpFS0cipSOqWeOfzCrNjIWnKZDdH7jhuOVF2OwLdI94GtCHoc5rWes1?=
 =?us-ascii?Q?9LL0RDvmYSBp08mzD4E1YUxdRAtkAA4d+vDs55CIA5cHvM7mSgjkNHhZZULt?=
 =?us-ascii?Q?lM1ck+fATvaXCwAl9UGz17OQKFx9Y9+pi66Iatzl12/oFNoFWwEQD9qZXFPB?=
 =?us-ascii?Q?i2AVamcItWQY/lHOHh4oyU4F7fkQz9tQrBtt4x17JjA7TztJjpxF+54vZe/m?=
 =?us-ascii?Q?KBmpKiCaTM8JY0T64NZtygThlngfm0hBVdEO1dQnF9bNfnUvL+VFoyQOdp+G?=
 =?us-ascii?Q?W8KtuADQvB2YPF+kybEJQnnahEsnO7FJHG52Fxy2Q0d2gGwqLIjxOWNfbxxj?=
 =?us-ascii?Q?pz/PCzadx1s/eQ3wlveDCaYZbLg35k2QMCOWGeKtIAfv1/xoQQ5xLV6cfG/1?=
 =?us-ascii?Q?gD1w73Cp1wpxCmNlAynZ2s3tc+M2x5qfmPfFDz9F5HSYXwwvHMDq3jxRW5sA?=
 =?us-ascii?Q?1VkZZvY2eXNIqOug/blnGo0CNTGWFKnGA8EszQm+5O7orYqdEnhTexM2BKhp?=
 =?us-ascii?Q?whAJ5oT2fkkbgQLjeRus4upkaW5CfxcaNsE0O9tmQj3ew9ibIO1XSVdAaRAo?=
 =?us-ascii?Q?q8Krn8hsCKFZ0Z1IWSkY6++lZqORtYnUi1EZ4IGz5lCpcVkIzvc0hwG3TC3N?=
 =?us-ascii?Q?LNUnZcb2UsLpzcLGEWyJMXM80lQw6TOSVgPr1Gfw+2z8qwvgUjTqD1sod6Jz?=
 =?us-ascii?Q?k/rM4rwrpJZPs0tUYnERJJx7ncBshtxwxFQaELsLDERQIAVSRfg3KVfH7Wej?=
 =?us-ascii?Q?0CNBAMdWyi2LzUnufoo3lZItALnmYuGAwbKSgZ2a/UXh8ArgcGC67cWoawDR?=
 =?us-ascii?Q?laJ+lUECDbCRkn4JwOnLXApD3XICVOjyANQOlr1CV/Z7Xai3w0jTULPRWhNb?=
 =?us-ascii?Q?1nI5H6nxI+mWv1pVLJtFexpLifjJ1ipmUs702foAXSW/er+2InKBVfeejzbb?=
 =?us-ascii?Q?bZP/6FSRea1mP/PRGVWH8oL5YVXjw7wJAF6zprGbi75+Pw+zFt75ZuNU8nqY?=
 =?us-ascii?Q?auojYAQSuvJ8Ou8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:02.1022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9435efbe-6024-4f3b-8173-08dd76b7adac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add a container for the "cooked" command line for a domain. This
provides for the backing memory to be directly associated with the
domain being constructed.  This is done in anticipation that the domain
construction path may need to be invoked multiple times, thus ensuring
each instance had a distinct memory allocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
No changes on ACPI cmdline handling on PVH, as it's orthogonal to the
purpose of this patch.

v3:
  * s/xfree/XFREE/ on failed construct_dom0() to avoid a dangling
cmdline ptr.
  * Re-flow hvm_copy_to_guest_phys() into a multi-line call.
  * s/bd->cmdline != NULL/b->cmdline/ (to homogenise with the previous
    cmdline pointer check)
---
 xen/arch/x86/hvm/dom0_build.c          | 12 +++----
 xen/arch/x86/include/asm/boot-domain.h |  1 +
 xen/arch/x86/pv/dom0_build.c           |  4 +--
 xen/arch/x86/setup.c                   | 50 +++++++++++++++++++-------
 4 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2a094b3145..ebad5a49b8 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
-    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
     const char *initrd_cmdline = NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
@@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
             initrd = NULL;
     }
 
-    if ( cmdline )
-        extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
+    if ( bd->cmdline )
+        extra_space += elf_round_up(&elf, strlen(bd->cmdline) + 1);
 
     last_addr = find_memory(d, &elf, extra_space);
     if ( last_addr == INVALID_PADDR )
@@ -778,9 +777,10 @@ static int __init pvh_load_kernel(
     /* Free temporary buffers. */
     free_boot_modules();
 
-    if ( cmdline != NULL )
+    if ( bd->cmdline )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
+        rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
+                                    strlen(bd->cmdline) + 1, v);
         if ( rc )
         {
             printk("Unable to copy guest command line\n");
@@ -791,7 +791,7 @@ static int __init pvh_load_kernel(
          * Round up to 32/64 bits (depending on the guest kernel bitness) so
          * the modlist/start_info is aligned.
          */
-        last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
+        last_addr += elf_round_up(&elf, strlen(bd->cmdline) + 1);
     }
     if ( initrd != NULL )
     {
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index fcbedda0f0..d7c6042e25 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -15,6 +15,7 @@ struct boot_domain {
 
     struct boot_module *kernel;
     struct boot_module *module;
+    const char *cmdline;
 
     struct domain *d;
 };
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index b485eea05f..e1b78d47c2 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -972,8 +972,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( image->cmdline_pa )
-        strlcpy((char *)si->cmd_line, __va(image->cmdline_pa), sizeof(si->cmd_line));
+    if ( bd->cmdline )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 585316f1ca..83cb66e309 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi)
+static size_t __init domain_cmdline_size(
+    struct boot_info *bi, struct boot_domain *bd)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
+    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+
+    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
 
+    if ( s == 0 )
+        return s;
+
+    /*
+     * Certain parameters from the Xen command line may be added to the dom0
+     * command line. Add additional space for the possible cases along with one
+     * extra char to hold \0.
+     */
+    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;
+
+    return s;
+}
+
+static struct domain *__init create_dom0(struct boot_info *bi)
+{
+    char *cmdline = NULL;
+    size_t cmdline_size;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1020,20 +1040,24 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( alloc_dom0_vcpu0(d) == NULL )
         panic("Error creating %pd vcpu 0\n", d);
 
-    /* Grab the DOM0 command line. */
-    if ( bd->kernel->cmdline_pa || bi->kextra )
+    cmdline_size = domain_cmdline_size(bi, bd);
+    if ( cmdline_size )
     {
+        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
+            panic("Error allocating cmdline buffer for %pd\n", d);
+
         if ( bd->kernel->cmdline_pa )
-            safe_strcpy(cmdline,
-                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
+            strlcpy(cmdline,
+                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                    cmdline_size);
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, bi->kextra);
+            strlcat(cmdline, bi->kextra, cmdline_size);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            safe_strcat(cmdline, " noapic");
+            strlcat(cmdline, " noapic", cmdline_size);
 
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
@@ -1043,17 +1067,19 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
         if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
         {
-            safe_strcat(cmdline, " acpi=");
-            safe_strcat(cmdline, acpi_param);
+            strlcat(cmdline, " acpi=", cmdline_size);
+            strlcat(cmdline, acpi_param, cmdline_size);
         }
-
-        bd->kernel->cmdline_pa = __pa(cmdline);
+        bd->kernel->cmdline_pa = 0;
+        bd->cmdline = cmdline;
     }
 
     bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
+    XFREE(cmdline);
+
     return d;
 }
 
-- 
2.43.0


