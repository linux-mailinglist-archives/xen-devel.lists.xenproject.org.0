Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F548A81D6B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943381.1342143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCU-00049C-72; Wed, 09 Apr 2025 06:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943381.1342143; Wed, 09 Apr 2025 06:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCU-00046H-2A; Wed, 09 Apr 2025 06:46:18 +0000
Received: by outflank-mailman (input) for mailman id 943381;
 Wed, 09 Apr 2025 06:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCS-000466-86
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5474ce8e-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:46:14 +0200 (CEST)
Received: from BN9P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::18)
 by SJ0PR12MB5661.namprd12.prod.outlook.com (2603:10b6:a03:422::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 06:46:09 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e::4) by BN9P220CA0013.outlook.office365.com
 (2603:10b6:408:13e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 06:46:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:07 -0500
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
X-Inumbo-ID: 5474ce8e-150e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwWHd3/CIydajpJ1zWDP44NZ0C35B0h6MKuwYjsbNnqTW0jWvuRzRhXCR4vkbKQ3wjB+1GFKX3XCt4aFMdZdGb6X1sp2bVEDCcpBP4LoCty+lBWYMnId/Z3GlVpXTEEj5uoU1V4FXGsN0QyyV1NrgmhvHch8t1G9t7CymzVNpNkGSOJJy+tpHiNDL2lVKsQpsfQXVYq1tydLI/ab2zzzw4kXw1rti6frUvRgJfPQLLTKg7zsfsFL0LSsyi55KV2RmLuKQfj2kiy0MPml4w/pL/BfGqcMn+wUIy6iEA4LQpKxmq05+pomZGPHjEkbCjWjbKeqaeA27qr6ybWdM1d/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAUz5a0G2bw6sESlqZPWz28HzPKUneou4cQlYnBaoGM=;
 b=DChGB6aWCk4fHSkcMWUyeWWmr00FU2YvpzdSKUeaaoa34RWc+YJKLotazvQ6lL9RjBImiEQzmWgfofrdWGB3gArtV9htYKFVHzenqpDp+/UQyLeCa0LHWossee874CX5bOkGPqkmkzN3Ghbc4ZTMXBUVKTPDqKcqRl4EeVi4UI53BFKDaPM18DcGDi24DyVVOXYZPnhRi2DGe58I6cfURwxUP4s9EmTY3KpaV6H5coedQ8T3IS6K/29IfxCmuhc6hZa4LLKLy1FA54ydS8VKlFBnnnmyd5nzeO0mOAS9R6z/+yjuIQwnLoPyaYbAAhim+luKeEDHptsz7Dq97e2d4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAUz5a0G2bw6sESlqZPWz28HzPKUneou4cQlYnBaoGM=;
 b=ZZqT+LjpvFYD9nHVyeEfZCGEIGHnUI946r498qUUZHMXA9R0FdGn4X4EJwhHzCwNlM+e86YFREHypFk0EMW1Q9i0Vosexhq20OD7optMvyoHJ+Nw2WSAVskAx5ssOPyMFPPCjBoVD2VKIV7+z8t91qt85KHxXsKsnSQSe1lfqSY=
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
Subject: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for host
Date: Wed, 9 Apr 2025 14:45:22 +0800
Message-ID: <20250409064528.405573-3-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SJ0PR12MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4dea4d-7ef4-420c-07aa-08dd773235ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTF0Y3E5djF5WFVsWmo1M1FkQmxlRzhuV2ZLbFdQeGl1dVJSWnNOZjhjRDRS?=
 =?utf-8?B?Y2JkS3ZoMUxra2dremFoSVpYN0twa3VtMTBBV3RDR1dUdWU3TUtZTUxjRFZy?=
 =?utf-8?B?Z3BTcUVsL08zUUhaSzhFVUZSS3MxTEd1alhVR3NzNGhZUFJ0aVB4VkhudXRz?=
 =?utf-8?B?a3oyMkhvOUFtN1NzdkJqQWFMWFJGaWpqeUErZVBFdFpGK0E4T01XTk5GTHFH?=
 =?utf-8?B?c2sweEluUjJZSXFyaUVZUnhLaHJqRFZLSW1kQnFaWEJDY1FNWVdqYkJtMEVi?=
 =?utf-8?B?ajZ2ZXRoRXpDdGZ2N01mWG8rTVVkSmQyQ1ZEUGsrZDJuK2V0MUE1MyticlFR?=
 =?utf-8?B?aEtkQTFRKzdrOHRyaVdZN2ErWlpnT2FiZis3N1lqQ25UYlQwNXcrYjdWdFRp?=
 =?utf-8?B?QXVKRXhobm5IanJoTVVna3dLWDVuM3Z6Y2cwd2Z1eHgrdHh0RitwWjR3UTJz?=
 =?utf-8?B?Ri90NDVsWnBMbjl1ZW9NeS9KNWhiZVRlU0JPRVlPRmJaZ3hXRU03QlkrWjZm?=
 =?utf-8?B?UVZUblRrVG1MOGpLcXA5dllOcFFCams5UDRueEsvOEVUWVBHMFpsVC9GVis3?=
 =?utf-8?B?YWEvUzFRTksyMG1zLy83ZCtndHpDTGovaWtGNkxrcUQzd091MXdNQVJ3a2pw?=
 =?utf-8?B?L2hNaTl3MXM5dmdaSng2MGN1MGVuWHJoMGhtN3BROG0vMGxaNW5YKzNZRlMw?=
 =?utf-8?B?bWtUUFJpaDFHelBLemFtSWZ3cmYxc2JqUG1DcklPRkw2dWF1MkpGUzZacEU1?=
 =?utf-8?B?YktjQWt2bGZoWDZjZFY2RWs3bGhPS0UvbE0yQlVxdVpWRE5iKzR3ekpRVFlB?=
 =?utf-8?B?djE5cWpOTHpsbG9zeHBrV00zTS9lTmhHZktwZzhaRGJpT1g0Qm9NM0s4ZTN4?=
 =?utf-8?B?clhqT2s0OVZoUEZKcnBNUXFQT1lLb2xRUnZCVE4yYnRvL3ZMM0EycmthZGto?=
 =?utf-8?B?SFFLcHlHKzgvdWxzanpuM2s1WkkvZ015Qm9XbEhOZUNZTWZGUnZIVVpVdFZ6?=
 =?utf-8?B?amorUURRWjdGc1kxNEkwU0c2cjlSQjUvU1BaTGlZL09GTFFkM29WWW5SWkJ5?=
 =?utf-8?B?SUJWOGQrSlBPbml3d1U0NmZ0VllCSFBBajk5amFjL3V1eExkS0VxSzJjWmFo?=
 =?utf-8?B?VDBSWmFERGh5dmxNMDRhWHRlSlhnNGpMNHVxaTRSNXk3b3V3U0JFYjVMeUVp?=
 =?utf-8?B?a3pvdHRFRzNFMWRkYldkMnlFSVRqNk1GNUppejJVTnFScjJJT3pVVU9oWXpQ?=
 =?utf-8?B?UnZOWEQvRlUwdkg2U2RQdkJvdTRkWFFabzlxNnpsTmxmWFpPWVE4WHlwUmpV?=
 =?utf-8?B?L1ZqcTBFQ2pQeW1BRjJjbGsvNk5Wb1Y1L1ZnZ0ZiSEtBSUhHN05UZm1vZnhz?=
 =?utf-8?B?TmJaK3h2MUNJOUZKUDNDT1BqMm4rR1lXcWFNeTBLZnFIOHg5QjBTaHJNZjg4?=
 =?utf-8?B?SDIwT1JFNENkVUFSVzRucmdDd1Y0MTVIUXRPSGVKbjNHRU5Yamx2bE9rL0hW?=
 =?utf-8?B?c2V2TW5zbzFzV24zN1VxbTNpeWI0dlkvZzFCQm4vbUxIRTJpREl5b2hWbUdw?=
 =?utf-8?B?MWNreXo4R014WERxQnU5NDdWNHI2UWxIcHRlUWVGQ2tWTFVFWWRYeTJPaHhG?=
 =?utf-8?B?SHhIcXozMlhGOW11anFhOGExd1R0Q1c0UjBRS1FHYWtVK0FzUXhieHVaZWtT?=
 =?utf-8?B?RmlJMlhxSjBQK2I2OGpqdWVoUyt5cE9hTVZ0Z01SbHRTd3BIRGpRVDF4a1Nj?=
 =?utf-8?B?bzVwRVYwVGxjOERhSTlQRHFuTGduRDAwWW1rRzlIdnJWbXJmMU5xNW5paG4v?=
 =?utf-8?B?VDdjd092Q0Z6T3A5dTFXbVk1TTJUNzl4L3p6cFJhc3BDcFNUdVhsb2pWQ0tH?=
 =?utf-8?B?V1R6VU52RFpyOFFHV3BHdmh5SG5UM1hrNzVrMEZrcTQ5dmZhUzY5NVR3V0ZR?=
 =?utf-8?B?ZTdQM3NhMEpla1Izd05vaTJCM1FPS2JjM1Bkek5XQU83VEQ2d3crRllaNUg2?=
 =?utf-8?B?dXZJT3Vac2dqcm50R2Q3b3VEMldlRS9uTzNsTmNQeEVVeVpieHhKQlJCTzBt?=
 =?utf-8?Q?0LSE8v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:09.2871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4dea4d-7ef4-420c-07aa-08dd773235ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5661

Current logic of init_header() only emulates legacy capability list
for guest, expand it to emulate for host too. So that it will be
easy to hide a capability whose initialization fails and no need
to distinguish host or guest.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 139 ++++++++++++++++++++------------------
 1 file changed, 74 insertions(+), 65 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..0910eb940e23 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -745,6 +745,76 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
     return !bar->mem ? -ENOMEM : 0;
 }
 
+/* These capabilities can be exposed to the guest, that vPCI can handle. */
+static const unsigned int guest_supported_caps[] = {
+    PCI_CAP_ID_MSI,
+    PCI_CAP_ID_MSIX,
+};
+
+static int vpci_init_capability_list(struct pci_dev *pdev)
+{
+    int rc;
+    bool mask_cap_list = false;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
+    const unsigned int *caps = is_hwdom ? NULL : guest_supported_caps;
+    const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(guest_supported_caps);
+
+    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+    {
+        unsigned int next, ttl = 48;
+
+        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                     caps, n, &ttl);
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               PCI_CAPABILITY_LIST, 1,
+                               (void *)(uintptr_t)next);
+        if ( rc )
+            return rc;
+
+        next &= ~3;
+
+        if ( !next && !is_hwdom )
+            /*
+             * If we don't have any supported capabilities to expose to the
+             * guest, mask the PCI_STATUS_CAP_LIST bit in the status register.
+             */
+            mask_cap_list = true;
+
+        while ( next && ttl )
+        {
+            unsigned int pos = next;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
+                                         caps, n, &ttl);
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
+    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                PCI_STATUS, 2, NULL,
+                                PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                PCI_STATUS_RW1C_MASK,
+                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
+                                PCI_STATUS_RSVDZ_MASK);
+
+    return rc;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -753,7 +823,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
-    bool mask_cap_list = false;
     bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
@@ -794,61 +863,12 @@ static int cf_check init_header(struct pci_dev *pdev)
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
@@ -856,17 +876,6 @@ static int cf_check init_header(struct pci_dev *pdev)
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


