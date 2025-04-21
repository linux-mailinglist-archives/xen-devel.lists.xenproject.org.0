Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB36A94C80
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960833.1352490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-0005BR-BU; Mon, 21 Apr 2025 06:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960833.1352490; Mon, 21 Apr 2025 06:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-00058B-1P; Mon, 21 Apr 2025 06:19:35 +0000
Received: by outflank-mailman (input) for mailman id 960833;
 Mon, 21 Apr 2025 06:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVC-00057u-0g
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2418::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94db8d72-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:30 +0200 (CEST)
Received: from PH7P220CA0112.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::33)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 06:19:23 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:510:32d:cafe::48) by PH7P220CA0112.outlook.office365.com
 (2603:10b6:510:32d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 06:19:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:22 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:21 -0500
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
X-Inumbo-ID: 94db8d72-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOOQE9TIct/aSdd0KdMgeU1VVi/lydl3Oi/o3xaQDC+ceBNBYk4AhzRPzLVOSsMNrENf50XYQ7I8fo+7yl6p/5Xccq6NHzqaJrzGU/Lo5L2TbAGfAIfTem2oRQ1b03qfXKYigcfDKDQ0Ft+bauJ4tLgPhcLHQEMnOtYrASDW19+XmjodbL4mhUUNStpAS/ZOrLnodMRc4wNk+uqSao6bN2z1Xy7UE46Wxg1P5K43HUOhyhY/vbSGG45ldxNOCWDDxz3YI7ISIlSMVVpvUml/QEqesNODGmBShDeXjaDo/fh1Mjkg2ETX5Q5dlgtUuTlTIV/vV41Kc5RNpoq4MxUXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NdYqVfoDf9xHmhA+7J0L70Y6IbKWMvcC1UUUVdHv/s=;
 b=O/YhYDQf8v4N4FbLwNztdvh1Z8yLFzOD2nD8JpRLJJZhLCHfET8A7vGqeNcGn1PCUFC+betg8rAC1bVHEAPb7SYnLMtubwkYY2nQ+1YijzMo0Ij25QzjxdovlgheH7arS6YsTVe4DWa4o7okZtHSzjaraXt1D0Qdth2M9DyEaBgrfzDtZ9SapXQ8T5uVhTmbN7LbzPvJBeJAuDt+/0qvZ1f97r2W3Iz/fI37MX5oT5KLCzXfpIvck56vVbspzmTLzY7+dfocHAKlfWaGBlMKjKcLg7+Aw/cWtEKgGZjE6KzxfOfqvNva/3ouz8tAzkCwTBYmX0oFUWUTxHOWc+Tuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NdYqVfoDf9xHmhA+7J0L70Y6IbKWMvcC1UUUVdHv/s=;
 b=Btmuay+XtPV6JIMSjg3u3Ems1BX1xcU3WuNZSbkEar4CU3g2oR11FJDQV1l4iBszlhzy+ftgoVNmgwRhcK/K99P0PZ95q1xjrFcEOZ8wMXSV7ZxfpmGRzznAv0GSXTbE+tonfd1/zS7w1fR3bwHl1RhRb8LRWmLQ5WiMRtpOlYU=
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
Subject: [PATCH v3 01/11] vpci/header: Move emulating cap list logic into new function
Date: Mon, 21 Apr 2025 14:18:53 +0800
Message-ID: <20250421061903.1542652-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a2e904-5356-43aa-aa36-08dd809c7558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWJCMUtkNXBxVWFGUkRrRWRoR2NHaVp1ajM1aWdFOEtOTHFDUEFWOFo3dHFU?=
 =?utf-8?B?dDc5OExUd2I2OEN3c0cyRWpKYUZsUmpYczhYYllEc1VqY0pVNUx0Y3dSUGJM?=
 =?utf-8?B?Vzc2aHpLakpHQWNvT2xZd3lGcGtuTTNoajVTSi9naGpZZ01hNHlsVlFGU2FD?=
 =?utf-8?B?c3E3Um5ReS9maXRmVy9NUmtYVWUxWFpiak02VkVEMUE1RmRrRDRjRDdVN3gw?=
 =?utf-8?B?aHFqYmNlUzJ2aGZvbGtZV0tMVEF5aTRaRmVrRXM5V2RwL3NHcmJvbFU0QlNo?=
 =?utf-8?B?Z2RULzRuMlN1bUVJcVVmdmdUM1hoc25sdzlNNXNqSGQ0ZXlYYW4rSk1Lb2NK?=
 =?utf-8?B?Q3V0NE44RHlGWERrWVdUUVdaclhqOXduUC9BV3p6WU9mS1p0R0xKdlBDdSsz?=
 =?utf-8?B?MUhxOXBOZzNycnE5MmFqZUEvcVFKMDAySFBuNVFjQUQzY3NSMGIrWFhPVTBy?=
 =?utf-8?B?Nml5dGRZOTFqREpnMnZLTHpwWXM5c2dFcXVFUVZHSnVSYjlZdTFxZWphQXBs?=
 =?utf-8?B?S2huUHZqNXBPWTZlamd4SHowUDB5cTdZa3Axc25jZDQ1eG80cnVQQzg3VURq?=
 =?utf-8?B?cE0yNUdmeUtKUGZZVURDb2RyQkc5Q2tlNDNleVQyekJKV1JPRFl2bnc0Ym9E?=
 =?utf-8?B?a3dLdllScG9KUXF2NVFHWE5uOFFvMVB3WkhJbVVkNGFyOUY4ZXlGWnhFbDhU?=
 =?utf-8?B?WDdCSzhrVnUzeXUyenlteUxqUlhBS3hVVm9yQlRNRUpkS0NoZXF5MlZxMllQ?=
 =?utf-8?B?RjNMZU1KVGE0djdhS3p3dFY4OC9XS1hkUkZJVm5jNnZzNCt3YTZEN3VmbXcy?=
 =?utf-8?B?QkgvUUlkaG1lOGtxWDl2M1BGL0NSeS9pNEY0eVN5NFZDS0xpQ0ZMb0o2dUxI?=
 =?utf-8?B?bER1Yjk4dmZLZHpTSVdRV2dmMWFJelBHeHhmT0xNRkl0b2Nza0NOeDhJVk1k?=
 =?utf-8?B?MC9hcGpRTDN0UGVnRXI5OTgydTM5S3lTS2ZGZnJpK2NXdUtUN1dEcGJlR2NC?=
 =?utf-8?B?SFBiSlBtLzFkbGFkQjlUbWdEQndIQjhoVExlT0VocTBEQ0dSL0N0emVQajVs?=
 =?utf-8?B?UEF0MWRpVkcvSGQ5ZG1BVk5lWitoQzVnTGpwK1JIckQrUG9BWG83eEJIZXds?=
 =?utf-8?B?RGJ6U3FJK3A1OWVNdElrN2FLY0hEZ25SSnlIZjNFU20yMnB0OTFlNWE3Nkta?=
 =?utf-8?B?d1gxeHdwWlpncVpPeTFWanJPY0VmZTJzQWhSTm1wckd4ck5yZWZrVnc4cTRJ?=
 =?utf-8?B?RlVjemg4QTAyRGtGbHc5alNJYnpLMERPZURVK2J2Q3ltbHZrZ0RiSytGYnZl?=
 =?utf-8?B?MWQzbU0vV2ZEaFZHS3hxczZJTXRFWGEzNWxNMVFSMXYyV1duY3lhY2h4cDUr?=
 =?utf-8?B?VDU3em9xWjNXcFBzcjVxY0ZiYk9HY1l6M2JJOG04ZUFzazNzZlVqa09nY3J3?=
 =?utf-8?B?MWVVQWhTK3RmZW5jMnVndlU2MHRuTzVXdm85VWRFNk5IWlZjbXd5bVAyaGZ0?=
 =?utf-8?B?Uk1YOHI2bXJtNUFnYnhiRHhRY1NsZmFsQVVzN2pDY1FDeFF4QTFDaHlBVW1w?=
 =?utf-8?B?UFdkYm1kcVZVaFJUY1JONmJlZ0Y5cWxIQTI5S1NIV2xiYkk1MjdBUU9SQ1BD?=
 =?utf-8?B?WXI5UENBZkMyV3k4cE16K0QxZStIdlY5VTJPQW15dXEyS2VzeXRDT2ZXMXFM?=
 =?utf-8?B?ZEppQ2h3blJUdjErMzJKTkdnR1h6QlVZN24ra1V0c0h1N3RjT25xdzBaeXpK?=
 =?utf-8?B?aHZUeENSbWNrV3FxOWNVTC81cE9ScW9XT3pqVnIwd1VNNTBRbjc4QXA4cG4w?=
 =?utf-8?B?ZzNGUlF3eTRGV2hpR3NvMVJQUmpWZzVGUTRvT2hVNDZzSjNvNXc0S3AwN1ZU?=
 =?utf-8?B?cFRvZTJOdWJYMVpVc1ZBWjNmM0Z4bFQ2WjF0NHA4MVlKQ3BYVlFlcVdrT09n?=
 =?utf-8?B?bFd1VXRjcTVVY0tIQjBCRzZmdXQ5eDdGWllPRmJHaU9ERXVSalNyazd4UnBJ?=
 =?utf-8?B?UHJvTTBHYmxCQXlQaTJ2dTJZb3FiSjJWcWJMVmxZVFUzb2RVQTVKRDRpdzhq?=
 =?utf-8?Q?tt5qVD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:22.7226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a2e904-5356-43aa-aa36-08dd809c7558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

No functional changes.
Follow-on changes will benifit from this.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 138 ++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 65 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..3e9b44454b43 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -745,6 +745,75 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
     return !bar->mem ? -ENOMEM : 0;
 }
 
+static int vpci_init_capability_list(struct pci_dev *pdev)
+{
+    int rc;
+    bool mask_cap_list = false;
+
+    if ( !is_hardware_domain(pdev->domain) &&
+         pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+    {
+        /* Only expose capabilities to the guest that vPCI can handle. */
+        unsigned int next, ttl = 48;
+        static const unsigned int supported_caps[] = {
+            PCI_CAP_ID_MSI,
+            PCI_CAP_ID_MSIX,
+        };
+
+        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                     supported_caps,
+                                     ARRAY_SIZE(supported_caps), &ttl);
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               PCI_CAPABILITY_LIST, 1,
+                               (void *)(uintptr_t)next);
+        if ( rc )
+            return rc;
+
+        next &= ~3;
+
+        if ( !next )
+            /*
+             * If we don't have any supported capabilities to expose to the
+             * guest, mask the PCI_STATUS_CAP_LIST bit in the status
+             * register.
+             */
+            mask_cap_list = true;
+
+        while ( next && ttl )
+        {
+            unsigned int pos = next;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf,
+                                         pos + PCI_CAP_LIST_NEXT,
+                                         supported_caps,
+                                         ARRAY_SIZE(supported_caps), &ttl);
+
+            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                   pos + PCI_CAP_LIST_ID, 1, NULL);
+            if ( rc )
+                return rc;
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   pos + PCI_CAP_LIST_NEXT, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            next &= ~3;
+        }
+    }
+
+    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
+    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                  PCI_STATUS, 2, NULL,
+                                  PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                  PCI_STATUS_RW1C_MASK,
+                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
+                                  PCI_STATUS_RSVDZ_MASK);
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -753,7 +822,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
-    bool mask_cap_list = false;
     bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
@@ -794,61 +862,12 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    rc = vpci_init_capability_list(pdev);
+    if ( rc )
+        return rc;
+
     if ( !is_hwdom )
     {
-        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
-        {
-            /* Only expose capabilities to the guest that vPCI can handle. */
-            unsigned int next, ttl = 48;
-            static const unsigned int supported_caps[] = {
-                PCI_CAP_ID_MSI,
-                PCI_CAP_ID_MSIX,
-            };
-
-            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
-                                         supported_caps,
-                                         ARRAY_SIZE(supported_caps), &ttl);
-
-            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                                   PCI_CAPABILITY_LIST, 1,
-                                   (void *)(uintptr_t)next);
-            if ( rc )
-                return rc;
-
-            next &= ~3;
-
-            if ( !next )
-                /*
-                 * If we don't have any supported capabilities to expose to the
-                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
-                 * register.
-                 */
-                mask_cap_list = true;
-
-            while ( next && ttl )
-            {
-                unsigned int pos = next;
-
-                next = pci_find_next_cap_ttl(pdev->sbdf,
-                                             pos + PCI_CAP_LIST_NEXT,
-                                             supported_caps,
-                                             ARRAY_SIZE(supported_caps), &ttl);
-
-                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
-                                       pos + PCI_CAP_LIST_ID, 1, NULL);
-                if ( rc )
-                    return rc;
-
-                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                                       pos + PCI_CAP_LIST_NEXT, 1,
-                                       (void *)(uintptr_t)next);
-                if ( rc )
-                    return rc;
-
-                next &= ~3;
-            }
-        }
-
         /* Extended capabilities read as zero, write ignore */
         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
                                (void *)0);
@@ -856,17 +875,6 @@ static int cf_check init_header(struct pci_dev *pdev)
             return rc;
     }
 
-    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
-    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
-                                PCI_STATUS, 2, NULL,
-                                PCI_STATUS_RO_MASK &
-                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
-                                PCI_STATUS_RW1C_MASK,
-                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
-                                PCI_STATUS_RSVDZ_MASK);
-    if ( rc )
-        return rc;
-
     if ( pdev->ignore_bars )
         return 0;
 
-- 
2.34.1


