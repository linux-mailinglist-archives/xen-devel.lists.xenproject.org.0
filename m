Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C7A81D65
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943383.1342164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCV-0004bG-MR; Wed, 09 Apr 2025 06:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943383.1342164; Wed, 09 Apr 2025 06:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCV-0004YG-IU; Wed, 09 Apr 2025 06:46:19 +0000
Received: by outflank-mailman (input) for mailman id 943383;
 Wed, 09 Apr 2025 06:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCU-000466-Iz
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 562dd81b-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:46:17 +0200 (CEST)
Received: from BN9P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::24)
 by SA1PR12MB8723.namprd12.prod.outlook.com (2603:10b6:806:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 06:46:11 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::a6) by BN9P220CA0019.outlook.office365.com
 (2603:10b6:408:13e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 06:46:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:11 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:09 -0500
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
X-Inumbo-ID: 562dd81b-150e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzdD2qq+eW0lorjy44w3cQjJ9EzJuau4S4t4ixNWx5RZZS0N5/2J0VWujCSnArDDYY0RX1KCnwQkKScxxI2cW+PTJVSVNrrMFnXyysPFmfMtb5zjnZDUduSQovEIAeOjrVjx6uGj9pfGIAhQre8tMU44zgZOhZkVCBq104/8WwKuNhC+l33hVAQ+y8tA3wN7ffnyVT8Hx+NL3f+kO+1dGJ5bipkzMKjkaFgn6PSvnVA1gUx8d3kiL98hkBRqSebPppOFiDPa6d/1BtZ5PHpLCmuxhrG+IF4mbT1t5Sb3UYcVj4veLylTGm0LZTwfrVNSGxmhCxgLf8sXs8ON8D81ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPNNAqo4F56g6l3e7GOZK8AQMZSOjN7zWq22SiiIG1U=;
 b=kNI0QXmFwmJYxnlzXjw4rtxPa1Cm0lsDEHDAuhU4YbUeTebfASPb7YjvbkcYzf9GW2OyFuRyRfs1Blm/uhei2cr3YihE5kkGcknXdzhvzpHVFNp2Puo/wKeb3ucQhiY6UKQ9E+azR97ejl6s8jjp2/L/QY0E2j1N4Csd3x7bbezXXj894BQJEdwwzzqXG7NFPdXcgAYUVlzZuAeP32JEiM8jPS0n3tMjRgARnNQ6KUeqTfSw90ULx18H/EbjzXBLsmjRGDso3c8zQ9x1rMjlSCdP2mdZSlwUuV6s5wQfuOrNWPfmlRd6JA3LaMzKc0Hv3CNNQo8oCj4fDalcax4m4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPNNAqo4F56g6l3e7GOZK8AQMZSOjN7zWq22SiiIG1U=;
 b=wfaFtSvwMlUOPTUA8NBcTQOafnZW9GHM77wPtffWhEJBS1IrwUUHmkTaUxdCd3u598BmmCGXDIru4Rdw+3mTs70YzlL1h9xh4hLzdM7ZeL/o/8Sl2lRFLT45CSL44+sW4oXNetUil2s1hBMaExgSR4dWDFPMhGWt9tVdG6DPCBY=
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
Subject: [PATCH v2 3/8] vpci/header: Emulate extended capability list for host
Date: Wed, 9 Apr 2025 14:45:23 +0800
Message-ID: <20250409064528.405573-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SA1PR12MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 7457f07f-e833-4c2d-82de-08dd7732372d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2IxbUVuR1cwbmY2YzdEcFA3elhSZDdwbUN3dVExWGtqWEM2MWt1QWl1WFFQ?=
 =?utf-8?B?aDloWFdDZEtWd01yd04rb0JVeDlwQWNhNzkxZmZadWtWVVE3UWJEVUVGTWky?=
 =?utf-8?B?VldZQ1ZybFlVUnBPZWxsb2FZNEhpRzN2ZnREYU5yWXIrRW0yM3IremhCeVhu?=
 =?utf-8?B?alRlZ2xNSEpmSVNMMzh5UERJVkZRKzgvM25rL3RhdDRUc1p1R3BXZkIyRnBW?=
 =?utf-8?B?eG9EUitySDZVNHVIL3ErWFk1SDE2VjgvTlZGWnhLL21xNFBaam82TXdla0Ni?=
 =?utf-8?B?VFRvazJGclYzY3VKT2dRR2VVOExYOGM5amNSZE5ub0RGeGtmVHc0dlNuQUhw?=
 =?utf-8?B?WWNMczZqZmpqNXgwVGtiY3FnV3IyVmZjQjUycjRwdEs3aHpldmNKK3dOQWZY?=
 =?utf-8?B?VEx2c3QxWFU4WHE4c1RVOXN3cndRNlArbUk4Y0ppNHl1MUN0TE91aG55UzlZ?=
 =?utf-8?B?OExRcjZJUGVndW5NdzIyQWtjM3dPNDd6V2NPTnZwdEk1QWtOREJKODZlODVl?=
 =?utf-8?B?V3d5MWlZUFMwNXoxZTI0V2x5c2tRU0F6SkpVQ1NTT0l0V04vYlNhbkFFVDhV?=
 =?utf-8?B?Z1cwY3lFQWlzc01SV1Q1eGE5S1VmKzkwUUh6M2JIUFlXUjRITzRodm9rU2FF?=
 =?utf-8?B?UzlxVkp0ZWV2cUNxVFdqeUdUVnNteU9mK1lWU3lzc0tkVzI5Q1dKbHh4NWhG?=
 =?utf-8?B?bDVIV0lkYWFQQjJKMTNMRWkxUWgydE5Md2VEK01EK0dpcnFyL1JheHNEYlJY?=
 =?utf-8?B?bUJ5T2twRXNneVhpQnBOaDk3VjdDK2gvanlCanRGOUFWSVpEWFJZZGFST3h3?=
 =?utf-8?B?dWl0T3NFTmY4Rmk5NTQ2MjBITktQMEp6eW8yWW83a3FZd2pkUGt4cGEvZUJy?=
 =?utf-8?B?YU5ET2VCa08wUXJZMUxJdEYzeW9nV2NoQnRneVdSVktoR01ZVTdtM2RJOVpM?=
 =?utf-8?B?RXh4RHBXU0J3TXFLdUVIb2NOdXlDblBPTW1GQUtVZllPMWhjVHU4aVhMSW01?=
 =?utf-8?B?cTgyd1lOQitvdlJzNDBHanRSZ2xHOFE3M1grS1NaeE9sTkVOVlRxUEJ4Mkp2?=
 =?utf-8?B?aFk3aXFERjFDMDRsU3F4bHpmRUVJZ0UwbXh5cVA2SkhEUE1VSHMvUkhFZ0Rh?=
 =?utf-8?B?U1NCUUxmV3NyenhENHJoeG1wYmtpSDBCSTBRQVgyWUt2eEw3RzdWUENqRE1N?=
 =?utf-8?B?YzdKSlM4ZW41Z3pzNG5Rai9mdVB1M1pCSHl4enUzZUdTeTZnSTFLNHdYM3lI?=
 =?utf-8?B?akFFaGhqeWRabHNSKzZlMXpaMnFmTnJZaXVHQUVXdjk4TERsdkZoK0owWlhB?=
 =?utf-8?B?c0FpSFcxM1F2N2h2dlo5YXY4NGJWSDVxU3pabjgrbTlnaHpycU1sckV3dWFV?=
 =?utf-8?B?Nmt2cEhmaVYvcENLekxpdEMzY3FWUnZJajFCVVNNSm5CZ1oxcEtSKzBDdWxG?=
 =?utf-8?B?MGlXVlROeUtpTnc5bTZ0Q0pRZW40c3B6Z01takNDODdFM2FlOHMxK1VCYnBJ?=
 =?utf-8?B?YnpTYUYvQmgzTE1zNW9pY2FqMExDNU9EREJLdnZmQnVaK3E0VW11V0R2Titr?=
 =?utf-8?B?QlV3M1B0V0ZCdWxYYURQVDZHSXdtdnBVWE1BWUV3VnpDOTNQWjJNY2kxV29C?=
 =?utf-8?B?S0Y3ZDQwWkZYK0ZGQUFkQ1hGbC9aUWRDK0NnVEhleUJRUU1RTytUYXpuZWxm?=
 =?utf-8?B?VUpaYUsxY1FUU0RwVTRka2U4YzUyMjhGOS93c1hObkY2Y25GSVc2S21KSklz?=
 =?utf-8?B?TkFhYzhCdDhXM0l0SHVaN3gwOFFnL0c5b25SNFpIMVBRTU4xaTYyekZuK0xY?=
 =?utf-8?B?enNEN3cweGUwanlxTUhDTWZPOFFUSWtiTGZibHA0clpmVTVqUWVHdDJmWjZv?=
 =?utf-8?B?dzhGNTN4TzRqYVFpUVdicVJ5NGcySGR2M1BXQkNIcWtDcXF2VVFVQXNuSENZ?=
 =?utf-8?B?VEpwWVpSeWlZWjBvenNKNFZPRmxjNGVRV1ZoNDJZZjNtZnh6cjBLK1gwaVRC?=
 =?utf-8?B?Y05OOHJhbmpzVU1HWlZ3aGo4QlU5YTkvNEdPVHhxbDZFbkZjQnN3bThEa2pC?=
 =?utf-8?Q?4kxZ2Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:11.3965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7457f07f-e833-4c2d-82de-08dd7732372d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8723

Add a new function to emulate extended capability list for host,
and call it in init_header(). So that, it will be easy to hide
a capability whose initialization fails.

As for the extended capability list of guest, keep hiding it.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 44 ++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 0910eb940e23..6833d456566b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -815,6 +815,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
     return rc;
 }
 
+static int vpci_init_ext_capability_list(struct pci_dev *pdev)
+{
+    int rc;
+    u32 header;
+    unsigned int pos = 0x100U, ttl = 480;
+
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        /* Extended capabilities read as zero, write ignore */
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               pos, 4, (void *)0);
+        if ( rc )
+            return rc;
+    }
+
+    while ( pos && ttl-- )
+    {
+        header = pci_conf_read32(pdev->sbdf, pos);
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc )
+            return rc;
+
+        if ( (header == 0) || (header == -1) )
+            return 0;
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
@@ -867,14 +900,9 @@ static int cf_check init_header(struct pci_dev *pdev)
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
-- 
2.34.1


