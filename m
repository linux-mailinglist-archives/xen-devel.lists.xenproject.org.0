Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B5A91CD3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957512.1350624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgD-0005F4-Kc; Thu, 17 Apr 2025 12:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957512.1350624; Thu, 17 Apr 2025 12:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgD-0005DY-H7; Thu, 17 Apr 2025 12:49:21 +0000
Received: by outflank-mailman (input) for mailman id 957512;
 Thu, 17 Apr 2025 12:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgB-00057t-Rs
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2405::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efa2e51-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:17 +0200 (CEST)
Received: from CH2PR05CA0038.namprd05.prod.outlook.com (2603:10b6:610:38::15)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:49:12 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::ab) by CH2PR05CA0038.outlook.office365.com
 (2603:10b6:610:38::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 12:49:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:12 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:09 -0500
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
X-Inumbo-ID: 5efa2e51-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpBVcqgZcMnETPrK/8TagwUfAxZzD6rbE3iMGjaXRmyq2CZyAtoTS0SY7rsZpI2a6bsmoI1TuQcrAR4j7jKuBEY/CtzkEeENSL6jfgVhzvAENyIQccNpOiH3tjdV7pTp04Skg0pXxGfho77VsbnNSrqDOpRLHDOYroOtWnrJ4V8e9BN5LyI0+guAXTNwtBBcvDNPnLID+ql3G7+s2LO+hlEP1uL0obXQNp+zTIeEir/CGrko9DjeyOzx2ydoPZwfE+frDFXDewtpjD+p0OYccSnphIEgICJNCiGXgGHryQ6Az7BDBAHIUzPEwoyUdObg40AAdtO/Tad6Pg3CWGIvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPTSOCD5V92BOMtpj6x7Vs6EoxoU/PucsJHEdi/GDEU=;
 b=E9vp2QUnhsmeh0V5sS4Uwh876ewtu3TX7bt+HqjT26nsWh0PbK6n5xyCXcS0btiK6nYh3pYE9nke1/Oyg7dCB+Wc394jiP+UNP2SdtJ55gA4OXaVqrVOxkeoysgfJf5yR/bUgVsYPbyvOlFcNgk5QUXghejQspDvsoAP8j7lVuFTKHPMLAbn2Wc9zW8a1q7wI56C9g3+VeGsxeRiS30YT5dJlsSOVOgovXFystGmdMaP8Gc/jsbnRsnDmkkbW/h9PmjR0OdJkx4ZfbpRIF0dmUbxfCYy1r4aLg0cCzOINYUhhFED8cRO5nXS8Fx4vhRkYWDWYAYDvdVIp37tdjdIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPTSOCD5V92BOMtpj6x7Vs6EoxoU/PucsJHEdi/GDEU=;
 b=vFm4zTQvQV6WFU71ZWPLWsH8z6SH8pBD6vx8RRsqplyv3dUIlMlqDkXJDlnTse6MtinK/w0Y38srVfBJv7If00Aay26Y+Jh+sZnotm5z3XWb9CVlxhcxzBOtK7rpL3aPA0YUL0qdc8A6OyGcjzUP9NASwQeXrToOV65xKkDmINc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 01/13] x86/boot: add cmdline to struct boot_domain
Date: Thu, 17 Apr 2025 13:48:23 +0100
Message-ID: <20250417124844.11143-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: e847c6ac-a9e8-41d9-e2ff-08dd7dae40ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HabIPN4LFXLzCVihku2mav3DP6yKG1Nv54GAXd/PcJva65VWN0PbHzxr4eak?=
 =?us-ascii?Q?oz4LdgcoGPIvEZFxBzqVBUZSpi+B1dL2pjN0DKPAl6v9TtDjJNB4A92d7eEI?=
 =?us-ascii?Q?WEeF4r4Cz732T2+kI8NZ2GgF0ulMbPrWPYpD3AhQ+qQ65bp8uR5YFDZEEdxN?=
 =?us-ascii?Q?Lxot7OcTV7olPkUPjn7rMQPrDDoTGLF9yZ+D0CL3Gt6jeqPMHMsse0z91hGz?=
 =?us-ascii?Q?mAA9KC9cpcaszO2L771b1GpYXA/R3sDRPQJnTtUilCO9vYU4AkwlFhmyhWdQ?=
 =?us-ascii?Q?880HaJ8JpwcQgk/Usvf6zWj0J3q/S2nvG9fIzs2JZO7NDyu0mmh8RdxDRrPF?=
 =?us-ascii?Q?l6M4UtszUaoOLkp4EHdHXwk7XaHrlGwTAG+YPTqXKEirgNFStXJrGtvJCtIE?=
 =?us-ascii?Q?hMBmHL56NPNatNM6DstTGo/oKrPre/Rbp/PoC/KrJ3+XZZQ5CQ7hKFqPPHBw?=
 =?us-ascii?Q?Nez4KhXaiI9QgnqeZvHrzj1YNTbMMg6ObFJa/lDuxdzzegQdMAFu9mxpux5S?=
 =?us-ascii?Q?7N1f6J204ePjjiqMJHKvCYWJ9797eAA4uMTF4yyNDxO2Uf1oBPfp3due1Y8h?=
 =?us-ascii?Q?Xn6es98FIZzlkl9iLSlHIcDVDjPC3RLxn5ccYF2Ffp1ELY4szMGXBzn828Sm?=
 =?us-ascii?Q?fktqHrfZ76x5jouf9xCq2H0DE6pS3/vVCE0z9CTsPcf3TynKtFn8nTKLe0oR?=
 =?us-ascii?Q?uu5O051zaoKwWFNJDIXIo4BQ7eW3hbTaOkRq2u9aSu7NoqRaX9ez+fPWnTuB?=
 =?us-ascii?Q?Y/ZWyl0BYKSI6hnHgECIVBtgioj4p/Ts1B0Ly2z1FInovCXi1peyDrrLVIcR?=
 =?us-ascii?Q?WBFwPva6A3LGeZRtT0u5on1qGFOnAPRfSkjLT/pCegAcJZPA5CEBHyoNSdLa?=
 =?us-ascii?Q?eZyfp/8psqGB9GYS/0oOHx+0PxIAOvNsN2oDQgWwsDoqdE7SgTWWWJ/12iRX?=
 =?us-ascii?Q?b5zl1XRQMu7Kb1uxgQkNinRqTfO7j+tKoYE0LUrU1Xn7/6hk/AlyEPlX/u+e?=
 =?us-ascii?Q?vAImlZsbRkaQY7pV6plK1fpnV/xwyhT2tnaWHisPyxdF9x4zwZ0G7Z7YUQlr?=
 =?us-ascii?Q?5w9L21G83e/T+zsZh58kzSBFcQCey5XIX8aL+kkDI1lUaouTN8srMSPZGKcj?=
 =?us-ascii?Q?UBsyFXxVQNOJVa86Ee3hzzfF+LVGGVJidFNaD+ZI3n98oRu5soRcarFgizxR?=
 =?us-ascii?Q?PINNpoMuHk0mZ3P6AaLysoA1V3k586axGBaE8U/rnirS8Hw1SmQJkJQJLDzJ?=
 =?us-ascii?Q?OUkAj3RoRYDJYC7GG6pzJuf6KjKRTbO+1xN+LyuPw/4+rrsRVpJoSNaENKlf?=
 =?us-ascii?Q?d04J+P7MX/1B6cYDZhc6qLcq9wz+nj0FF6aqr61SX1dekAQkEFwTNIeafWIS?=
 =?us-ascii?Q?e7dsWKG3DsSh+h98nsgqn1eOOf+LOxrnrfdDB/2HIZdx6Vothng3cv+9xbDg?=
 =?us-ascii?Q?vx1OZzK8PqZ0cV9zpAlI6QqueZMU/TbOhmht8bXIiVMnD2Wk3a8/fCjHbccK?=
 =?us-ascii?Q?MNeUd2X75b05C4RLeppg8dgaXsEq1fGIDoJE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:12.3029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e847c6ac-a9e8-41d9-e2ff-08dd7dae40ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

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
v4:
  * Manually nullify bd->cmdline before xfree()ing cmdline.
  * const-ify arguments of domain_cmdline_size()
  * Add cmdline_len to pvh_load_kernel()
---
 xen/arch/x86/hvm/dom0_build.c          | 31 ++++++++--------
 xen/arch/x86/include/asm/boot-domain.h |  1 +
 xen/arch/x86/pv/dom0_build.c           |  4 +-
 xen/arch/x86/setup.c                   | 51 ++++++++++++++++++++------
 4 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2a094b3145..49832f921c 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -653,7 +653,7 @@ static int __init pvh_load_kernel(
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
-    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
+    unsigned long cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
     const char *initrd_cmdline = NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
@@ -736,8 +736,7 @@ static int __init pvh_load_kernel(
             initrd = NULL;
     }
 
-    if ( cmdline )
-        extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
+    extra_space += elf_round_up(&elf, cmdline_len);
 
     last_addr = find_memory(d, &elf, extra_space);
     if ( last_addr == INVALID_PADDR )
@@ -778,21 +777,21 @@ static int __init pvh_load_kernel(
     /* Free temporary buffers. */
     free_boot_modules();
 
-    if ( cmdline != NULL )
+    rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline, cmdline_len, v);
+    if ( rc )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
-        if ( rc )
-        {
-            printk("Unable to copy guest command line\n");
-            return rc;
-        }
-        start_info.cmdline_paddr = last_addr;
-        /*
-         * Round up to 32/64 bits (depending on the guest kernel bitness) so
-         * the modlist/start_info is aligned.
-         */
-        last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
+        printk("Unable to copy guest command line\n");
+        return rc;
     }
+
+    start_info.cmdline_paddr = cmdline_len ? last_addr : 0;
+
+    /*
+     * Round up to 32/64 bits (depending on the guest kernel bitness) so
+     * the modlist/start_info is aligned.
+     */
+    last_addr += elf_round_up(&elf, cmdline_len);
+
     if ( initrd != NULL )
     {
         rc = hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
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
index 3c257f0bad..4df012460d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi)
+static size_t __init domain_cmdline_size(const struct boot_info *bi,
+                                         const struct boot_domain *bd)
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
         panic("Error creating %pdv0\n", d);
 
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
@@ -1043,17 +1067,20 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
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
 
+    bd->cmdline = NULL;
+    xfree(cmdline);
+
     return d;
 }
 
-- 
2.43.0


