Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3BAB0E37
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979886.1366442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgU-0006aD-G8; Fri, 09 May 2025 09:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979886.1366442; Fri, 09 May 2025 09:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgU-0006X4-9o; Fri, 09 May 2025 09:06:22 +0000
Received: by outflank-mailman (input) for mailman id 979886;
 Fri, 09 May 2025 09:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgS-0004kr-FB
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d738852e-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:08 +0200 (CEST)
Received: from BYAPR02CA0010.namprd02.prod.outlook.com (2603:10b6:a02:ee::23)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Fri, 9 May
 2025 09:06:04 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::1b) by BYAPR02CA0010.outlook.office365.com
 (2603:10b6:a02:ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 9 May 2025 09:06:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:03 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:00 -0500
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
X-Inumbo-ID: d738852e-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARDYW6aXFnoa416ArgjiLP5vAS/RFfkU7+kGE9HDNEbMjyt6Dvjy++Bk18QgDxhVcqdJXWk2BeApCpWcNXs6OmqLZ16WA5i4wIzy/hkLrRbDs7aoYVUVrnpmYEfatfIFcfrmGzuxewAgCGV4S04ooQHXywYAD7iENTgGLPiduc8wZvkq3Px/y3HlYl6T9stgn99tSsY8pA7vMdrE/W/5fDVLUN/QSiybA4cIeXNVHxpcbmwMAi0AlHpdcgQjcdERf5vafPpNzYcwZqESOew2Hxgu4X5dA6lrc9+Y9YTitilvf6XWybk/lERnFdHlPrdr6Fjh5BpbngE1Ku60g0GHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg+0e6v6ZFzpaKXGPFx7D1MKdC9fhdRzQ7vBrXA6o+k=;
 b=iHm/Cyg/vSD0p2No3l/+9bF5/dqEjVuRS4d2pyQpMsSdqAqPVrieMJjAIw7vmKisSuE6lckS1f1Hesoy0H7/rRZQUWW9TMUdQkgSX7pIUOK0hHgTVK8x0PbcWC0BYtsejzoJ3LtxeAnaVSFZJ33P3ENChu+HrlTmppcPH9ebfWYD5A3ZTObEomnmvqwebVQpZb2h/ushaIoQfsNb5A4CanF88lomqtw9InIZpjpt8Kq8UAaxX2t2T0a79VEfVk1pXDxQDTMvHlFLGEevgivoGtOrgMFsJwM928tU6GyqUmnLYImal4QDpTPXV+29wUSvCIwLq/JUBPxLOGB6E8q2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg+0e6v6ZFzpaKXGPFx7D1MKdC9fhdRzQ7vBrXA6o+k=;
 b=xX8VQZ8n5MiRWWP6ss7Zf38oKM7ifFk38/IgAYC3VmZf64YCHNKm/hlpqNniVfhO9X9hsc8REZiPjJlmm2ZZitV9nsNp8N2BcnRZtK9JRgjbMlyUvum8iQfxk69iuTud7Fj7F0oLdWcdGiM6a4jNAWvCfnKc2PEI2lJazvO5q6A=
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
Subject: [PATCH v4 02/10] vpci/header: Emulate legacy capability list for dom0
Date: Fri, 9 May 2025 17:05:34 +0800
Message-ID: <20250509090542.2199676-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: bf61a3c4-18af-4595-ebd8-08dd8ed8b9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGpObmYzNzRLMndYZWp1NVRFZnRwTzdYV2tGWXNibDBJRVh0WloydDg5V0pU?=
 =?utf-8?B?Q0N2NTJUVFhDa0dMZksyODlLSjNPTGpCREZ4WjNBalpiUjI3MVNFZ1dCOGEy?=
 =?utf-8?B?cFBpR1dQMnFjVGNQS2dGV0NjbVBvb3AxZDdEUE9aUC8zdHpjWnIwRDZ4cWN1?=
 =?utf-8?B?YmtOcU84cFkvRlhTNmIyMHdFQTFRZGZzYzd4TTZBbnMwRmkrcWVMYXljZ1RC?=
 =?utf-8?B?L3ozU3I0am9HNXVqdmdhSXNTRFZDekJmYXA4cHphd2F5WTdRNnkzbzdPRW45?=
 =?utf-8?B?RDhPNE8vS0VmRVh4bENXalFxVmtJWmp1MllGYnFJR0luSVdyVkdnOFNMUE5p?=
 =?utf-8?B?eStoUFgvQkEvRExhN1JSNStQWXJtbGlPQ1c3NXdUejIzNm51Y2ovK1VRWGEr?=
 =?utf-8?B?cEtEWWlkNVd2RnBpQ3lTVFdjd0FBdTNYc1dCY0cvVkp1Nm1nRXpTeUt4WWY2?=
 =?utf-8?B?QWczWWVJd0JONy9kcVBrRUpkcVY5b25LUlRxeXF6ZGI5Yy9rMjRaOW1ubWlR?=
 =?utf-8?B?QXQyUFdJdFhwK1ZUazhoQTRmc2djcm1SZlMzSkRhQm9vOHF4Z2FqRWt5OEc1?=
 =?utf-8?B?SXZYcEt2VXFEVXRZSUlqOHAvdDJlekFrMUZBNkFLc2E0ZGdJbkljOVZ2WEh3?=
 =?utf-8?B?Qy9LcHlWeTA4NEx6REVYVUVXdWhWTnFoNDZ5T3BVOUNsREFZRmNWc3oyWkxT?=
 =?utf-8?B?TDl1N0F1OStFaUllOVNIeXpCNGN2cmlIR1JKSmxsTWUvUGRaUlFBbU1RRXB5?=
 =?utf-8?B?VTIwdGxpNlJSdkVYR0M2WWFDRms4T283cG5yNHVIdjkrQmxtQ3dNTHVrSVpY?=
 =?utf-8?B?b3hXdk92TFlKbjZWSmRMZEU3RzUyWWJLaFgvS285QUdVUW05SUVTTjYvOWFO?=
 =?utf-8?B?bUlLUlRaYzRzNk5zYWFHVnBYZXNpV1JzVkNvOUtzcFQxWmdXdmhQY09GQjg5?=
 =?utf-8?B?MURLVjFMdHIwUVM2RFU3WXZCL1F3UVRUUENpSGhCeEVhUVZmbjExOGJqS1pq?=
 =?utf-8?B?YkRKUWJJNzJTQWN1bUJTejlzSzRrYnE3RGdXMmNJQTJEQVNtZkpPS25UVlht?=
 =?utf-8?B?STBkNkd3Z3ZEaHgzTy9PaERmWmJaejE4VkZqWU0wK04wMldieURlZ3hVM3Qv?=
 =?utf-8?B?dUp6Y2ViTVcrMXlzOStxeExORTYvR1BSYU9SRVBOTGhLekgyZWo3Q2prbWt2?=
 =?utf-8?B?TXJ0cFNhRjY3T1pZcGE5ZENhd2pLVm1kakJ0RlN2N1VQVGVqTDVJQlgySUx3?=
 =?utf-8?B?U0ZLYVQ1bGFsL2lRdEtSay9qUkRaMDMwZlRNNzQ2aWsxUjl2aURIRVZPSjdT?=
 =?utf-8?B?YXg3YkdiRlJCZU5RWkV6UFU0WGFpdXJFMUw3T3dXUFlnVGFuNnNZeE5WZHBL?=
 =?utf-8?B?R3BZelVzK1hkQmpjdk1oaHlHVU9lQ2pSTnZWRGRRcTY0a2ZJOEpvWDlsRlVC?=
 =?utf-8?B?c0RTOTJ3N3NvVEUxZ0h0Z1MyODNvd1pDSDB1aVJSbi8rc2FmVFFYMlI3RWsr?=
 =?utf-8?B?WGRrR1lyd1JKeUtGdjVSdVhWQVZTcmZrUm5GN3V0T3JDUkhDVmZPNG50QVFK?=
 =?utf-8?B?ai8vR05sQ3VKajBJTVVmOCs2NW10aUJWajV1U0xIUWlHajFoSlpEV1h6clNH?=
 =?utf-8?B?MDBPK2RnbjhPQld3amltT1JuMUJvK25Lc3Bmc05wRVh3eUIwNXJLZks4SGhk?=
 =?utf-8?B?dEFKVXZmWUpWTkRINzEwNWIrQ09RMDh6dVB6NE0zVDFuTW5pMm5GbFVLQk9U?=
 =?utf-8?B?WkJOZmVSRFVWWVBXVXpSTzFFMmRBYVNmYUdZMkxWNkY2bTNLb0EyVHo0WnhD?=
 =?utf-8?B?bWkxUnlza0NMWlg4Nmc3U2pJZy94MWJCTzdjM1hlNVhzaEFKVUo3OExWZGdz?=
 =?utf-8?B?TTJrcDFzSnJXYkN2bHhvYVdCOFU0WkRETTdVUmpsazhZblU3L1NYYlFsM0lZ?=
 =?utf-8?B?akZLZWFaajBNNmJRV0NnWDZCTHVjTEYvMWlVM0doalMrME9ZWE9ybTlKN2F4?=
 =?utf-8?B?R2kzU2haVGFPYlF6OWdGdHNKM0JJUVBBbDlsd3VpY0JFOXA1aU8rckJEQ0s1?=
 =?utf-8?Q?cpYoFo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:03.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf61a3c4-18af-4595-ebd8-08dd8ed8b9ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480

Current logic of emulating legacy capability list is only for domU.
So, expand it to emulate for dom0 too. Then it will be easy to hide
a capability whose initialization fails in a function.

And restrict adding PCI_STATUS register only for domU since dom0
has no limitation to access that register.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Also pass supported_caps to pci_find_next_cap_ttl() for dom0 since the n is zero when dom0,
  and add a comment to explain it.
* Restrict adding PCI_STATUS register only for domU since dom0 has no limitation to access that register.
* For dom0 register handler, set vpci_hw_write8 to it instead of NULL.

v2->v3 changes:
* Not to add handler of PCI_CAP_LIST_ID when domain is dom0.

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 53 ++++++++++++++++++++++++---------------
 xen/drivers/vpci/vpci.c   |  6 +++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 3e9b44454b43..a06c518c506c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -749,9 +749,9 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 {
     int rc;
     bool mask_cap_list = false;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
-    if ( !is_hardware_domain(pdev->domain) &&
-         pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
     {
         /* Only expose capabilities to the guest that vPCI can handle. */
         unsigned int next, ttl = 48;
@@ -759,12 +759,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
             PCI_CAP_ID_MSI,
             PCI_CAP_ID_MSIX,
         };
+        /*
+         * For dom0, we should expose all capabilities instead of a fixed
+         * capabilities array, so setting n to 0 here is to get the next
+         * capability position directly in pci_find_next_cap_ttl.
+         */
+        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
 
         next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
-                                     supported_caps,
-                                     ARRAY_SIZE(supported_caps), &ttl);
+                                     supported_caps, n, &ttl);
 
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+        rc = vpci_add_register(pdev->vpci, vpci_read_val,
+                               is_hwdom ? vpci_hw_write8 : NULL,
                                PCI_CAPABILITY_LIST, 1,
                                (void *)(uintptr_t)next);
         if ( rc )
@@ -772,7 +778,7 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
         next &= ~3;
 
-        if ( !next )
+        if ( !next && !is_hwdom )
             /*
              * If we don't have any supported capabilities to expose to the
              * guest, mask the PCI_STATUS_CAP_LIST bit in the status
@@ -786,15 +792,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
             next = pci_find_next_cap_ttl(pdev->sbdf,
                                          pos + PCI_CAP_LIST_NEXT,
-                                         supported_caps,
-                                         ARRAY_SIZE(supported_caps), &ttl);
+                                         supported_caps, n, &ttl);
 
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
-                                   pos + PCI_CAP_LIST_ID, 1, NULL);
-            if ( rc )
-                return rc;
+            if ( !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                       pos + PCI_CAP_LIST_ID, 1, NULL);
+                if ( rc )
+                    return rc;
+            }
 
-            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+            rc = vpci_add_register(pdev->vpci, vpci_read_val,
+                                   is_hwdom ? vpci_hw_write8 : NULL,
                                    pos + PCI_CAP_LIST_NEXT, 1,
                                    (void *)(uintptr_t)next);
             if ( rc )
@@ -805,13 +814,17 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
     }
 
     /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
-    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
-                                  PCI_STATUS, 2, NULL,
-                                  PCI_STATUS_RO_MASK &
-                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
-                                  PCI_STATUS_RW1C_MASK,
-                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
-                                  PCI_STATUS_RSVDZ_MASK);
+    return is_hwdom ? 0 : vpci_add_register_mask(pdev->vpci, vpci_hw_read16,
+                                                 vpci_hw_write16, PCI_STATUS,
+                                                 2, NULL,
+                                                 PCI_STATUS_RO_MASK &
+                                                    ~(mask_cap_list ?
+                                                        PCI_STATUS_CAP_LIST :
+                                                        0),
+                                                 PCI_STATUS_RW1C_MASK,
+                                                 mask_cap_list ?
+                                                    PCI_STATUS_CAP_LIST : 0,
+                                                 PCI_STATUS_RSVDZ_MASK);
 }
 
 static int cf_check init_header(struct pci_dev *pdev)
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..cf3326a966d0 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -226,6 +226,12 @@ uint32_t cf_check vpci_hw_read32(
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
+void cf_check vpci_hw_write8(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write8(pdev->sbdf, reg, val);
+}
+
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 475981cb8155..fc8d5b470b0b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -76,6 +76,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write8(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
-- 
2.34.1


