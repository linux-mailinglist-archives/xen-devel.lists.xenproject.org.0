Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8050ACAC795
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180067.1503325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSA-0000tF-5y; Mon, 08 Dec 2025 08:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180067.1503325; Mon, 08 Dec 2025 08:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSA-0000qu-1l; Mon, 08 Dec 2025 08:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1180067;
 Mon, 08 Dec 2025 08:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmTq=6O=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vSWS8-00007V-Fm
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:18:40 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f52e246-d40e-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:18:39 +0100 (CET)
Received: from SJ0PR05CA0014.namprd05.prod.outlook.com (2603:10b6:a03:33b::19)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:18:34 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::e0) by SJ0PR05CA0014.outlook.office365.com
 (2603:10b6:a03:33b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4 via Frontend Transport; Mon, 8
 Dec 2025 08:18:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 08:18:34 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 02:18:32 -0600
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
X-Inumbo-ID: 7f52e246-d40e-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guABQYla3dpkZenPpouvIloHtfr5T/Y6Ji2LAXklLQUMkvQ5ngQlqGWTUwv2FNtjdb1SgD+AQHJaq6uU5sm9BEPcG9hxsk+7i44IlPnnuzLsuhT2HO+IWINFNitjuGs+mlOxY2Tw76XRRVhjo6rZbRcXW89XX2qoEVw/9IyRIuG33kTOePix3oRfRv5w8zoQ2izFaMXON6Tim2a1x2T9unCgfwAnqjYdsVMmWTysf8X9o/40lZzxLaYfsvh4khgK0orMSpy35HVOtRVVgWN67ndUGCsoXdfHAr8+Fag/W48nJxGIWSjpVOjtbMn8P9j/YGK14UuRDfqr7aNYyw12GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5J/NLvKolJZFPlK79TAQNzjvzt+n/GIS/2Ciwiyc0w=;
 b=rHD4zri2iw27+Mji6EGaiOnDeSRDqpP4vbhrea27tBeVtqzN1HKpVPCk3iZvoWKemVWKUBWZZ4gh9q2Sz6aLm8l4VO7k9Whc5mJ3Sy09nvcBQBReZDG63FDsXl29HNHnPvsYb1MbZ8CUQJnueplor531itorE8b6oWmP7s5SKpB2W02idvHOWUpOO2BmpyHmA3/z7x1stdo4/X9P+L72aDCcd1F8ywvQDuLngGxSIhCi64u/Ng74iv2E4rERV3sxSuHYt7RgYSxsz+2elRC4JiLEF3Ip/oMVKXqkBzI95ZLwfg82XvKVV3INXJJFOPS9g+Z/DEXNdT7pi+VB9CW56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5J/NLvKolJZFPlK79TAQNzjvzt+n/GIS/2Ciwiyc0w=;
 b=PeDV9HwGd8z8rUzFz/tHrzuQBv5jJbDwO+e1dVXSE83eywhxR8xwVczecVc7ikSpTfjac+ivBpVHd+ZnXGVf2RozwCvs5nfQqoLHewktIr6rYEvG7AGV2PRu2uZqBU/y++y/Wh+wK6hLseVxz5yusXte5noYmce3BZNDW38doGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RESEND PATCH v12 1/3] vpci/rebar: Implement cleanup function for Rebar
Date: Mon, 8 Dec 2025 16:18:13 +0800
Message-ID: <20251208081815.3105930-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f116729-7ad9-4dc5-d976-08de36326160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2I4TWgxWlEvME5BenAyQ0RGMEROL1NBOG1ZNjZIK0w4LzJqUzVCL3QwQ1k2?=
 =?utf-8?B?M05nZ2lxakM5bXZjRGZmM1NiT0k2SlA0aDVFWk91aGhBeDhFeXAyNklCSDhX?=
 =?utf-8?B?ZGRQbjBMcmc0b2xuOXpGRkpINnhObTRGZitvM3ppelJkaTZHbEhZZTluYlZQ?=
 =?utf-8?B?amU3cE5aVXZGOXA1YXRQU0xYYVR4V0Jnakx6d0FzWHZkRndReTFqWlJrR3JQ?=
 =?utf-8?B?UXlwWFZaOUJIMXZxVlB5dkFLSk5Xcm5xMDNDalRsd01YVWl2RVB2bXdzYXIv?=
 =?utf-8?B?Y1dzODZ2aEJFc29sMVpibkI5a2ZqdE12TUx6Q1NrdWY0U0NMSi96VmNBVnFG?=
 =?utf-8?B?RzF3aUVkaitFSmIwOGR0NkRycXhxM1Y1TlozRFpIaitWbFlKMVBvTjNKZW91?=
 =?utf-8?B?bEEwTyt4cDEyR1JUazJhOEcwcmd1YWF4c3hGSTNHeWJjZ0dteWhVcGdqRHR2?=
 =?utf-8?B?cW1HdHFKTkcxQ01VYldmZnhNYlNWUXVVWTY4cFdXQjUrRUJCeU1NRHZMSFhy?=
 =?utf-8?B?S2k0UjA1V21jK2wvejF6KzJNU3pQa1VXVGVuNG9pQTZOSHYyMXpCNHNXeTVy?=
 =?utf-8?B?czFTTElXN3EwU1lhSzdqSUsxY0dSdUFYQ2xFRk9nY0ZOK2FHOVcwaStxVnND?=
 =?utf-8?B?OUZ2Tzk4ZHV2bFdZaXkyRnowMGVDcjd6Sit6amVqelk4cURNVVovM0ZZbnhX?=
 =?utf-8?B?ZHZJei9hanJkMU42RWpvcWt0R21QQklIWFZKOXJwbWVnVnpIVDNCQ1FJeXVL?=
 =?utf-8?B?Z1RnMGxtaWcxYUJkUUNFYnFaYWJNRlRKOVV6T3dEU3k2ek9RTzZHSWFoWWEw?=
 =?utf-8?B?YllpOFE2aDJrTEdSWXFNNEtPd2ZmOXhaNkRnTElhbXFFNHhRSjY2Y3N6T2t5?=
 =?utf-8?B?Rk9nZFh2YkhreXJtYXBHWmt5YTUxS2w1d3VGWnMyYjBCTXBkWUxxTEZlNUxt?=
 =?utf-8?B?TkptZCtIVnhtK3hSV2ZxS3c0REtzeVJ5dzF3eG5RRWZ6NGdVajdycEE0bW5Z?=
 =?utf-8?B?dHFpaXlKNGVPZEtVWi9NZzlqT1preUFKQWkyd29maWRxdHVjL2hBVjErNWhL?=
 =?utf-8?B?c01HUUw0dU1reVN6R2JBNzZEUWp4VmFRNVNVL2VSS3pnNG5ma044eUp4c2Ra?=
 =?utf-8?B?QzIyeFBEZm1ia3lFd0VWbVlCK3g3NDFzdXFNOU1nTTJ4TXcrM0xFNk4xVDJX?=
 =?utf-8?B?WVRhS09BZXIwVW9IbUp1Q3p6LzRoTVZOaTFwZkJCeloveFVVMVE5N1NVK093?=
 =?utf-8?B?M2JGUlY1UUd2RUJTQXFGbnBqM3dmei9NV1ZTMGg3T1Y3cjV0d0RpOU10Z2wx?=
 =?utf-8?B?Q2lvTXpCN1hsWGlyYXhxSXBBR1k0R0dYUjFIZC9pMzZKZnJKSTNEWVhwNGIv?=
 =?utf-8?B?Um9PL3JzMWd4MWJrRGprOFFVNHdodXdSV2lqSml3NFpsejkrYTIwNmpkRHEw?=
 =?utf-8?B?TVBQdkJ3N05pdHZkZzRTQ0JJZldXdTBaekpuQkpreGg0MnY3MmFhS2JvSWRz?=
 =?utf-8?B?WkM1QktPYm9Sa1k0TDNhRUx6cGNma3RlRXF1bnFHTjJmT1NTcDRnSDRiL0ts?=
 =?utf-8?B?L3NMQ1o4czlUV2pRRjhtbXRtekMrdFBkbkVSTGNrcWt4REtyNXFPaGRzVHlT?=
 =?utf-8?B?eml6R1NyZGw0ZnF1ZCtPSHh2bktRZGZzMHZuL2JhbVhuVmtkL2F1Qm10T2ZK?=
 =?utf-8?B?UlFsYXBpTCtqZjBxbDkzSlVNUG5GWjNvY201L2FWejJBZUhSdmhnZ1dLbWp1?=
 =?utf-8?B?NFdTRWdVN0k2RERkVStCeGQ3ZngzQ1ZzejlERVVqbFlrUERlR0F3bmt6WVhC?=
 =?utf-8?B?YWpSb2EzbzRvU2gzREI3b1A3SFZHZE12eFEyR2RjZ1llVVQ5MHk1RFF2ZWZN?=
 =?utf-8?B?SFN0SjA1emVnZVpMYm91dldKd1lQRUFOWS9FN2gyOVk4MDM4MGF3Q2psdUZw?=
 =?utf-8?B?dFVVN2FCSll0ekJtcXpzTk9RbnQrU3hEWUZpcHlBMVp2c01PRDVQM2JqQUdP?=
 =?utf-8?B?UytSUC9jUFNuVURhVS8vaG83TmhnVVN1OHFUcmpQUDQvdWpFdFpRSHNxcldS?=
 =?utf-8?B?c2M2SEhVNC9Vc1JCTm1Yb1YvSDJzWmJ6U0UvWW9lZ1k0UGZqQ1NTRWloSUth?=
 =?utf-8?Q?fEhM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:18:34.1858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f116729-7ad9-4dc5-d976-08de36326160
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590

When Rebar initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement Rebar cleanup hook that will be called to
cleanup Rebar related handlers and free it's associated data when
initialization fails.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v11->v12 changes:
* In cleanup_rebar(), move the check "if ( !hide )" above the vpci_remove_registers().
* In init_rebar(), change return rc to continue when "if ( index >= PCI_HEADER_NORMAL_NR_BARS )" and
  "if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )"
* Remove "!rebar_offset" check in cleanup_rebar() since all currenty caller already do that.

v10->v11 changes:
* Add ASSERT_UNREACHABLE() when vpci_remove_registers() fails
* When hide == true, add handlers to let Rebar ctrl be RO.
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
v8->v9 changes:
No.

v7->v8 changes:
* Add Roger's Reviewed-by.

v6->v7 changes:
* Change the pointer parameter of cleanup_rebar() to be const.
* Print error when vpci_remove_registers() fail in cleanup_rebar().

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar"
  since cleanup hook is changed to be int.

v3->v4 changes:
* Change function name from fini_rebar() to cleanup_rebar().
* Change the error number to be E2BIG and ENXIO in init_rebar().

v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of
  using a array to record all registered register.

Best regards,
Jiqian Chen.

rebar
---
 xen/drivers/vpci/rebar.c | 56 +++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 3c18792d9bcd..209091c00987 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,51 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !hide )
+        return 0;
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                               PCI_REBAR_CTRL(nbars - 1));
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports Rebar by default. So here let the control register of Rebar
+     * be Read-Only is to ensure Rebar disabled.
+     */
+    for ( unsigned int i = 0; i < nbars; i++ )
+    {
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, NULL);
+        if ( rc )
+        {
+            printk(XENLOG_ERR
+                   "%pd %pp: fail to add Rebar ctrl handler rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -97,14 +142,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
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
@@ -118,7 +156,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


