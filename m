Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234BAAF88B2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032834.1406268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXL-0005Rf-Tt; Fri, 04 Jul 2025 07:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032834.1406268; Fri, 04 Jul 2025 07:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXL-0005P4-QD; Fri, 04 Jul 2025 07:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1032834;
 Fri, 04 Jul 2025 07:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXK-0003s2-73
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b67003d9-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:41 +0200 (CEST)
Received: from BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 07:08:35 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::8c) by BYAPR08CA0044.outlook.office365.com
 (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 07:08:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 07:08:34 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:32 -0500
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
X-Inumbo-ID: b67003d9-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peLiyhfO6ct8BxJ3B0PAowuEmUQnniUKmSDHM6YyRsGvcnmyHio/19Dz3t0krHncMIi83iSJCrdjAmuZ7DtwWJP6Zwe3OSKpAep5hW3Nmj+DtoypOiVKLz4goAmINiB2U8iuz0qUkLUWT2T4OKXF95RL1xqUbq9Ca5vCsUWW2BAS6l+9nLuErSKoV8qFTExGkcZ4jznVNgPFfM6KWl3XHLrTMkwwJNdPecPyeLflpm7srS+oUpdljYoUmG54zz9Iae9sDCj/RrbDVnV1sTbJ2OViNolfauy7aTPoxm6QaszQD4ICSbnCjb9a7tGEap70cUq38iD1efiiCOKD84f7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC43YaFLzErVGNoxdp2AcmaD8nRTTrLZtlMoBDsTcGE=;
 b=db42azq1dVT6qLN/67KVqHxuS9NFMZKzwc3TucJKtIFFpLGz4oV47vnP0byUtLU84gg1GliV+vcRfLDEYiR9Rta3aA93XVLb0wCmDxkL1GzdVHhVQjLKarviyEugVEqq1sTcCNdrA3fgipfybstEf33wJah6+SqESrv2p8yYYV0i3m2dWPNgmWB8oIkLdOlis0C/wU5guNfvobBdpguhq/9NhapmHYDMQwKLxt95ygw+Gh75tqiKyGdBWFc0xlyNL/eFxuL8H88EjmTkaWin2tK8E573qk8E5lcfq1UeKAd/Mr4r1oI5p+QWQZBSI6WaQbqu+NyAf22Eo0F3mkvUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC43YaFLzErVGNoxdp2AcmaD8nRTTrLZtlMoBDsTcGE=;
 b=GzFjSFxnDZvPT7N1ExaeHxO+2/OCyFlGUyCXaIsYb3x7yZFDIHWZpR+J3z8HDGwJ5wMQemW0+XGPGfVvmGdzbJfVVxgmjVITsBbHtWQIEuASoFaYDmVPNhxTYM+Jv5mmAvkhjpvXe8G8PjVs2zBTzT8Mj+zt0Y8HmfPBBSd9ZJo=
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
Subject: [PATCH v7 6/8] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Fri, 4 Jul 2025 15:08:01 +0800
Message-ID: <20250704070803.314366-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704070803.314366-1-Jiqian.Chen@amd.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: dd38cabc-1e40-4045-4f5c-08ddbac99713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEdLOWRhcW5LMTJSS1lMMGxLbzlxUnRUMjVxWTFRRlF4S3RLRE1rSFRUTVkz?=
 =?utf-8?B?aHZjV0RpNU0vWjJUT0NQc3RxOWdDWjlWVmtpNnJ3UytXZ0lpdmJyTU50c3U1?=
 =?utf-8?B?TGdoUDZFdURBcmFPTWlHbU9meTdTUFgxRjV3NTNsK3FKd2puVjh2RE9vay95?=
 =?utf-8?B?WVM1ajhwNTJVYitFUGJ6bHFKeW1HT3hzaDRNQVc3YVpyRzhBMVBXUVlIZkU4?=
 =?utf-8?B?Z2g1OWwyT1ppS1FlSVh1ZUZ0Q0FlQXAzSlFubWRiem9FbGN5WWdwNjExRnp6?=
 =?utf-8?B?QnZXVUtlQzVtSVBkVlVsRnpaemZ0ckRubGN5UDY3WVI2akkxbWV5N3FDTTJC?=
 =?utf-8?B?MVJSUUd6elBYUG5PZlNWVjBxUnhQd2hwenplekQrUis1ZUJUUzZWUi9RTkFV?=
 =?utf-8?B?QmZkRHJ1UXhVNmpTT20yNUtOZldNVU04QnJuUkJRM216a3YvM3VrZ2pVejhE?=
 =?utf-8?B?ZGkvTnB1YVNPcFRvY2c0ZTVpajcyZzJaRGNKZHhVMzA2YWNwRVAxeDZraXZm?=
 =?utf-8?B?NklOd2lobjlieVpXOXgxRUhNb3NxNUVhR2daUXhIVkYvMitEbW5SbmRpck9T?=
 =?utf-8?B?WmhJUGV4S0lwTG8xd0orV3o3cEN5QTJzU1E3dkp4RW5QMm9qb25HMCs1aG43?=
 =?utf-8?B?c1ZKQmdIOTVvSGl0UllNVTBmbFlkcnVjcVlOUU1WNlM4dndTSGp5VmloZ2oz?=
 =?utf-8?B?RVZ1dm14ci8xWTVpb0MranhOSlFWL3NxdnhuazdCZnY3VEUxVjAyb0w0ckkv?=
 =?utf-8?B?d0gxNmZiYjVabTVQT1kvNjEvS2taUHJrVUxBWEZzQkRJU3VpU0JLcmkzMVRy?=
 =?utf-8?B?WUtpaW4xN0UwZlk4Z21pQk1UUTZ5Q25yODUybWJMZm9wRlMvMUR1NHhsVnRT?=
 =?utf-8?B?SnJNbnUzRHdaN2ZDQUNtTWUzVUhjZzQyNDRUQUhpLzA2TjhaYnh2ZzFHb1Ar?=
 =?utf-8?B?MGV5SmFNU2hTMDBOc3NJeS95RU82TEVOUzFud2JCaFNOMklCZ3dEVnFBUzNG?=
 =?utf-8?B?Y05zaTNiZWdkZnI3eHVuUFhiMWdlZVBIQm56aGdaRWdKem5LdnI0SGc3R01T?=
 =?utf-8?B?MmVoQjdHRzNTY1pnSmxYNi9LZ0IwVFJjZjh1UDM0MlhYc0NkdFFrQll6VVFs?=
 =?utf-8?B?U09xWU1XUjVFYnZ1eGVkcFlrVlFMYVlpclVJbWZpbUdlVUF5MERiU25TVzFC?=
 =?utf-8?B?L3dZUzdvUlFFcWorbEt1TEJQbG9HYkJLNC9FbVViekUvbHZpNnlPMlp0dWdy?=
 =?utf-8?B?NlY5bEo3OXdEMWh1QWtaQXJoQitlZ2tqRW1pNUxKVVdud20xcUlVR1FVN1gr?=
 =?utf-8?B?SDJVblZ3QWs4UGdCVmZ0WGkrT1gvQTBpcjJnOWI2U21BYjluTVgxc3BBMW9M?=
 =?utf-8?B?ejVET1FMSlVMUFVVL1VDZXczYS9kVjhFU3hDNVZZd2NYUE8yTzFUUlVNQTRF?=
 =?utf-8?B?Nk9IR1hWRUJsUlgxTmVhdE5tKzQyTUR3YkVkZzl3bGRkQUdEZUhiVG5FRjdX?=
 =?utf-8?B?V2ZoWUNJN2c3TGJvSCt5TjU0OEJ0SGxXSmlSVWNLcjZvOFowdFBQMDhDOEpT?=
 =?utf-8?B?cjdkV3NSRDgwUXo5bXE3djBrMmI4R1ZIYmRuRTV3OEE0M1p1clhJNW01MUZO?=
 =?utf-8?B?WnFMKzA2K3V5L1h2OXV4MlpqNFdvTUd0b1g5ejFpRmtLZS9rWUNFRXVQTXEx?=
 =?utf-8?B?dTdldEQwTFdramRQQlNlT1d3ZTBmNlV0ZXB0S3ZSWXFtYkNjVklocVdTOFNL?=
 =?utf-8?B?SlFVLzdDeVl0MTZON1NFWWpQTXNLdGFvaThHQldGU1lhRThwdlBNSjRoM2NH?=
 =?utf-8?B?dWlNZEt6OTJRMEsxK0JtRTZqSE5tYVNRWVNoQm5ubVRYdVZLUkI4U3N3VkRF?=
 =?utf-8?B?RnpVcjJKck12MSs4OFhRai9KOG9WSzAwM3pCZTZnNzNwalpxbm9MWWd5SVN4?=
 =?utf-8?B?Tk9yYlpBNzArZjFQWG5BVHlVSE1Qb2ZlSlVscGZTTW1hVDVFVmxROGh4MVpV?=
 =?utf-8?B?WXAxckNpdzRIcFJxbXJMUFVxRzN2VjZDdFIrWlZvMEl2cDRSUmVQcVdXZ3lS?=
 =?utf-8?Q?48+eDH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:34.0947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd38cabc-1e40-4045-4f5c-08ddbac99713
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280

When init_rebar() fails, current logic return fail and free Rebar-related
resources in vpci_deassign_device(). But the previous new changes will
hide Rebar capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of Rebar.

To do that, implement cleanup function for Rebar.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v6->v7 changes:
* Change the pointer parameter of cleanup_rebar() to be const.
* Print error when vpci_remove_registers() fail in cleanup_rebar().

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.

v3->v4 changes:
* Change function name from fini_rebar() to cleanup_rebar().
* Change the error number to be E2BIG and ENXIO in init_rebar().

v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 41 +++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 3c18792d9bcd..39ab9c2eb7d9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,32 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(const struct pci_dev *pdev)
+{
+    int rc;
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                               PCI_REBAR_CTRL(nbars - 1));
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -80,7 +106,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -E2BIG;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +114,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -ENXIO;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
@@ -97,14 +123,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
                    pdev->domain, &pdev->sbdf, index, rc);
-            /*
-             * Ideally we would hide the ReBar capability on error, but code
-             * for doing so still needs to be written. Use continue instead
-             * to keep any already setup register hooks, as returning an
-             * error will cause the hardware domain to get unmediated access
-             * to all device registers.
-             */
-            continue;
+            return rc;
         }
 
         bar->resizable_sizes =
@@ -118,7 +137,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


