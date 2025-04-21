Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C40A94C86
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960839.1352545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVL-0006bt-3a; Mon, 21 Apr 2025 06:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960839.1352545; Mon, 21 Apr 2025 06:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVK-0006Zh-WF; Mon, 21 Apr 2025 06:19:43 +0000
Received: by outflank-mailman (input) for mailman id 960839;
 Mon, 21 Apr 2025 06:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVJ-00057v-8H
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9acf559b-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:40 +0200 (CEST)
Received: from MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::14)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 06:19:34 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::9) by MW4P221CA0009.outlook.office365.com
 (2603:10b6:303:8b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 06:19:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:34 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:31 -0500
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
X-Inumbo-ID: 9acf559b-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNvfAJMEv7XLgzYe9TFpoBQuyt+Bp+Mtll6LrgirOU7APCrzashlGGJlJtW1Pknf8rfm9m+BQQIO3dPqYh5pUjoT+KDjSGb5B3GsJTRKYE2DsGwpLwF1x0hYpKjaRhliyqyINSPnrvxcEIM7M6yNELjWDTaIKRKBK7bAxREEOmQrVODHBgF6LzrM+/WdNeGTOHvLz99OY0bz6sEiZJFjjCG8vrFcboE0UWDiO1A4RoNQHauvVU0ddSG8W6hD6rCG9S18GeiyXUeq5ZgOAeCsYKvveD/8/byMPaekU9mDAaMYu0sOO9vX95GEHR6Cv1IbLJ5orhk89kJ4XdgtREEXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS709c8StYxHv0C0xi6qDIj8/5bc2jUhpF/cHHPrYgM=;
 b=l3Pqiw6rLW3IAxaensY7+9UPW7Zm3jOteXe/SRRjM2XtsdX3WjMbIn779u41pd/VYTtL9xqMKNRPsWgogNYE8Ihz0l9fNGDJXh0yG//ilnt7Rjz45c8vDoIpqRIVPKcSw/p2euxwQvsCmKXhtv8zOz4TYVMCMN3TZzfX1c5k4l07+M+la8z0K9sbVrZURkdyaBk5E+TZrQzNzSWYA9ZSNyDNu+FMqESeid6f+lkUtNM73JPrnYLt2AcPUmsLObXhvGa9klPduXV5n46oqFR46zjfBa0dy8VxaJ6qCrieJDq9nLY1mWauQM1qW2e4LOE7zoSbPEdrTUOzrhNO8+laMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS709c8StYxHv0C0xi6qDIj8/5bc2jUhpF/cHHPrYgM=;
 b=Gcpxo56I6/iOk4+XCnwsBElNkawuhurT30pY4Zjz4utXmr7R5kSmwsagLNvDIKHR2fcJoaA5k+DqueTbz+cjUpnTj/iB6l54EqdhaQMLtfc+ptVODDUrdPPbFB/OEWY/psEN+LWG60jMmdXBWw/RUXYpnTBjLZnX5LIr3i622q0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/11] vpci: Hide legacy capability when it fails to initialize
Date: Mon, 21 Apr 2025 14:18:58 +0800
Message-ID: <20250421061903.1542652-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: ebac3c6e-198f-4e8d-8cc1-08dd809c7c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SENIOThza2lQS3ora0x3RjJRejRiSVd6LzNTSXR5ZG5USmgveFJIc3VmaVov?=
 =?utf-8?B?MUtRbFBLRkxiZUJUcTRMSkI2MHFHQUhpRGVJQ08wTW5DYjFtTVc1aFBjS0xk?=
 =?utf-8?B?UzJXSzJqNlJVNzVWY3VibGZjMTM2cEt0Rk9TcW81Y1B2SUVZdkIwL3ovSWtq?=
 =?utf-8?B?N1RmMkxqL2ZBbDQ4eitzNllJTk14dDRpUGd5MHdGUVAwSHhYWUxRS1o2RDBX?=
 =?utf-8?B?UlNPK2tBWlA1bWtSNHh1ck9jYmp5eEthMDRKQjBmdlpWUHFaYnRTZFBNN0Fn?=
 =?utf-8?B?aDZjU3FWQnlWS3l3K21WZ3BveTZqR0wwV3VUemsvaTRFQVJaamJkRms0YWRs?=
 =?utf-8?B?RjB2TlN4MnJCN1NrR1lzZ2VXQ1g5VWU1eGxPem92Tjh6UStjYjVMNXNnclBl?=
 =?utf-8?B?dzFSd3dKSEQ2TG44TktudGlFRElkVHJ1Rk9pQTViTTRJN2xWZlZxTklodjZW?=
 =?utf-8?B?Vm11RXFZc05WNTlLaWFFckljVlZCQnd3SmErekhqRk1yVVBWTkJKUEt0cWYx?=
 =?utf-8?B?OU52SHYwWUF4bEkzTkhzUVcxVmQyTTVBb29XY3VJMnlZRVJ3OERLWTdaUG5i?=
 =?utf-8?B?NThvZThHRGlyTEdzQlpGaDFvNVB4WTkxbU5TTXNtbytVRzhnaHc4a3BIU2VJ?=
 =?utf-8?B?Zm4zZEJTcFpZZkRjUWM4RGFjNjBkcmhQcU9vMVV1b1NNQUhVajl6ZEs1eEYx?=
 =?utf-8?B?QTZhTXJKRmhNbE02T3JoRjVyeFFMOW8vVDgzdXh4TCtqWXRGWCt6d0dBeTlY?=
 =?utf-8?B?c0lOcFZrRmdRVDlXOEhwODBiYTNaa2hYd0FBdjJLbDNrQk9wcURENmIzQWVx?=
 =?utf-8?B?RTdLZ0t5Z2I3NW5GdHdIRGs3aUpBVkRNaTFDZGttVnRiejg3RnhWanhvekd3?=
 =?utf-8?B?dFV2dU9YWDJoK1I5N0hZTFBvbUVmeWhLcURKanJoNlByQ3dEaVdBN0RVVmNv?=
 =?utf-8?B?Wkp2NzY2V1gxYnphdEtTTE9zT2FMTXFYcWJkMEVPQ3IzYUx2SzNCUVJyelNp?=
 =?utf-8?B?MlRjT0lyRXkrNXNodjF5YUgyTTFHaW5abmtwbkVLbVlQaFBBa0s0Q0tLdloy?=
 =?utf-8?B?RWZtUk4zMUJIR29YbkwwUVFCTENhU0s4dkVBTmNEOXc1SU1adHlVMmM5NENz?=
 =?utf-8?B?SUkweFNUKytNUEV3RW01YWZlYWtGemFnVHNRWnEzY21CMWpNTW5oRGIyd2VF?=
 =?utf-8?B?RWljNWJ4SzVOZzh0dHNMbDFleGxJWTIvekM3SHRxbXJWZ2wxV1hWWU5RVmJW?=
 =?utf-8?B?SU5jNHpZVHh5RVdBRjVaYkRQN0dWdTA3UFNSWTF1V2F3cWhnenVINTVEMnoy?=
 =?utf-8?B?TzMrMkRjRzA1aUVIVHB2TktwdWRLNk1UNVpFbDQvSVYxMlAxR0JUSVoxVDZC?=
 =?utf-8?B?RnpLT1pWendnakI5UkpGeFcrSlE0VFhESzNkTTRUZXJTWkRucHJCUWhibjc3?=
 =?utf-8?B?emFHZ0JZYXBPaXptdEY5ZlBxYy9VcG1ycjI4ZnRsQTkzTmJQU1ozbmMvY3cv?=
 =?utf-8?B?c20rUUh0bTNTUjIwRi9qUkdqRHZ4MnZoQVZTSGtUWjhBTmZBY2xsUlVMZWww?=
 =?utf-8?B?NzI0RFgxdkpqbkdJNndLK2NHRk5DMnlSOThIRlpydmZUcDl5Z1ZFUXh0TnBN?=
 =?utf-8?B?K0xNcTltMVlDQ3J5SUZIMG04bnpFS0Mya0RuWVdGaXdiL3NVS2Rsa0d0M2M1?=
 =?utf-8?B?MmxiUWZDOTR1Q0RRZHpVY2JFWlZRVzMzZ2UxUlJoUHBEdzNyMzhGRC96Skor?=
 =?utf-8?B?dFdNbHJBQlcrcHk3NW5uTitlTlIrY08waUV5ZGJZamZ2SHRkUkdNby9LWXNV?=
 =?utf-8?B?RmRveG9YMVZmMFRoTkRuSHI0RGpxY0xWYVBrQ2lYbjZaMHhRY05hZDJxa3pj?=
 =?utf-8?B?OGRSQThhNUZQQXZTaFFsa2taUUlyeE90NHNpUUpudUdBNU1XbkN1Q25OQ3JX?=
 =?utf-8?B?ZEpJMVpHM3A4eGtGK2VKNzBLeEE2NXV5TFBHaDd5b0ZPaXFkQXJlV2hrUkpu?=
 =?utf-8?B?ZjZ5ZisrL09HcjMvNkdDTnpDT1lvdkppbnYwUTdURTdEckFPY25IYVdaSE5R?=
 =?utf-8?Q?Q+Zhl1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:34.0530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebac3c6e-198f-4e8d-8cc1-08dd809c7c19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308

When vpci fails to initialize a legacy capability of device, it just
return error instead of catching and processing exception. That makes
the entire device unusable.

So, add new a function to hide legacy capability when initialization
fails. And remove the failed legacy capability from the vpci emulated
legacy capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize"
* Whole implementation changed because last version is wrong.
  This version adds a new helper function vpci_get_register() and uses it to get
  target handler and previous handler from vpci->handlers, then remove the target.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c | 133 +++++++++++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 5474b66668c1..f97c7cc460a0 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,6 +35,22 @@ struct vpci_register {
     uint32_t rsvdz_mask;
 };
 
+static int vpci_register_cmp(const struct vpci_register *r1,
+                             const struct vpci_register *r2)
+{
+    /* Return 0 if registers overlap. */
+    if ( r1->offset < r2->offset + r2->size &&
+         r2->offset < r1->offset + r1->size )
+        return 0;
+    if ( r1->offset < r2->offset )
+        return -1;
+    if ( r1->offset > r2->offset )
+        return 1;
+
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
 #ifdef __XEN__
 extern vpci_capability_t *const __start_vpci_array[];
 extern vpci_capability_t *const __end_vpci_array[];
@@ -83,7 +99,91 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
-static int vpci_init_capabilities(struct pci_dev *pdev)
+static struct vpci_register *vpci_get_register(struct vpci *vpci,
+                                               const unsigned int offset,
+                                               const unsigned int size)
+{
+    const struct vpci_register r = { .offset = offset, .size = size };
+    struct vpci_register *rm;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+    list_for_each_entry ( rm, &vpci->handlers, node )
+    {
+        int cmp = vpci_register_cmp(&r, rm);
+
+        if ( !cmp && rm->offset == offset && rm->size == size )
+            return rm;
+        if ( cmp <= 0 )
+            break;
+    }
+
+    return NULL;
+}
+
+static struct vpci_register *vpci_get_previous_cap_register
+                (struct vpci *vpci, const unsigned int offset)
+{
+    uint32_t next;
+    struct vpci_register *r;
+
+    if ( offset < 0x40 )
+        return NULL;
+
+    r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1);
+    ASSERT(r);
+
+    next = (uint32_t)(uintptr_t)r->private;
+    while ( next >= 0x40 && next != offset )
+    {
+        r = vpci_get_register(vpci, next + PCI_CAP_LIST_NEXT, 1);
+        ASSERT(r);
+        next = (uint32_t)(uintptr_t)r->private;
+    }
+
+    if ( next < 0x40 )
+        return NULL;
+
+    return r;
+}
+
+static void vpci_capability_mask(struct pci_dev *pdev,
+                                 const unsigned int cap)
+{
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    struct vpci_register *prev_next_r, *next_r;
+    struct vpci *vpci = pdev->vpci;
+
+    spin_lock(&vpci->lock);
+    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
+    if ( !next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return;
+    }
+
+    prev_next_r = vpci_get_previous_cap_register(vpci, offset);
+    ASSERT(prev_next_r);
+
+    prev_next_r->private = next_r->private;
+
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        struct vpci_register *id_r =
+            vpci_get_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+
+        ASSERT(id_r);
+        /* PCI_CAP_LIST_ID register of target capability */
+        list_del(&id_r->node);
+        xfree(id_r);
+    }
+
+    /* PCI_CAP_LIST_NEXT register of target capability */
+    list_del(&next_r->node);
+    spin_unlock(&vpci->lock);
+    xfree(next_r);
+}
+
+static void vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -107,10 +207,17 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
         rc = capability->init(pdev);
 
         if ( rc )
-            return rc;
+        {
+            if ( capability->fini )
+                capability->fini(pdev);
+
+            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf,
+                   is_ext ? "extended" : "legacy", cap, rc);
+            if ( !is_ext )
+                vpci_capability_mask(pdev, cap);
+        }
     }
-
-    return 0;
 }
 
 void vpci_deassign_device(struct pci_dev *pdev)
@@ -192,7 +299,7 @@ int vpci_assign_device(struct pci_dev *pdev)
     if ( rc )
         goto out;
 
-    rc = vpci_init_capabilities(pdev);
+    vpci_init_capabilities(pdev);
 
  out:
     if ( rc )
@@ -202,22 +309,6 @@ int vpci_assign_device(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
-static int vpci_register_cmp(const struct vpci_register *r1,
-                             const struct vpci_register *r2)
-{
-    /* Return 0 if registers overlap. */
-    if ( r1->offset < r2->offset + r2->size &&
-         r2->offset < r1->offset + r1->size )
-        return 0;
-    if ( r1->offset < r2->offset )
-        return -1;
-    if ( r1->offset > r2->offset )
-        return 1;
-
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-
 /* Dummy hooks, writes are ignored, reads return 1's */
 static uint32_t cf_check vpci_ignored_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
-- 
2.34.1


