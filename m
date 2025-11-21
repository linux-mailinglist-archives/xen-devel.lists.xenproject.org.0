Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B97C789BC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168658.1494681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtP-0006Dv-5r; Fri, 21 Nov 2025 11:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168658.1494681; Fri, 21 Nov 2025 11:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtO-00068c-Sg; Fri, 21 Nov 2025 11:01:30 +0000
Received: by outflank-mailman (input) for mailman id 1168658;
 Fri, 21 Nov 2025 11:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrS-0007TB-Ji
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:30 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23875a94-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:24 +0100 (CET)
Received: from CH0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:b0::6)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:59:19 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:b0:cafe::70) by CH0PR03CA0001.outlook.office365.com
 (2603:10b6:610:b0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:59:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:19 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:17 -0800
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
X-Inumbo-ID: 23875a94-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE/GvEVAomOLSoMfTYKC27hUuGCaQBkEJHlj+fdlgsVtP7vJKldSKYqsffwbBjL/or61XOi8KRq0pFbwih6xfIC/z3p3/HmNyGHDRjD6AHG2D8l+tQkNTfDe55RavQu0ICScTBP8AsYHA8K3myWAQDGtzkgDAJC2flPw165ETm4mwH4qmw/8pOEiARMqYM94Q2JKx3Oqc/mGkAbtb6y5Ib6Z84QLkdlwnlfMjN0NhK0dp6tfi7fptd7g2SN1kzkCPpEb/Pvzq6JjgLBSuVx3eWyzZ9S543kSIiYk+QUr0k/EASLxl17bLwBIaPzAZb9GsT3bFlSxllU3dOQ27ykaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AVFT4eS0mHEUY/gIiu2cmU6pnbgN+Dcl6qdu2LcxPk=;
 b=FLM3K2ZSEOJ2jXtUEp9UdQTNGpnba8xVsBWeY4vbFP2sFAmNqHgJLGHYO5XORBu2dwLfhUth4jxNM399NwkzRNsHdbWTMGiOpPHoRnJE2yWLDivCRUyTHjfOhTiObQBo5BqkhsjbIv2i4jZlbe8cdS4VQCouzPZPvWNebDk8WTUVx378YWIUCIulVzWnyufmOsHRZyiwE/aPUHA6aB/n1ZeGp+qi3H/u1Vq2tSW5hGUNaQ45BH0/Cw0CSxrK9SZq6wXFpCjY41gblJXAY4DnfJqiIM3QYb0Rc/twj8likbBoAGJ4Wlr0sHvLO6WQE4yDYlliba3GNO5lcCjSs6I0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AVFT4eS0mHEUY/gIiu2cmU6pnbgN+Dcl6qdu2LcxPk=;
 b=2TbU2ES0qHSSSIZXCF0zE6D9/mJoq8ppVlnmC+KEax+h2SNwkNMvqGYjAXqQT7K+WbN06nXNf7+yrvCC16RS2UMdAFnz/+Gop4Bvgm6XHjFZ7WpYf+JdOD8fLhe8GxUPPPgMoakSqkJZ/zWjXe4bVuKt6BBrfdrawW7i4flMFjQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 19/24] xen/domctl: wrap hvm_save{,load} with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:56 +0800
Message-ID: <20251121105801.1251262-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ddb52b-35a3-44ef-3366-08de28ed0582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oOn7F0RaV8lxggaGT977v/4D/2IsZtf9Jl8xkvelFZYxlvRHAxHj6wqvYara?=
 =?us-ascii?Q?kTWNRGTUxDi3EtZZkGf8gnugU+svHk2duB2MAmg9DzJM+1oQcIY7zqQWosgw?=
 =?us-ascii?Q?dFjzjdDhdGW6TxHWMLko42Dmd+kvtu1M1v/F3pO+NFjbZNBIAX2tdXf9ywDJ?=
 =?us-ascii?Q?/zFBjg1FKwou/9jX35kZUD/FNE6q/5BgFg8natRX1HWQD6cwficyStEI+Q4Z?=
 =?us-ascii?Q?2yTQyV4eaj+IkNpZfYngWYHhb3hPnahFY59iq4d0qmVAmcTl1USdNfQAQkAv?=
 =?us-ascii?Q?eeNXL/yFBAxyj1lYWlBQ4u56YY35a7Weg+kSw5Ed9O0Cf1LLS0oLHITCg1E+?=
 =?us-ascii?Q?7EJT9+0OiknKR67OgxNKqROmae5WuyIBoGwTg0ARte8ts1AdvYFkh0SDe3aY?=
 =?us-ascii?Q?Tbv88v+h62OQ8CAZ+G1pFzZ+MQAameSukRAeXNpAFgnXTIo7EPYLhjoUYnJh?=
 =?us-ascii?Q?Wa20Ll6mz8pgmKzOwUnRMb6U1q/EUKZE6iTNd228F/x9e42IoVhIAin+k+oW?=
 =?us-ascii?Q?SPetCuYBlVl+/cW+ET3JBSfMn5w4/ETLDv6ukxW8dwiOX6e2hC4B6jcN+3/K?=
 =?us-ascii?Q?SHSWyx2AJCyZkjw5zbyaiuXrCxRuBUOH415GJ6AnK3EoiQBf5VzhaO5TQQRf?=
 =?us-ascii?Q?frmheGbM3xPRRoTipigpnvoBAwenZs1GLfySU6cNjisu6A4NAMEx3ISaLgxF?=
 =?us-ascii?Q?tHJVwCG7HOBel/t/YSuYFXytRYa2tyvdVO4IJYOreF4L/jX+CcDMPRSnp7tR?=
 =?us-ascii?Q?T3gQCBKYhyAdp/M5nkHFMrJNGHieMm/d2yVrYlcElWd+aGQOl7OpDQbW9VdE?=
 =?us-ascii?Q?kVmMTeuAzeJBVQFNCfzMgfL49vDJfolxc61dapU424G9474nY+2ADv+zZujR?=
 =?us-ascii?Q?XNeb/fxpSM6BbQsLl+nlzMtNw0sCBvLs6bhu/0RL8O0TZtCvZ+dlFba1B8oR?=
 =?us-ascii?Q?dNZtmbLoYlB6fBfCagTVEbw+EMtCrot91iDibPYi8d9VK/jIfSk/Wdsw13+g?=
 =?us-ascii?Q?Je9WLZkDFTD6WJyMsgpICkx2A1OL12m4Z66bNJ2Va29s2iKY3ipI7T293UQD?=
 =?us-ascii?Q?UHDcC+1PrmrDT7z2lshTPWFtqlHDCByTROeVaP5tk0og71dTX0P5al9EwKX3?=
 =?us-ascii?Q?O/rXvQEwsQEjrO+sma0rAVCVX5T7PqMKACtFsL0WbDANXiux6PESlfg2DsZQ?=
 =?us-ascii?Q?QYpdvISKvGlPBzw7jI2Fu6RhN8SjVHeqLGWMOorHdCKpqpt+1dCniuzMPlqq?=
 =?us-ascii?Q?JBlSHreSp7r6GOQ7yedUN56abtxGSDzLZT8ekgeRxDug2ovX1FNj0/DTHrEy?=
 =?us-ascii?Q?Vg5t+gj8450xUr1JKFxuPhpJaiIr6GVOo7UgLVC4absrtt+T0xHkzgS8wEmw?=
 =?us-ascii?Q?ZhEs4oPkFsG5eT4OLq8tZg3FL2FjxPyHTpDwfcpFbgQXnZ4oQ3OhH7+J7ufY?=
 =?us-ascii?Q?hyb9R7yXZljFQlkwYB4mpD6Upd9BvFyN0KRJUT8hMAUXSKPZUfKeUZlQw4h4?=
 =?us-ascii?Q?DI6PZ2gX5kcyu/cnBU1Ov31s4Rl9f5W8B8agwWIZPWLwZoh8BfSWXSwm6uJI?=
 =?us-ascii?Q?J6y6DKjb2BwuorUlmhM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:19.7413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ddb52b-35a3-44ef-3366-08de28ed0582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

The following functions have been referenced in places which is either guarded
with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
- arch_hvm_save
- arch_hvm_check
- arch_hvm_load
- hvm_save_size
- hvm_save
- hvm_load
While CONFIG_MEM_SHARING is also dependent on CONFIG_MGMT_HYPERCALLS.
So they shall be wrapped under MGMT_HYPERCALLS, otherwise they will become
unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
nearer to the left functions, to avoid scattered #ifdef-wrapping.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4
- new commit
---
 xen/arch/x86/hvm/save.c | 154 ++++++++++++++++++++--------------------
 1 file changed, 78 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab6405706..5e99dd5998 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -15,62 +15,6 @@
 
 #include <public/hvm/save.h>
 
-static void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
-{
-    uint32_t eax, ebx, ecx, edx;
-
-    /* Save some CPUID bits */
-    cpuid(1, &eax, &ebx, &ecx, &edx);
-    hdr->cpuid = eax;
-
-    /* Save guest's preferred TSC. */
-    hdr->gtsc_khz = d->arch.tsc_khz;
-
-    /* Time when saving started */
-    d->arch.hvm.sync_tsc = rdtsc();
-}
-
-static int arch_hvm_check(const struct domain *d,
-                          const struct hvm_save_header *hdr)
-{
-    uint32_t eax, ebx, ecx, edx;
-
-    if ( hdr->magic != HVM_FILE_MAGIC )
-    {
-        printk(XENLOG_G_ERR "HVM%d restore: bad magic number %#"PRIx32"\n",
-               d->domain_id, hdr->magic);
-        return -EINVAL;
-    }
-
-    if ( hdr->version != HVM_FILE_VERSION )
-    {
-        printk(XENLOG_G_ERR "HVM%d restore: unsupported version %u\n",
-               d->domain_id, hdr->version);
-        return -EINVAL;
-    }
-
-    cpuid(1, &eax, &ebx, &ecx, &edx);
-    /* CPUs ought to match but with feature-masking they might not */
-    if ( (hdr->cpuid & ~0x0fUL) != (eax & ~0x0fUL) )
-        printk(XENLOG_G_INFO "HVM%d restore: VM saved on one CPU "
-               "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
-               d->domain_id, hdr->cpuid, eax);
-
-    return 0;
-}
-
-static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
-{
-    /* Restore guest's preferred TSC frequency. */
-    if ( hdr->gtsc_khz )
-        d->arch.tsc_khz = hdr->gtsc_khz;
-    if ( d->arch.vtsc )
-        hvm_set_rdtsc_exiting(d, 1);
-
-    /* Time when restore started  */
-    d->arch.hvm.sync_tsc = rdtsc();
-}
-
 /* List of handlers for various HVM save and restore types */
 static struct {
     hvm_save_handler save;
@@ -101,26 +45,6 @@ void __init hvm_register_savevm(uint16_t typecode,
     hvm_sr_handlers[typecode].kind = kind;
 }
 
-size_t hvm_save_size(struct domain *d)
-{
-    struct vcpu *v;
-    size_t sz;
-    int i;
-
-    /* Basic overhead for header and footer */
-    sz = (2 * sizeof (struct hvm_save_descriptor)) + HVM_SAVE_LENGTH(HEADER);
-
-    /* Plus space for each thing we will be saving */
-    for ( i = 0; i <= HVM_SAVE_CODE_MAX; i++ )
-        if ( hvm_sr_handlers[i].kind == HVMSR_PER_VCPU )
-            for_each_vcpu(d, v)
-                sz += hvm_sr_handlers[i].size;
-        else
-            sz += hvm_sr_handlers[i].size;
-
-    return sz;
-}
-
 /*
  * Extract a single instance of a save record, by marshalling all records of
  * that type and copying out the one we need.
@@ -196,6 +120,83 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
     return rv;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
+static void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
+{
+    uint32_t eax, ebx, ecx, edx;
+
+    /* Save some CPUID bits */
+    cpuid(1, &eax, &ebx, &ecx, &edx);
+    hdr->cpuid = eax;
+
+    /* Save guest's preferred TSC. */
+    hdr->gtsc_khz = d->arch.tsc_khz;
+
+    /* Time when saving started */
+    d->arch.hvm.sync_tsc = rdtsc();
+}
+
+static int arch_hvm_check(const struct domain *d,
+                          const struct hvm_save_header *hdr)
+{
+    uint32_t eax, ebx, ecx, edx;
+
+    if ( hdr->magic != HVM_FILE_MAGIC )
+    {
+        printk(XENLOG_G_ERR "HVM%d restore: bad magic number %#"PRIx32"\n",
+               d->domain_id, hdr->magic);
+        return -EINVAL;
+    }
+
+    if ( hdr->version != HVM_FILE_VERSION )
+    {
+        printk(XENLOG_G_ERR "HVM%d restore: unsupported version %u\n",
+               d->domain_id, hdr->version);
+        return -EINVAL;
+    }
+
+    cpuid(1, &eax, &ebx, &ecx, &edx);
+    /* CPUs ought to match but with feature-masking they might not */
+    if ( (hdr->cpuid & ~0x0fUL) != (eax & ~0x0fUL) )
+        printk(XENLOG_G_INFO "HVM%d restore: VM saved on one CPU "
+               "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
+               d->domain_id, hdr->cpuid, eax);
+
+    return 0;
+}
+
+static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+{
+    /* Restore guest's preferred TSC frequency. */
+    if ( hdr->gtsc_khz )
+        d->arch.tsc_khz = hdr->gtsc_khz;
+    if ( d->arch.vtsc )
+        hvm_set_rdtsc_exiting(d, 1);
+
+    /* Time when restore started  */
+    d->arch.hvm.sync_tsc = rdtsc();
+}
+
+size_t hvm_save_size(struct domain *d)
+{
+    struct vcpu *v;
+    size_t sz;
+    unsigned int i;
+
+    /* Basic overhead for header and footer */
+    sz = (2 * sizeof (struct hvm_save_descriptor)) + HVM_SAVE_LENGTH(HEADER);
+
+    /* Plus space for each thing we will be saving */
+    for ( i = 0; i <= HVM_SAVE_CODE_MAX; i++ )
+        if ( hvm_sr_handlers[i].kind == HVMSR_PER_VCPU )
+            for_each_vcpu(d, v)
+                sz += hvm_sr_handlers[i].size;
+        else
+            sz += hvm_sr_handlers[i].size;
+
+    return sz;
+}
+
 int hvm_save(struct domain *d, hvm_domain_context_t *h)
 {
     char *c;
@@ -390,6 +391,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
 
     /* Not reached */
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
                     uint32_t len)
-- 
2.34.1


