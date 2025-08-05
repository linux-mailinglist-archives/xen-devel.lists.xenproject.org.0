Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C9B1ACF2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069925.1433619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gE-0001G4-BM; Tue, 05 Aug 2025 03:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069925.1433619; Tue, 05 Aug 2025 03:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gE-0001Di-7e; Tue, 05 Aug 2025 03:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1069925;
 Tue, 05 Aug 2025 03:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uj8gC-0001CQ-MO
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:49:36 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2409::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e387b2-71af-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 05:49:31 +0200 (CEST)
Received: from CH2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:610:50::25)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 03:49:25 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::28) by CH2PR16CA0015.outlook.office365.com
 (2603:10b6:610:50::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 03:49:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 03:49:25 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 22:49:23 -0500
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
X-Inumbo-ID: 30e387b2-71af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXOlZ5J0llFvYREC05FtH8Y+eKo+hQoRckiDBdRwxzIDy77GVieJph2GuFEKWO+6wYE6yr3PXRhM7LRhz/1Dm3YDqQnCdQM85mv5PtLZXT7mLP6EYO2PAOCMFMLmH1PbWFuSmfMCiV7P7TJbSsXAFA2HCo62vRPzTHDLHSUJjrvidxxSnAWJJFKSqiIPFwI0guYNkXH+sIisjkOMifWQ+YS/qJPosZv4WL37u4NTG+Be/mDpLyyOgfNIz1ShgRYOvubXzDWAP8lhwnx1+He8XVwpzX9KycYIkam7MpzYed722RC33l+redIaJnaXvCoXb2wX2S6zVrGyf/nQ4IL1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN9Hc3cFT88sicAIZfgw4XY51UQFRRCnT2wzAFpfTTc=;
 b=EZJV7sCrxA21/L014vPbRLkRWQ+zU2HaQLhtrhAaBMEHkjeIMKmAoMYX1oaTHiMTCYwsY73huptYWRMs/W0UtKVAAAm2S0dJ3VB6OgsJmG9MZKSkBFV3QgZvYu83vMBOD+A6oj2mMxiWqo9kapOYV/dXgm4yBCz9CM2GrQas1RU8Xt0QKqCcreKre4dqk6b1dSlDYJEer3bHmnJTFWnWFEGlXLEhdHhtaHIZyCgLrW2FxBFK5LW/XRGOR49Ow4B050nUiQM487xw3Uq8kbi+P9VXIVRGcHRoBFFx7ssYXDt2l9vRFmbS3/oafT6yjHT6dm2cBgWnwIyMdoSRIKHYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN9Hc3cFT88sicAIZfgw4XY51UQFRRCnT2wzAFpfTTc=;
 b=jeRt0MuWFLw6icri3mtyrW4mL7785LrVZPE/4+X1GCf879asFuIoFt0Qn2/cXRfzVw+cFARgm+zg75bGdVOZm+7jDaIue2HX95XcIkLTlSwB/bu3650DrrTEKju+3iJ26CYTYFAmRBhMsP6D7Yboyy8jF6c1CfsZv5RjjvPGLbo=
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
Subject: [PATCH v10 2/4] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Tue, 5 Aug 2025 11:49:04 +0800
Message-ID: <20250805034906.1014212-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8f8bd5-ea21-46b8-729f-08ddd3d31249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXU2aXlSQitCWDAwd08vL2dBZkFVTU1SdmFCYmYvajJKZkpSemkvSTBGL0JP?=
 =?utf-8?B?SXNMR1JhUUFqVm9wSEdoYlJKVG44Mm52WnBHd0RIQjcxWVFOMlNCNnNndWFS?=
 =?utf-8?B?U05pZVBaQzRRdEZhTllsR2luZEhVTTRqVDN3Ri9DMlZiVHFUL2NLYm5uOXhr?=
 =?utf-8?B?SDVvUTJBWUlSbDM1UUU3UTV1R2QvOC8vMHdaaG9PM0hmMkFxWnpia2VWWUxm?=
 =?utf-8?B?aldONFdBQmdSTFBFMVo0QTl6R014NFdpQ0pUQWpuNzRWb0dLR2JLa21VUzhj?=
 =?utf-8?B?T0Q0Wlo4ZWFUaEFucVJYc284OGhmMkkyaGdMQkpMaW1kZVpjcXY4aENYRTVP?=
 =?utf-8?B?bTRuanVhZ1ptaWY3OXpSRDZvTWh2WHV4UExZRS9GVmV0WTVCU2h3Y1lLYWZa?=
 =?utf-8?B?Y0lFL3lBS1dHazJ2MklNNm53MmsxSWM5RmJtVElZejZOYWFjNnZ4bGlGeVh2?=
 =?utf-8?B?VFRrRzhXMFovM1k4K3NEeCs1Q3VLa2ZuZnFVd0w4eEdCbnZUMW5KNWdTVk9l?=
 =?utf-8?B?YndsRjRxV0pnRWphMlo3ODQ1dTRnU0toR213WWNtbU5SVlBJQ3UzUDVqOW9m?=
 =?utf-8?B?UGN0eCs4ZDNRVFRiME9MVitFbkZsOE8ySUdxNnNudTdzQ3FPME5kUzZTbnJB?=
 =?utf-8?B?Um1TQytkMHVNK1k2SU1wQ1J4cDViTUJ0TkZkNlkrU0tJaGlmNUpLdlgvaTFJ?=
 =?utf-8?B?Y080MXg3K0Y3U3lrVnlyZVlqeis4YXZkT0E4S3p5aU5CRVBKdFY1Vmd6THBK?=
 =?utf-8?B?NU9XVnhvMHlUNHphQTIvM2hWWG4wZE5tV2poNUE1cE52MlJvN2Y0ZnBYcGE3?=
 =?utf-8?B?ajUvN0tYN1NFMGNGUDhMd3BIZVMwdXluUWZSWFFwRG5lR1lQemUwSUk2VlQv?=
 =?utf-8?B?VzdNK2JUYTFQbmppQlV1elN6TCtDSWRMbGhYR0JVdmt0U3RHTWFZVFhRYVBP?=
 =?utf-8?B?ejBFUXJGSzFyTk5YU0c2TjB2a3lFdkk3V1Vwc0lrOU9TZ3pRQzlCN2Q1QWNa?=
 =?utf-8?B?Mmc5MlB5MTRFZTZab3VpakIxVHdFVlhLcEVZNWUrYXp6dk40YVRZWXJ5VXlS?=
 =?utf-8?B?bHBMQi9ydHNJSjVXQjlLTXAyQ1pyZlU5Yi9mSDJtZlY3ME8yOGVkSENGcXo2?=
 =?utf-8?B?dENFbmRoZ2pKY0IrcnJYSnR5bTUvQitHNWpYbVNLUjVrUGk2SDdGOHdvS0da?=
 =?utf-8?B?T1FsNldENVRxblk4N2FXZWxjYjkzYUlUVU1EVDVmOU03T2w3cDFTaGJOMkE5?=
 =?utf-8?B?VUVkcDhFWFh1NDZiL0ZJWkZyVEg2TVF0TVBuTEFLWlJ4OGNmcThnaWF1ZjQx?=
 =?utf-8?B?djJGSFY3eFJIRUovNFdlMElRcGpTYW80MG5FaHYvQmY0YUhmTDQvNTAvMy9Y?=
 =?utf-8?B?MnlIczVNOG1TalVNSERseDRDcUlRbndNR3d6WlJyNnpTRHZQUTRyN3FubFh4?=
 =?utf-8?B?anlTOEllZ3dIblhmc01KSGxGNHpHTHYxWG5PMUI1dUVEOUNjeU8xcGY3WjND?=
 =?utf-8?B?VC9hQ3lXLy9RMTUwblk1ZElBTXAxN21LMnF0bGV3OTRlN3NNaDRxVzExbll1?=
 =?utf-8?B?N2FFYklmRGtCUVlhS09uMEdkTlhxME9VdUdlbnFaTWM2RCt1MW9vRC85MmdW?=
 =?utf-8?B?NFlnMVBLTGcxR2MzNHBWWDNwV3lJc29XWkZLNjdUWVkzT2crN0tIWVdWYXUy?=
 =?utf-8?B?cmE5RlM5bG1TL1ZFWXJwZVFQZ2FpTmpvZVhlT2pVSFVKbER0aXoyTW5CRG45?=
 =?utf-8?B?V2NYL0ZHYm1qQ2l4Vm1HaW12OEs1aHFzK0g3VXRNcTdweDRUNTVqdE9lbXkv?=
 =?utf-8?B?TmJYNi9RaHF4UDNFOXZNdGVXUGtkNk5UMG44UUVSeDZFYjlvUlpLbXY0enBl?=
 =?utf-8?B?WmxJeUtGTkJIVHFKU2pxWTVDM1JTa3BwWnlmRTAyQm4yNVc5NlFWTW5raWVq?=
 =?utf-8?B?RTlMTUJlNS9pWGM0UmRja2ZIbE1Sd0R1V2l1bmRZR3JqM3dPdG91VmFZWGxt?=
 =?utf-8?B?YThEN1RIN2I4a0xnYW5Yb1ZCS0t3MlBiRkNJaHpTSmxWUit1Y3h2VDh5Ty9F?=
 =?utf-8?Q?KOYLew?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:49:25.4279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8f8bd5-ea21-46b8-729f-08ddd3d31249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137

When init_rebar() fails, current logic return fail and free Rebar-related
resources in vpci_deassign_device(). But the previous new changes will
hide Rebar capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of Rebar.

To do that, implement cleanup function for Rebar.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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


