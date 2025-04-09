Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE00A81D66
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943387.1342192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCd-0005RN-MY; Wed, 09 Apr 2025 06:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943387.1342192; Wed, 09 Apr 2025 06:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCd-0005PG-Hm; Wed, 09 Apr 2025 06:46:27 +0000
Received: by outflank-mailman (input) for mailman id 943387;
 Wed, 09 Apr 2025 06:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCb-0004jx-DY
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a0bd2f3-150e-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:46:24 +0200 (CEST)
Received: from BN9P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::35)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 06:46:21 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::f) by BN9P220CA0030.outlook.office365.com
 (2603:10b6:408:13e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 06:46:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:21 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:18 -0500
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
X-Inumbo-ID: 5a0bd2f3-150e-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksd9NBKnC2DpIdQt7wmhlmectJGksMJIPnIXO+HSBBsQhuFDZ8Us+SD+Wa7LV7evidrgndjDqy8GfR8l62+P2r0USMgP+3VedRAun2WIon/HV960vyhRuzEnYjPINjnwwXTPSFApkLGfEw+R5S6R5m+de9uFzGGYEE3sidlD0scr92RyQJmXxDNtczyEF5L3Hz7UJ3uHjJEqfLOcXzszlRCJsGvKwb319DLnqxr2p1tXsNWD4MKBge167GBgXEuGkLqvRxGqgVtPkuhGqvmtOO9T3MmOEcxjtrbT8zktBCSQUf+YuOW+Jh9YtkPMW3AdwFgNMqRHQRUj8cuqw+nf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4Ti2Z/GvBJAwx+bvK2L7kcEL+RfV9q/pK8cHYDjclg=;
 b=IW5Ln5v8KnXrTBy7hUsXpy2FY8o+O2YxvTEBZq7K7waIRBKH1lvUWxgMRu55OKvzdAqNDjUP8ojVteulIl2j7KPNg3KD18yWctfn6j+GKb/Qv7Osf6pipwhHSo4ukAb/dRI+bn2OJMGQlSSEStjdrSUTP3RIjTK4Z5xN3GgEmgr5n2ilN3JJRK2jHnUTSaD5XznzUunO+U3Hbsv5GJVhB/N9vI/UmrJ1fQnZn1t2BooDbKPLZhmL/dYFkBGADJOClX3q2Vw1hImwvO1q4VMxxTKs0Bsj+ON9mD0C5q3Bk8yKF3GIgSm2vEpft4ivode8hDYHFaSmuqBrLhWW1BP5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Ti2Z/GvBJAwx+bvK2L7kcEL+RfV9q/pK8cHYDjclg=;
 b=nO5BAZIRSBytL9k9lf8NbJyxsB1d6anIHDE+gYclVEuAHehfmoOu4WXTreyWinskL6R9mavxUPCDx5UXFHNCXL7N83R9PkPRJWCwzbGCNAhZrBvowhrO3m6JjTSgUs01DYQeJdUqafTtrV7Q/IwoLitmVWS75p5wDbldQDb3e2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Date: Wed, 9 Apr 2025 14:45:28 +0800
Message-ID: <20250409064528.405573-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409064528.405573-1-Jiqian.Chen@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae12941-be2c-4c6e-b3f1-08dd77323d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlVqZklKSzVGTmkrcXN2M3gyeDhzOHRQRElKRzRBN1NhR05FZnp2c3BvYUJo?=
 =?utf-8?B?UUZQZFNybHdxRC9JTXBlMGIxanhac05keXJoY2dmcFVOK0VEdnZWTWRXbkRk?=
 =?utf-8?B?ZkdmRExxSEtzQis5OW5LcmpQSHo0WjJhRXpUbXJiUHFwdjBPQlFJcVU3UnRF?=
 =?utf-8?B?aVNCM0poZ2drREdOY2t0WW1DSUVoWTQrMzVFQVUwdFpEVDZpUGpjWERXaTRw?=
 =?utf-8?B?KzBZM1d1SkhVcXl3anljOGdadUJyYStoNVgyUWFhcTNHL0UwcEw0UjNUeUJq?=
 =?utf-8?B?ZGxtVmZqbXNKYUNwVVljcGFJclVrcmtWb0JTV3IxTmwxNUtyVFZseGM3YXp6?=
 =?utf-8?B?UlcreUdVU1dlU3RuUlJBQnF2V0E1QUNlemE1eVhPQ1BVYTVvSFlIbHFXa3NB?=
 =?utf-8?B?eUQxdGg5NmxpMWIwMXc2MlZhZ1pFK3JzRit4WE5NTmcxaWw3QTBoeTJGTXN5?=
 =?utf-8?B?S0VFOG9ua1g1S1MzRlplVEd4UHBjd0E5aUttbGZqUHp5ZU13TG1DcUhJdm9V?=
 =?utf-8?B?ay9RVnU2VHNZOWNUN3FKb3FSVEwrRXZsT01Zdzc1N0dKSW9QajJjNHVsejFV?=
 =?utf-8?B?b2ZKVjE3a2g3S1JiSHV1UHF4dUNmSXZiR3UrNGM0a2lQb3ovN1R3cHl2YjNt?=
 =?utf-8?B?OXlwOW9CdGFzWXYzSVZIcWtxcGw0TWE2WU9sczh2eVJCbENST05iWlJReU9B?=
 =?utf-8?B?cVNkV0diNVk3cXZGZEdreFV4Z21nV21oQnptaVp1REtZdzdPQ1B6N2FoQk5j?=
 =?utf-8?B?dXdDU2h1bUlxT1BVWVZEL3FIbjNDK1pwaWVsVG1jU0RiNEZMS0hhQkI0T3Vm?=
 =?utf-8?B?UHRPN0dlYzNGQmc1VTRDd2lBckt0dzA1aHVXYmRod3FMbTZySnE0SzIxY2ZX?=
 =?utf-8?B?SElCRVdoNFI5TzNQOHJyQVVLRkNzWFpzd3RESjN5SzFaQ2psd3k0RmxYTDVS?=
 =?utf-8?B?QUJsY3FZcG1qVzdYaGtDRENIQ3RiR2N3UVFHdk5HMU9Pam9wZUM4a1dLcHZp?=
 =?utf-8?B?NEVybTYvV3UwTnA4RVFWRzRpZlBYaFFMaFZhRjNvaU82ZUpiQlFVbVlkRGpa?=
 =?utf-8?B?THRCTXNNMmVFWVhOMitZdDVOMklHMXI3cG4zbUdvang3dGhsNGRjeXVMazdH?=
 =?utf-8?B?aG56QjJ1amFpamN5U2ppTUU4OC9QcGt0RVhhUUsvOTliS2pLUk1zOEJmY1Yx?=
 =?utf-8?B?bzdSWUt0MnRFL1NvMk5aWGlRd2JkZDJwOXh4YVJoT0VRenB4b2IyZ0l2cUVU?=
 =?utf-8?B?aFZEbmw2SldzVlYzNjJhVmRwWHdDaUYvYiswRmVnenRZaHdTZUJZQklVeW1n?=
 =?utf-8?B?UDJuN0xxVW5OM0YvNGNqZ1BOOE93S3IrUlZEVGI2cUhNVnM1RUJOYzRoay83?=
 =?utf-8?B?MExxT1VMeTQrZmF2UGZYNmppNWZhWFVabVVNRmhBenFhcm5VY3c0cmVPRjFG?=
 =?utf-8?B?ZkRzakVHU044dE5TdVg3VFFsdU5kUlFoQkx4Y1lYRDBOOUJmSDN0QXg4K3JB?=
 =?utf-8?B?NlZBWFRVSEkxMlI2TU8zSytpSmxhU21RRXc0cVR2U3R6YXpERjIycTdZcXpv?=
 =?utf-8?B?aWN2REcyTEFqQUlyLzdtTDk3bEl6LytzNGhhak92NjZKcTZBQUM1SmZlblUr?=
 =?utf-8?B?WW1STUlydDZZNUhRQlJ6T1FRd3AxTlB4UU83cjVwSmRXNXVWaUxhekx3cVlQ?=
 =?utf-8?B?TkgvL0tFajJLYWFVTEo1TW9qSmROa0xRbk5rQlVZMDl6dlExR1NOMHBsV2FK?=
 =?utf-8?B?bkRBRTAxZzZEZkVxZWNEUTVZb0Zpa3Z3djhWOW5LYUZ2T0FWc0N0L0NhTjc2?=
 =?utf-8?B?S0ZxeE40Qi9nVVJNcnFYVzBQZWkxN1Ria1lJNkkweERzMEVLbWFoVW4vMlA2?=
 =?utf-8?B?aTBvRmNLaGdDNnFTQ2lLUm0rUFNGLzY3cFNFa3RGbHpQcmlZaFcwd2Q3L1NP?=
 =?utf-8?B?K09yd3p1Q2x0LzA1WGxZRUpuYVhtYVF3cVNaeHUxVTl6THF0bzYwUlcyN1hl?=
 =?utf-8?Q?1KHR9aglyJKcWy+dZLok0IzNSIup3A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:21.2715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae12941-be2c-4c6e-b3f1-08dd77323d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

When init_msix() fails, it needs to clean all MSIX resources.
So, add a new function fini_msix() to do that.

And to unregister the mmio handler of vpci_msix_table_ops, add
a new function.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/arch/x86/hvm/intercept.c      | 44 ++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/io.h |  3 ++
 xen/drivers/vpci/msix.c           | 61 ++++++++++++++++++++++++++++---
 3 files changed, 103 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index da22c386763e..5eacf51d4d2c 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -276,6 +276,50 @@ void register_mmio_handler(struct domain *d,
     handler->mmio.ops = ops;
 }
 
+void unregister_mmio_handler(struct domain *d,
+                             const struct hvm_mmio_ops *ops)
+{
+    unsigned int i, count = d->arch.hvm.io_handler_count;
+
+    ASSERT(d->arch.hvm.io_handler);
+
+    if ( !count )
+        return;
+
+    for ( i = 0; i < count; i++ )
+        if ( d->arch.hvm.io_handler[i].type == IOREQ_TYPE_COPY &&
+             d->arch.hvm.io_handler[i].mmio.ops == ops )
+            break;
+
+    if ( i == count )
+        return;
+
+    for ( ; i < count - 1; i++ )
+    {
+        struct hvm_io_handler *curr = &d->arch.hvm.io_handler[i];
+        struct hvm_io_handler *next = &d->arch.hvm.io_handler[i + 1];
+
+        curr->type = next->type;
+        curr->ops = next->ops;
+        if ( next->type == IOREQ_TYPE_COPY )
+        {
+            curr->portio.port = 0;
+            curr->portio.size = 0;
+            curr->portio.action = 0;
+            curr->mmio.ops = next->mmio.ops;
+        }
+        else
+        {
+            curr->mmio.ops = 0;
+            curr->portio.port = next->portio.port;
+            curr->portio.size = next->portio.size;
+            curr->portio.action = next->portio.action;
+        }
+    }
+
+    d->arch.hvm.io_handler_count--;
+}
+
 void register_portio_handler(struct domain *d, unsigned int port,
                              unsigned int size, portio_action_t action)
 {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 565bad300d20..018d2745fd99 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -75,6 +75,9 @@ bool hvm_mmio_internal(paddr_t gpa);
 void register_mmio_handler(struct domain *d,
                            const struct hvm_mmio_ops *ops);
 
+void unregister_mmio_handler(struct domain *d,
+                             const struct hvm_mmio_ops *ops);
+
 void register_portio_handler(
     struct domain *d, unsigned int port, unsigned int size,
     portio_action_t action);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6537374c79a0..60654d4f6d0b 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,6 +703,54 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static void fini_msix(struct pci_dev *pdev)
+{
+    struct vpci *vpci = pdev->vpci;
+
+    if ( !vpci->msix )
+        return;
+
+    list_del(&vpci->msix->next);
+    if ( list_empty(&pdev->domain->arch.hvm.msix_tables) )
+        unregister_mmio_handler(pdev->domain, &vpci_msix_table_ops);
+
+    /* Remove any MSIX regions if present. */
+    for ( unsigned int i = 0;
+          vpci->msix && i < ARRAY_SIZE(vpci->msix->tables);
+          i++ )
+    {
+        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
+        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
+                                     vmsix_table_size(pdev->vpci, i) - 1);
+
+        for ( unsigned int j = 0; j < ARRAY_SIZE(vpci->header.bars); j++ )
+        {
+            int rc;
+            const struct vpci_bar *bar = &vpci->header.bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                gprintk(XENLOG_WARNING,
+                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
+                        &pdev->sbdf, start, end, rc);
+                return;
+            }
+        }
+    }
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+        if ( vpci->msix->table[i] )
+            iounmap(vpci->msix->table[i]);
+
+    vpci_remove_registers(vpci, msix_control_reg(pdev->msix_pos), 2);
+    xfree(vpci->msix);
+    vpci->msix = NULL;
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -726,10 +774,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
                            msix_control_reg(msix_offset), 2, msix);
     if ( rc )
-    {
-        xfree(msix);
-        return rc;
-    }
+        goto fail;
 
     msix->max_entries = max_entries;
     msix->pdev = pdev;
@@ -755,7 +800,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
     rc = vpci_make_msix_hole(pdev);
     spin_unlock(&pdev->vpci->lock);
 
-    return rc
+    if ( !rc )
+        return 0;
+
+ fail:
+    fini_msix(pdev);
+
+    return rc;
 }
 REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix);
 
-- 
2.34.1


