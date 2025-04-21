Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735FA94C7D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960837.1352522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVG-0005wi-Cu; Mon, 21 Apr 2025 06:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960837.1352522; Mon, 21 Apr 2025 06:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVG-0005r5-7j; Mon, 21 Apr 2025 06:19:38 +0000
Received: by outflank-mailman (input) for mailman id 960837;
 Mon, 21 Apr 2025 06:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVE-00057u-FY
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97b748e9-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:34 +0200 (CEST)
Received: from MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 21 Apr
 2025 06:19:30 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::60) by MW3PR05CA0004.outlook.office365.com
 (2603:10b6:303:2b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Mon,
 21 Apr 2025 06:19:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:29 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:27 -0500
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
X-Inumbo-ID: 97b748e9-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga6CJMcifUiSpMNfb6JyEh8UzLZOy7MwrFo7jKU/tyqRidmUvaWuZFpSbHi4t6z9928QbOGZYqGslhu0hneGsRLYUBSkL2uspqcuSpaFXzoN7RQmWq4JNKpmWDkGQFvGH7EHl2XzlPelspjVv2UHOnux/JDIB85SLXTMbRAliLPrCk6ll9H6bA30IBdMYuptFGa9oc41qJQ5X4ycG9vwTc/l760lQaV1r3RxYsYGtenft8FIl1CuNqavwZWp9mj8fL4MJTeycaXoFaqXnSxmRdRx7SkA/QegIcr0Y8qZbMBKA/fB5QrVu7hiHFHpsVJQDpwAVVvaqaYtiJPKJoD6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smc1jWeK9v3ur3A4inV8stRX58Ho7A+1C8m4g9Og5wc=;
 b=LDTGpiIRx8rokYTtEA6EW+q7ROkgdbZ8vElNvGL4WUCF1GFBIBaEuE5fFbk+ZxJQqptO1P/QdBOOrems/Z6UfO/qYWdqKDvLdF5OrRjgJfqFVJlhI75mT4ZYgD0MgvVtZe5VmRkAD4FxzTMxAwOhxyhTAXJlP2kK+V2JB/Y8De0tMIWnd5XMmAizV8PbaELZlJYYNtM6+jcyeA4nkzQRGnXh4lgFXpIPmm+u8aFwLSxP95MwfswxHdhybYZmIcp1f3q6KrYVjnDLcW5lPveZNHPxX1rvzw4d4Fo3l6gYCuY41OaKYl667jZzJze14iIoqlnLkuDibouEE7X1VkSTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Smc1jWeK9v3ur3A4inV8stRX58Ho7A+1C8m4g9Og5wc=;
 b=Opjwj0jCv7+aHI5tmgYOgceORHtW0Wh7K/L8pVcwdgUXHaTHAo7NVyPMQoBEwWNW1j7QpFE92VejDqF6aWAbngbfGVUqxCLoph21ZwIfGXIY0tM+VXQNx+s6S4WiwHVM/K4/OIei/bg1lhat9fB3VRUNZxLVGn2jNFzrLMNY7tc=
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
Subject: [PATCH v3 04/11] vpci/header: Emulate extended capability list for dom0
Date: Mon, 21 Apr 2025 14:18:56 +0800
Message-ID: <20250421061903.1542652-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1fc3b8-e00f-461c-e8d0-08dd809c793c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWZYYWlkQlV5WEdsMkxlYXBOVGVTVkhXajFvaEtYeWFKQk55dU5VamZkenBL?=
 =?utf-8?B?OTNYUVJiTDJlalk3QzdvU2VrM1h0MWkvTTRkdnFrZmlDVnUrOGpSYVlhUFNZ?=
 =?utf-8?B?Y1pmU3hqU05LMDhlRkNzMzF1M3NvU3lzZ0lweFJiWC9jT2hBWEJIRUE1VmFm?=
 =?utf-8?B?SHFyREdmK092dUtlQnN5d0pPQzBWaUQ4WUcwRzIzT0c2YVhFNGJoUzl1VUhN?=
 =?utf-8?B?bGtHTVA2ZkE2Wm93OTd0bjUwU09PQXU4QWZJbVpUc0MzbnNVOFk2U3hjenZM?=
 =?utf-8?B?UUxiak42MndWQVJvM2Y0SElBajhFV3oyUkVUZkpnOFdNR01jUGcwWm1GR3M3?=
 =?utf-8?B?cG82RHNwZ2k5VWxCKzdMVnZ0RVFld0VkYkhGUzF5MzQvelR6NUlnOW5iWXF2?=
 =?utf-8?B?M09jKzBPeGtNeGlnNFoybzQ3SklKVk8yOTlWR3hCVzN5Z2pzMnlRQ1U1T3JE?=
 =?utf-8?B?Njl1akdldFN0eFlLMGduUzU0bDd6ZFF6L29LVW1jVnh2elhGVHhVSEphOUlW?=
 =?utf-8?B?aGtsdEY1aXJ5N2IxVEdObjFLd3R6SFJMUWFNb0JnOWNhcnFMVkUyQzB4cnhk?=
 =?utf-8?B?VTBWditIOE4vcUcwRmtLQWkvckNHVTJvZ0hNN0lyZ0pYbDR2NXN0U0twZHZV?=
 =?utf-8?B?bmhsRUJvSHlCdW0zYXN1K21XNGFsY1luVjh2Y096OUNDSTZLYlBCZzhhWXV0?=
 =?utf-8?B?a1ZsM2ZPbTQ0UURMZm9DZWR2ckZLODQ1NEtIWVl2aytyZmx4NktmQ0NSZGdE?=
 =?utf-8?B?NFdqS2ZvOUlKSWZkUDJYMEZ3MTc4OTNJKzNJdkJjeUlvV0ZqTjlyWE9zaElt?=
 =?utf-8?B?ZkJCSTZJLys5SHBOOHFRalc0WmlEc25Va2I4RlFiN3Q1WEsyckJVRWRYY0hn?=
 =?utf-8?B?OSs5YzJvWmM2am5kZTluQzJwL3ZPejRjdDdmVVB1dXUvZWJ1TWVGdXllVnZJ?=
 =?utf-8?B?RjJ4OXpyVit2YzBla2NobE8xMU1MbDQ5UHJkSFJObVE5cVRXZlJva1RHODBs?=
 =?utf-8?B?alZVdUNTT1RaR3BwVVZ1TUdVWVhxUEUzQ3FybEgzY3c3MWdxaGJudE4wMEJF?=
 =?utf-8?B?Q01hdVFwcUxqaHVxcURCZUpaS3F6K0Q4aWNjNEFmN1pYUCtjYVlteVpxalkx?=
 =?utf-8?B?M0plbmdsK21Uczg4Ti9WOHJ3RVVoU3hraE1xTHBhYWgrdFpQeEhjU2dMWFc3?=
 =?utf-8?B?SUhtay9YdGp6SFlOczBoZUVuQkxKSXBIMm5sT0ZQR2s2L09sSVovVEgwekhj?=
 =?utf-8?B?ZXpPZkN5V2JyZ3FtQkkvMTNoVlkzSVN5ekNGOG5LS3E4RWpiZnJjQVJFMFdG?=
 =?utf-8?B?QndtVVdwVWhXeEs0QnBCcFBHVkZTMUpQZTRzSUQ5WFNteS9Pb0oyNU5iaTZE?=
 =?utf-8?B?S2VScE01b1QvR0dDdHlIQTVFNjE4aGlHQStrd2oyOVYyNTdyRTNzdDJaS0dD?=
 =?utf-8?B?cDVJUkEvN0dRNG5OeiswcGtpOUpCU0tuWkhZcUdWZWdFcml0TXI0QnBZNnpJ?=
 =?utf-8?B?MHNFaWFzUFhJSmFnbzQzUW9NTHlMUG9zOG8vU3EwQlQzeGp1YnJKYWgyVHpI?=
 =?utf-8?B?REt2Z0xjNTEvNDB1VEZuRExBaklQYTZLM2o3azFiVW5ScnJmbVAveWxPQzlC?=
 =?utf-8?B?NmJiQjBkRVNRbk1sMjBMQ09sRkVndzhvMHRDNFQrcDZwZnJMYXZzRnFxSU1i?=
 =?utf-8?B?WnJXdGh4TDlLa0F1WVV5eE00NTBMN1pZalhFS0FwWHdETkJGbFRpWXFQWHNy?=
 =?utf-8?B?Ujh6d2lCeWdXcGpIVWE0UFVmSnpBYitFMWI3V1RqYnFHczhEcU83anJLeUlv?=
 =?utf-8?B?c2FDc3Y1aUlQelBGWWplYlMwQWVScmRwN0tSLzFZWE9PUmJKRC9rZWRBSGM4?=
 =?utf-8?B?b3UvbnUxUFRIZVJ4TC8zZXRPeFJMbDBvUmpzaFJuaHdLUjB0ZXNLNzIyc1VP?=
 =?utf-8?B?Ryt3dVRINGNza09aNWZGQTF1bTV5aHRMMHJZMGZTWC93WWg2Z1JxQk42Q1dq?=
 =?utf-8?B?L0Q4d3BBUUl5N0ZGYVhNd2kwdFRBWXduNGpXNGIySWJ0R0lrYkdZKzZnZHht?=
 =?utf-8?Q?kcewPT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:29.2360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1fc3b8-e00f-461c-e8d0-08dd809c793c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide a
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
* In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
* Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 36 ++++++++++++++++++++++++++++--------
 xen/drivers/vpci/vpci.c   |  6 ++++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index c98cd211d9d7..ee94ad8e5037 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -817,6 +817,31 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
                                   PCI_STATUS_RSVDZ_MASK);
 }
 
+static int vpci_init_ext_capability_list(struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for guest */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc )
+            return rc;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    return 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -869,14 +894,9 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    if ( !is_hwdom )
-    {
-        /* Extended capabilities read as zero, write ignore */
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
-                               (void *)0);
-        if ( rc )
-            return rc;
-    }
+    rc = vpci_init_ext_capability_list(pdev);
+    if ( rc )
+        return rc;
 
     if ( pdev->ignore_bars )
         return 0;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..3349b98389b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..9d47b8c1a50e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -78,6 +78,8 @@ uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


