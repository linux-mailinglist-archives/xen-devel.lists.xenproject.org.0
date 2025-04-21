Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467BA94C7C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960836.1352517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVG-0005r8-3D; Mon, 21 Apr 2025 06:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960836.1352517; Mon, 21 Apr 2025 06:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVF-0005nx-U5; Mon, 21 Apr 2025 06:19:37 +0000
Received: by outflank-mailman (input) for mailman id 960836;
 Mon, 21 Apr 2025 06:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVE-00057u-1y
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96405587-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:32 +0200 (CEST)
Received: from SJ0PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:33b::28)
 by CH3PR12MB8545.namprd12.prod.outlook.com (2603:10b6:610:163::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 21 Apr
 2025 06:19:28 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a0) by SJ0PR05CA0023.outlook.office365.com
 (2603:10b6:a03:33b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 21 Apr 2025 06:19:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:25 -0500
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
X-Inumbo-ID: 96405587-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie3C+3Uu+iJEVYh/hqPZlb0ItioxCW19IzzsXI421z6JCXnX2HMirlVWCdWI5TV1vOukyxbbqcO0gsI3ym1ub1+g7oK8NKbDfx3n2ckvzESPKcnwkOrGW15wvKYy5QETRdXVTWbCF2WZGaEdDccS2x80/xgUjeyidZ6d8PAmvUbtv0W54riI54J3NC+jIz/IusMc76R7H/S+s5K2ZV8rOQVzruqg3Y9pVUtqbh5W3tUZQfZRMQRiwV9muuIXHPgJzDW44klyFmylddGd2qmeHkcwhkM9DWsmfGMHW7Sg3oWgLPWAzGNG6b1lKVWEQn7o2OpvheIEJ1aWv+i97AwWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KCgQPyUpGWL9Zy2Qdv7/Xw4+GPX2K++K1X78HD+wMQ=;
 b=Eb3Kw/YVV1mYLUAKyMlc6pz909cwLQIavIx7H2RdWukUJZ5rZDbqQ4hcZCFqnwxtCjnWda6X9HP+bG7UDUZUvl7v1uc5dWhtnGCq9qL7YpHiaCVK78Po1sYVAF1bLxs4pKFDlOTESp+eFm8PQNj2sUvxgkbYTcmb79peXtlSuY6M9Evd9jbYaEjGgDIodJgIdktXu9tr/mFeV4jLtnCSWRZ+bxK2gVPol5VuzNmXuJkoW16lkujPLn2t1jrhpWnoqPW8ap1eI9AV9K/+23KrInlsXFiROaWgyNEhh4hFTk6InfDZFC+OjN63venJuU5qMSNy/7R6a0aUmnzr8SiQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KCgQPyUpGWL9Zy2Qdv7/Xw4+GPX2K++K1X78HD+wMQ=;
 b=xCgeAVIbHGWhbvzyTglNfvV/ueZ7uiVOEPfPPw7VJaoOuyX4DXkOLIUXnahvNPF4A8gM19Krx/VCI/fOtgAz3+Y8iiw6tdpO+czkKrunahJ91zz2TM+Kd8gF/MqkS3WrS5m6ibGrO1V2SJd1BOrpBUrs4nyj9qUgp3QMRd+0rQ0=
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
Subject: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for dom0
Date: Mon, 21 Apr 2025 14:18:55 +0800
Message-ID: <20250421061903.1542652-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|CH3PR12MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c4807b-2405-43a0-9e92-08dd809c783f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk9KRWFxczJ1MU10d1MyaGxkR2JzbzJhaUlia1N1blprSVJHQnJPQW1uektv?=
 =?utf-8?B?Zmt3c0wxcUx2dlVKY2NkcEFDV3JoMStaOGduN0cxWDNNRmFmYWxIUEg5dUhX?=
 =?utf-8?B?SjVXMkNjdWIwU016anowTkdiMEpnaFFJc2VUOVZIUjEydldnYXpJM0p3Zklh?=
 =?utf-8?B?MXBuQWVIU09uTUJ2MEJKMFcrWndYSzdzOXIwUlVFdXlJekpBbkF4cFdJaHZT?=
 =?utf-8?B?NzdwNVdYbTcySTF5WW9OVzk0cURMZ01MTnRyTzBWRGJTeE9KQUplVW9uenpy?=
 =?utf-8?B?aEg1ditiWEpOQkE0TnpzYUtGRjVsdVJPc3RYWHVpdWZRQjN4ZWRuQWFLVzdV?=
 =?utf-8?B?bVZFV3JKbjF6VzRvQ3hPY2tOUnM5SHZzME5leUtEYW14NjJoNHNHeEVnaCtS?=
 =?utf-8?B?TDlRR2JmckUzV0ZaYkFFT3NHdEJXVW0vb3BWRVRvYVhmRy9mSHJma0hvMlNF?=
 =?utf-8?B?WEdLSVhXdzdyT2srcFFyM25QNDhUNUo4ZjN0Nmphb1N2dThUaE5SM21wbmR5?=
 =?utf-8?B?WWRCYTlxblZpcVlybWhqTm5xMUZBUmJYN3Q1cUlaM0ZyZStZcTBLMnB4MTZU?=
 =?utf-8?B?cmNWbThpNDNrRFNEQmZSRXdpYVZjTno3am4xU2ZlMWhxek1lTnluUU4rU3ZP?=
 =?utf-8?B?R0orcTNncjMyVm9leG02a2FaZFVtRC9IcWZlZVdVRWovU1dTbkZpYmMyVXlY?=
 =?utf-8?B?QVBPVVYyWTE1NTZjUHo5czV5SmVTeXFGR2NVOENabnRHSDFSTTB2U2p6Z1NF?=
 =?utf-8?B?Z09sa3A4ajA2dHU0WVpSdHlBb1ozbDBFM0JYdHMvSHRqNkFlQW9seit2SEVz?=
 =?utf-8?B?aHhCaGxsTXF5T2N3ZGkrbUV2OEhxZ0ZOeHJmU29qQnBmTUg0aXd3eUVqR0t3?=
 =?utf-8?B?bVlpaXZ4RlpQeVYxeW5vY3NuaGVnRHp5MUEvZG02cjJ4dmRCSElmeERiSDVw?=
 =?utf-8?B?Q0RtcHZJY0VkT2VXb3NibitTOFZrVk1HOGRBZUNCMWJ1TnFWQ3RQNTVpOWpX?=
 =?utf-8?B?ZEhhbUNmQkY2WmhKMy9HZ0VCRW1oN3J0RjhmZTV4dE9iM3dKVXBxTndTQXRN?=
 =?utf-8?B?c0RPS0ZsK3hUeHcxVnE1ek1mUloxQ0lad3krdGh0bDJWUHN3WHBaemxnRkxO?=
 =?utf-8?B?d2ZsVXkwei9XdUYwNGg0aUpkVW4wdk5zT3VUS25lZWVQd3p3OU5saUFEODYx?=
 =?utf-8?B?K0c5aktZVmpqUWJFQk5TbHRkTDB5NEZVOE4rVDcxRFk3SzJobkY3TlRHeS94?=
 =?utf-8?B?aGxvQkk5YXpyeEw1dHVBVEtRN292QmpEL1phZ25oc29odCtrOHQ5SzFubEhl?=
 =?utf-8?B?bGpValV2WjErY3NaYUd1azRXNktDQlNGeEgvUEd3L2t0ZU52TGVpaWpRdEVu?=
 =?utf-8?B?MDdEQmpqbllHdGwyQkFHTHZkMVdzY3JjNHN2OGhSekNmb0ZrZ0FzeGhsWHI2?=
 =?utf-8?B?K3BDbUU2aVVzcXBuTzVTTW5JdFkvTllwVXlwNEZmUnE1SmJ0UEV2cVVUU3Y4?=
 =?utf-8?B?d1N2NVl1aVd3UWFKNmRMc0xpN25aTTcrYXpLZ1VSYnZhcnhQOU0reDN4L3ZB?=
 =?utf-8?B?Q0JnaDVmSU90UjVWRUExZHJHd1ljcno2Z0NFV2ZYVnRmUWpYc3hPTEVZOHNN?=
 =?utf-8?B?QlBISGhiYTNFK3hjOTdCSEJZTGxaai8zbjdJMml1cnFXbGphVEVEOVhHYlYy?=
 =?utf-8?B?MXRuOE96TmxkMDBEclluNmkrajF3Smo2Uis1Tm5WbHRIL3BuWGJyTEN3bzdG?=
 =?utf-8?B?bUJob0wrWFdtL3BaUHVqbXQxTFNBOXB0eE9NRFpQUUtWbW0xeHpMaGs3blVX?=
 =?utf-8?B?MnVaYXh0YXVkcytPaHpHaExOTmszc0JFY2FxcFFOdlFiSkFDRCtHVllLU3Iz?=
 =?utf-8?B?bDRxbFRXdHpBWWIzcmNQR0lpbkxPNXBFdGljaGkrUm52VmNMMW05VXdvSEhk?=
 =?utf-8?B?Uy9CSXhRNFY2bEhYbVRSL1dEVW9nNm5HcS9hTnpVRU5VNlFwaVVlMkF1SnIz?=
 =?utf-8?B?aGZhK3VVYklOK1pDYkNJdWk5TE81cUhRV205SFMxZmpmaW5Gd3FHQkplSjNK?=
 =?utf-8?Q?I4xjX7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:27.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c4807b-2405-43a0-9e92-08dd809c783f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8545

Current logic of emulating legacy capability list is only for domU.
So, expand it to emulate for dom0 too. Then it will be easy to hide
a capability whose initialization fails in a function.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Not to add handler of PCI_CAP_LIST_ID when domain is dom0.

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 3e9b44454b43..c98cd211d9d7 100644
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
@@ -759,10 +759,11 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
             PCI_CAP_ID_MSI,
             PCI_CAP_ID_MSIX,
         };
+        const unsigned int *caps = is_hwdom ? NULL : supported_caps;
+        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
 
         next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
-                                     supported_caps,
-                                     ARRAY_SIZE(supported_caps), &ttl);
+                                     caps, n, &ttl);
 
         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                PCI_CAPABILITY_LIST, 1,
@@ -772,7 +773,7 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
         next &= ~3;
 
-        if ( !next )
+        if ( !next && !is_hwdom )
             /*
              * If we don't have any supported capabilities to expose to the
              * guest, mask the PCI_STATUS_CAP_LIST bit in the status
@@ -786,13 +787,15 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
 
             next = pci_find_next_cap_ttl(pdev->sbdf,
                                          pos + PCI_CAP_LIST_NEXT,
-                                         supported_caps,
-                                         ARRAY_SIZE(supported_caps), &ttl);
+                                         caps, n, &ttl);
 
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
 
             rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                    pos + PCI_CAP_LIST_NEXT, 1,
-- 
2.34.1


