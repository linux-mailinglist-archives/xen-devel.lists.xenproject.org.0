Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1EAC3D2E
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997343.1378249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPc-0004Af-MP; Mon, 26 May 2025 09:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997343.1378249; Mon, 26 May 2025 09:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPc-00048v-I3; Mon, 26 May 2025 09:46:28 +0000
Received: by outflank-mailman (input) for mailman id 997343;
 Mon, 26 May 2025 09:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPb-0003hN-9K
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 492600b0-3a16-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 11:46:25 +0200 (CEST)
Received: from MN2PR15CA0043.namprd15.prod.outlook.com (2603:10b6:208:237::12)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 26 May
 2025 09:46:20 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::cf) by MN2PR15CA0043.outlook.office365.com
 (2603:10b6:208:237::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 26 May 2025 09:46:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:19 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:18 -0500
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
X-Inumbo-ID: 492600b0-3a16-11f0-b893-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lW2van0nJzyJr+30QYBsW2ppzr1OfdkFN+PnI92ub2b3MO2Rdo6vbMINEKV8ayCI+yh77ZtitmMD/0Prc8EIEQIG3yVxs4uRL23Mw8AwUljVPSgI+sqMxC5LYPnlRl2NaoLJcUFBamsKWpDQqZztowePF2W7iBNhUh6d+QeBnpvi+L6QO9wdRGJ/y5HKuGhoWvJCrhdqYE3clevKxahaxzSXBRiNEaHiTmg+Nwuo1mTee6zYBJsoUVpqDr8zDinTnRdAR7uEcyyK07wWNN6BkzFkLBg4fAXpKFlzFz6QW+bX4vxg5+JIAbZ1oNA3egxsoTHEm9i8ABc76U2XrU3bFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuyCxUQ97UVFVG8LWs3GMa6eIbl8t+L0KXIZRR7uPyI=;
 b=IUy10aRIfGX1fsFNSGR3GqmZenhqVddvsx4F2i84JCNN92sKkfov+Kh5NmboLJnL69dSFzEIZRjcjI5bQzgLn13AFmW4ysU7mQLCaPGJojRUQIZo3updO/PUr8oj/VpgnSByZFl7QVod8uqRhZOvhHpki9dwZEmOJweJpRNNecAvF9lOSI7ldPpaXS47HVo7SmWbw2I1yx4cXs6DV7J7YCefA8Ky4sHLhxS2dgu1YV0ZWKgN1LiBK09iSrDcOUXmZEAffTJMsVoULbI676HI7VcqN6LEIpT15pdmOvXTOA12BeE84wrvS+tkzu78aDhUjDBPnZ7t9tl5CJmU8YNZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuyCxUQ97UVFVG8LWs3GMa6eIbl8t+L0KXIZRR7uPyI=;
 b=xyh9NU1ml5gug9mbuxLeklfCpugp+E9hY4nCKuqmZX3bcAmuecyjA9o9fIACGh+6j/zaNcJkE7G/wKoX/sP4OpHa4DIwd2EXUsy5BxBE5L+Clybk2TmvcoBAA20inlpurIYdhjytEAGhSaA5xjidG1kmmXMKE4cYgkuXOrjZNAY=
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
Subject: [PATCH v5 02/10] vpci/header: Emulate legacy capability list for dom0
Date: Mon, 26 May 2025 17:45:51 +0800
Message-ID: <20250526094559.140423-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: ba72d00d-6046-4b9e-64c2-08dd9c3a2ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU5semlvVFBlZmFGOVp2bWlTMkd6VHVMZjYxamM1MXJTdXNLQytBaE9vRWVt?=
 =?utf-8?B?dDc5Z1RqMVZNd3pYWnN3cFR1a1ljMHBKMXlBMjlwR25pd3haZFZVK0JraUp4?=
 =?utf-8?B?akxTM3IxZGdKZG92Tmh4LzV1NkxKRWdjVGNjd1lrbGNpMXRBUWxMVFFrMFh2?=
 =?utf-8?B?bjlReGlwSnJJajYzTHE0QmtvU2NmZkw2NHp3S3U0b1hPYkZTamVLR2dKbzIr?=
 =?utf-8?B?VS9QMlFmamlXbVRkWm92LzEvSEFzWjJyTmJWTk1QcVlSTmF6M3ZMZm1qWFgz?=
 =?utf-8?B?ZE5tK2JCV242SjZWNVFBQlFFRUJVa09DWk5ybS9iejdIWjBMRkorU3h2bGRx?=
 =?utf-8?B?Rmg4OGFUTFpTTVZpZUdlMlkrS2Jlb3FKRHh5QldmZnhYa1dmd2M3NVA0N01S?=
 =?utf-8?B?VHgva3ZxVy8vMnpzT3BxMkQ4emltTXNpNjE0UDdrcG9sRW9FbWtXTUZacUc5?=
 =?utf-8?B?bGZnL044ODdDTjlPUEZCQS8xOXNqemgrNlZieDBTYWFoRGZsQU1POFVHUHlh?=
 =?utf-8?B?bUNNL2huY0FBWXJDUkNvVnlESWVSUWtDTnVKUzQ0dEJlVEdQYXQ2dHJrV0ht?=
 =?utf-8?B?MVkxWjZVWk1Sc3I3czFwSXpweW9JaWQ2QjhPUWJVMEZQeDV5YVNydEF2aVRx?=
 =?utf-8?B?cElGZnVoM3NORTdOZ2RhMHdmR0dQQXRnam1TRWZKY2xCTXJvZGN6NGpEYkha?=
 =?utf-8?B?RG04b2NtMDU2RS9KYnlkNEJySHRleHh5eTV1OWxuVlNKb0F5QXo0UmlEY3JU?=
 =?utf-8?B?UUU1OS81SmdJNVl0aTEzVjV1RmZXM0tvQWV2YjZ5TVhhelprRHBaRFpNMGFB?=
 =?utf-8?B?UDZMakFFV1VLMGRhNHNqaXEyODhxZE5wS09mOUZYcWtxNWw3MHhVNTNlV3M3?=
 =?utf-8?B?U2RBSjFKMUpTYWVTc0J6N2wybTNQSThMMEU2OXpXTGFCRkpMa2JBUTZ3a0h1?=
 =?utf-8?B?Q3JNaFMrL2xTblNKUHVsQmZuMlUxWmptVE5EV2pKM01HTGJuUUFCY0U1YjJl?=
 =?utf-8?B?QUFRQWxMVzBjZStCNzBWWkZocGZLbmN5VjVBUUpBQWZsY0NiY1d2ZVhVNk16?=
 =?utf-8?B?SXJMeUVOa0VDNE1OSFplcjYwaHo1bjl3STRHREFZSXpOV1c0eE5JNSs4YkR5?=
 =?utf-8?B?Zjl5eWdpaC9VemU4WjViSmhyclVZb2ViZ0NpMW1XaGlQTldPQ3VHZ1dqMGpK?=
 =?utf-8?B?ZDBkVDFqb3F6QXE3Rk93UXlQSUUwNkozcW1CbjA3dTFwd2JPcUVNbC9TTE14?=
 =?utf-8?B?OXJHeTdYVjVzNGdBZGtmRC9xWXF4VWRhZERXUjlqUjhxYmFmUzFYZVQ3OG9R?=
 =?utf-8?B?V2hWNk4rR0cwcjJtWHM5YW4xQnIwWTlzY2NyYkdTMEgxYi9UaS9qWTN2M2pQ?=
 =?utf-8?B?bkxBczdiWGd2UDNQUEZQVG5yVC9WTGtkRzNuamc3SGFPK3NPT1RvdEZjRzZj?=
 =?utf-8?B?Qmd6b0pTdFBya0gycmNtRnNvaEtGOWxsY25idkJlRFRuZjZ5aE01aGZWTXdv?=
 =?utf-8?B?dTBaQ2ovOFZ1SVdQSkFUMlNjNnBPQnJsaEUySVNHNUFjTEo1aThWVVdxZ2pQ?=
 =?utf-8?B?Zk44UFhOWWFwT1NxaGtqUm9zY0FhSWdsRVV6cWc1T0ZNdzRBMk82QnZIY29V?=
 =?utf-8?B?YjhDUWl4bFZIY1c3Zk0zbjNjbXFRbVc5N1pFS25vTndxbkJGYlc1amdibnNE?=
 =?utf-8?B?TGpuT0liZkZWalhUVktwampxM2kwTXdkQlZTWlR6ZmRxVm5aNWY4VjlmNjNC?=
 =?utf-8?B?b2IrTVl3c3k3VnlNOFdFSmdhZzYzcVlXK3AzR1BXRW5lNVVKRTFwcjFrN1R2?=
 =?utf-8?B?NTdWNnVuVzJkWmFleGdjZEsvelRwTjhYeDZzVmV4eDhWbEZUOEVpUVRsM0Nl?=
 =?utf-8?B?QTd1eWNWVXV4My9uRVhSZWE3Z0NOUDFMWm9aNmtoRnc3bmk1dEhmT1Jrd3Ns?=
 =?utf-8?B?ZE5qeXVRWThVOE41M0gvOENtRFNJOE4vZDduVEVsc2Fld0p5Y241T2ZWSnJm?=
 =?utf-8?B?QlRKMWh0NmJMY1Vsc0R1QW1TbG93QkIvcFBlWkd5ZmJ1RkxPc0lIMjFINmhP?=
 =?utf-8?Q?HHNVSR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:19.7747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba72d00d-6046-4b9e-64c2-08dd9c3a2ae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

Current logic of emulating legacy capability list is only for domU.
So, expand it to emulate for dom0 too. Then it will be easy to hide
a capability whose initialization fails in a function.

And restrict adding PCI_STATUS register only for domU since dom0
has no limitation to access that register.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v4->v5 changes:
* Return early if dom0, so that I didn't need to change the exiting return chunk.

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
 xen/drivers/vpci/header.c | 39 ++++++++++++++++++++++++++-------------
 xen/drivers/vpci/vpci.c   |  6 ++++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 0fb3cfa6a376..d26cbba08ee1 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -758,9 +758,9 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
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
@@ -768,12 +768,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
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
@@ -781,7 +787,7 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
         next &= ~3;
 
-        if ( !next )
+        if ( !next && !is_hwdom )
             /*
              * If we don't have any supported capabilities to expose to the
              * guest, mask the PCI_STATUS_CAP_LIST bit in the status
@@ -795,15 +801,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
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
@@ -813,6 +822,10 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
         }
     }
 
+    /* Return early for the hw domain, no masking of PCI_STATUS. */
+    if ( is_hwdom )
+        return 0;
+
     /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
     return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
                                   PCI_STATUS, 2, NULL,
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d2f0f97e0a04..09988f04c27c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -255,6 +255,12 @@ uint32_t cf_check vpci_hw_read32(
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


