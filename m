Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A0BD2901
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142049.1476316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fll-0007qI-HB; Mon, 13 Oct 2025 10:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142049.1476316; Mon, 13 Oct 2025 10:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fll-0007mE-8y; Mon, 13 Oct 2025 10:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1142049;
 Mon, 13 Oct 2025 10:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fcg-0004Rd-1Q
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:46 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db207036-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:44 +0200 (CEST)
Received: from BLAPR05CA0044.namprd05.prod.outlook.com (2603:10b6:208:335::27)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:39 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::b) by BLAPR05CA0044.outlook.office365.com
 (2603:10b6:208:335::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:17:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:36 -0700
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
X-Inumbo-ID: db207036-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1Z6kGRAtrwLzuDfy/5mih1goNEAYHVMTGmf/WkUK7j3alDgoqSp8SlrrNxfvpwmsZP2LHIDs8JMRgiZTPxvL6IZKuHdj7MLKhgc6hwYMkwZi27/TNzvcYs2679zXB37KFjmE1pjFAHPFhyOSXyDEQ2QQrb7CrioFksu6Z05FWO/dsloyhLhLMYafk0TbgP2PPAkDofAqVGMqZIZUa1Os4T3zCkAj7yHQHJZvUbhqJB5hC9lon5yYBWwczLzTIUjY/024fuEOtuFZmyTO3bpAek0xce8PAlDaSS0z6Z7bu9tTqjE5kqg4ivdRnvT8fHnJ8KMNuFTX1afAaRyDGRTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e+sPcq234P3COkqJfCRUTWhHt5xA+0WRfwnjxSR66M=;
 b=RiPxDQktdhCdSTFAqtLPSy3oJZ0FzdYGIVLTgfOsD63cI6pEtkLluXzkD1YMAsHTq1YGZRAGrWZWQRbCi6WNVqAJ1Sx7/zBKY6keXOMtOkbjE/mOSK+/FRTPT7A4VzQM7d/W9COpKd4qHBGLywbBSEC0wnnA5RpdASc48WVIeFdJ5sbG9U2okqbzNV3uymnk6hmO5ToyAb7105H9au5orlHdnk+R+qCoG5zaR503i1qU/XO84b0DB2EXxRF9Mq8CPT/NnyGPed95AP5HZX8Sw0UlsnqLiFeUFQzVcg7dX8bJNsqMlSpegMjc9+F3KIH25IrU7bkCbauSXelAhy3Elw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+sPcq234P3COkqJfCRUTWhHt5xA+0WRfwnjxSR66M=;
 b=HLY9DG56ZE5L5UYr6Wr84J2R2HI5i+kEEfRQAFyh1tH850B39Xqh0gGXyb7P39CmmW7Wqu0cLPVztKlabj2+Phjgnr6+KrGNxp1n/b8uVE7yEE/bs09d5eLxY42zM5S+nPLVQSKHp5eqYUyn224dAiv+10ZjBUvUyFIw1XqREFc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 25/28] xen/domctl: avoid unreachable codes when both MGMT_HYPERCALLS and MEM_SHARING unset
Date: Mon, 13 Oct 2025 18:15:37 +0800
Message-ID: <20251013101540.3502842-26-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: b5603d38-9ff9-435b-a0d7-08de0a41bcd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pejuA80FjutagzWwrxZnYSVEnQcBHVUnffS2Y0EgHwzPRKKKnJDKljpO9zHy?=
 =?us-ascii?Q?p/AvIyFgH3ipm0LkhuVm05ka6ZqTUeqaMyyAvbH5GOcau7dTI6Hwp77DJ68I?=
 =?us-ascii?Q?J1pD8/9gDha27YdTihbHuGUgBwQ9JuZ03ygoJztGbJ8v1L8ozKDsMqknIySc?=
 =?us-ascii?Q?KJDfycdF6Y6fubxMizLgjxL28CSRE6vwFSePTkFQAeau01vm+85bQdAgna/8?=
 =?us-ascii?Q?w3ZDxQLiecguO2nIOJfCtijZRjpc5zPFYrGcSkUQTCgQ2KLNDAS19A8GCdYq?=
 =?us-ascii?Q?ZZlUy9ODWeu/l6F8uriWWX/U9338DscNbzA/oeqrSJDo2BKqZNkEfs/RjAvG?=
 =?us-ascii?Q?+JCWb10qtuP4IR90nnYiuJzQ6GHyzIbhW3JdzXziu8ewiP/roaatXYncGSsZ?=
 =?us-ascii?Q?EHVdutX+MaFnKaAgAqwMeT7irlvdeAKT8x8x/Ce4z6961Vx3O9zfB8o36KJD?=
 =?us-ascii?Q?mPxhaddM2vpvInoiw7HpLK1CvPzf5rToiwZlXKWaiWz2DzXJ1xEW/0cMPVEG?=
 =?us-ascii?Q?/OwOLPVwdee5T1v6wgI/IzV2Qm2BH1sQ+zpymLQTVM19ZbjojOWEUvj9BeW6?=
 =?us-ascii?Q?Yqg8KRwws37f4emrVeuGB9R3CysokqIq6iBxJ744Zlyp3lOaw37x25v+1lbN?=
 =?us-ascii?Q?4/ZjYdiD9qxWVCPB1RQpMMBTiA0ePRWdP9zksoIMf3yjTI7yCUyWKk9XQt+d?=
 =?us-ascii?Q?z7wzMY/UkbSJt+Ryth2dHJceRrADc6fLrcslrdnnPIsGcK5T4B6U2QHTkhyT?=
 =?us-ascii?Q?WzmQ4y1WdErcIXhKtePK0d90UiDz6YOKGcmNbECHIwe0sePJo2tQNm+eLEGe?=
 =?us-ascii?Q?4rt9SCbJwk1n5m+mJj2CZjqfmBvR3FCNTBMH2eSYagi/zMzJnlRYkySHzItd?=
 =?us-ascii?Q?Bo9f3Hvw/gKa9WnKXjJ31ymJGb1PO/GfMsaagDnKyVlunfhiABe3rNaGvamS?=
 =?us-ascii?Q?pDdfdICEZkaDjchrA4qZTUeAZ/iXbXAWC0LX/050yqkB1+IN1z01pc14OvZX?=
 =?us-ascii?Q?Eht6Se17lgZdkC7iQ3+L58O7HbaFA7ZYkhHqv8SboOUzc/UlFzCV47qi3LJ6?=
 =?us-ascii?Q?pFK4ecjD/k6LQsnHV2ZWtn088ErX4ORNFhPyupHBauOQsuo3N3xSgN+rOMO8?=
 =?us-ascii?Q?aZ4DaqXSRn+NCdXzwb7XgFHsMa5pFqAOqg0RlRYtICraQZmp1OsYQ0ZK7bLg?=
 =?us-ascii?Q?Rr5rPUyCnKcTazdLUdNgwWuZp0CBvJqF2n0iHtB4SG9/fnrri3U6Ed8yqyUw?=
 =?us-ascii?Q?11derbwCNW01YnLdLv1Sp/Qg5WqH7T1i9YWoWIK+H2zcRG4O9b4iwpON8VB+?=
 =?us-ascii?Q?0e9TrXTJ28if0VkvZr9BaYUjxIxir1dVr3/nokBH6zNqa3U7lZBMn3d7pFB4?=
 =?us-ascii?Q?hcomH76I6scy9rlxwiUshSyo8pLK5HRnCpB0cPjYkduH6D+0oW6k1bs3WyKV?=
 =?us-ascii?Q?jI55QurZtnCQee5GK3Fth3dBFtTocSK2BkmRj8/AT+s3UzNPc8siA19RDnvq?=
 =?us-ascii?Q?OKZaGbMLwxjDH1kSa6lqPKY+O3GYciV2wWLvYCY/fx231U3Erg5jq6eO4Fvl?=
 =?us-ascii?Q?qFs118riejKMPML9250=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:39.0020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5603d38-9ff9-435b-a0d7-08de0a41bcd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265

The following functions have been referenced in places which is either guarded
with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
- arch_hvm_save
- arch_hvm_check
- arch_hvm_load
- hvm_save_size
- hvm_save
- hvm_load
- hvm_vmtrace_reset
So they shall be wrapped under OR relationship, otherwise they will become
unreachable codes when MGMT_HYPERCALLS=n && MEM_SHARING=n, and hence violating
Misra rule 2.1.
We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
nearer to the left functions, to avoid scattered #ifdef-wrapping.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3
- new commit
---
 xen/arch/x86/hvm/save.c            | 154 +++++++++++++++--------------
 xen/arch/x86/hvm/vmx/vmx.c         |   4 +
 xen/arch/x86/include/asm/hvm/hvm.h |   4 +
 3 files changed, 86 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab6405706..47050e13b6 100644
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
 
+#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
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
+#endif /* CONFIG_MGMT_HYPERCALLS || CONFIG_MEM_SHARING */
 
 int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
                     uint32_t len)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1996e139a0..4394990131 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2701,6 +2701,7 @@ static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
     return v->arch.hvm.vmx.ipt_active;
 }
 
+#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
 static int cf_check vmtrace_reset(struct vcpu *v)
 {
     if ( !v->arch.hvm.vmx.ipt_active )
@@ -2710,6 +2711,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
     v->arch.msrs->rtit.status = 0;
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS || CONFIG_MEM_SHARING */
 
 static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
@@ -2888,7 +2890,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .vmtrace_output_position = vmtrace_output_position,
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
     .vmtrace_reset = vmtrace_reset,
+#endif
 
     .get_reg = vmx_get_reg,
     .set_reg = vmx_set_reg,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 473cf24b83..9d6cb42d48 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -240,7 +240,9 @@ struct hvm_function_table {
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
     int (*vmtrace_reset)(struct vcpu *v);
+#endif
 
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
     void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
@@ -775,6 +777,7 @@ static inline int hvm_vmtrace_get_option(
     return -EOPNOTSUPP;
 }
 
+#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_MEM_SHARING)
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
     if ( hvm_funcs.vmtrace_reset )
@@ -782,6 +785,7 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
 
     return -EOPNOTSUPP;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS || CONFIG_MEM_SHARING */
 
 /*
  * Accessors for registers which have per-guest-type or per-vendor locations
-- 
2.34.1


