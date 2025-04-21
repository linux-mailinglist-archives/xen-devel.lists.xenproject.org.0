Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901AA94C83
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960847.1352585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVR-0007kx-NQ; Mon, 21 Apr 2025 06:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960847.1352585; Mon, 21 Apr 2025 06:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVR-0007hs-EF; Mon, 21 Apr 2025 06:19:49 +0000
Received: by outflank-mailman (input) for mailman id 960847;
 Mon, 21 Apr 2025 06:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVP-00057v-Es
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2416::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e76033c-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:46 +0200 (CEST)
Received: from MW4PR04CA0378.namprd04.prod.outlook.com (2603:10b6:303:81::23)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:19:40 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:81:cafe::e9) by MW4PR04CA0378.outlook.office365.com
 (2603:10b6:303:81::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 06:19:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:36 -0500
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
X-Inumbo-ID: 9e76033c-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPZf8WaCgygJSIKkYILIUUN3/zLTO7izle7oAocKxQPCvzJYy3uTAXuf7zhX3lIajufnx5wTqH4IRhdJ2jG3A+SWIZAJARDTKwoitHuXi58n2xosT1hIZsG2Qdy0T/g5YrrFArA0qSNw6EqgrkdIDxWLW2K2YToS8NBTMzzI/dqhmACXlD7XA/F8Taa/iC7A/r4RbqVyUtA9JwgXbNSOg4D+um+QyE0+65Qt76Znp0e0X/SaPF6s5qReDZQGlWbkwIqzb2DafCUBNDB8br3SUJMfS6GhQO9MpPNH25IUFREwjGYgMrltnf87hkNxCoOAc7P/9gYnaqvBqJuxPBhf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEn+XTSOOgAgdQZbKXHyAs59sfmZHF4X6iJ2+C/9uRw=;
 b=YfIn0wk53p7LP0v7CP2U4oH0AatFmSccGywlwIAi7G9itSN2A8SBjZd4R27xGkJJDl27/Zt2F9n5fxAGEO/DPPnRKzVIFdmgEGnVBw2xEGadGRdR/8YBDb4FPwxtoOJAV4LEQGkae4+r5Jw1SZOea8Qtq3lG/xsKbfOtao19lPGxx9e0+KFxfgfCPQCMR14xjWRdBzGSDXyQ5+aNTjCjXIdw3dcx68wt3uIuyjO6lRdd0Dlk2nvqblGLnXI9rG2LwQh9RLYon0+G73dXKjmV0bfGi5CfpeqPVY9Q6ZqtQJA1N4b5I31U+w68Y6TDgJG0FmHZrNy2xYjrp8Kids3A3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEn+XTSOOgAgdQZbKXHyAs59sfmZHF4X6iJ2+C/9uRw=;
 b=2FfSzyIkhc9udy+wxrSN7B+wKP4diC4OzPq+rSciUXEYd2/Gqn5bhy/2u+jyDghPdwTZOLu5xvqN0v0mRH6TEgNuc1aE2TUpYD0mH/SEeinKSc5adDCxX9qt8BQODqyu8xTNNUz+zWoyO9AEAWYAaKfPqo5F0rkjCh6rJak/QIU=
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
Subject: [PATCH v3 09/11] vpci/rebar: Remove registers when init_rebar() fails
Date: Mon, 21 Apr 2025 14:19:01 +0800
Message-ID: <20250421061903.1542652-10-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d26c478-e605-442c-21e4-08dd809c7f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3oycDVweE8xL1hGQm5XVGQyVi9OanZDTXpWU3FMUVpxdTlRWlROQlVyc0dB?=
 =?utf-8?B?T2xmQUl6VUR6WXVVcmdzMHA2d2gwV1VrRjJyZ2hEZzRrVmsvV0E4YTFGTDJw?=
 =?utf-8?B?K05XNXJ4eHN1UHJIejhJT3RvanpiVHhTalpubDM3SWs5L09QbmRRNVo4bkc2?=
 =?utf-8?B?NFlxK1d1ZlphODFsR0tSSXhEMEJKeWRxTU9JQlA0Z1A3M3J4YkEzNk1aYmNW?=
 =?utf-8?B?Tld4SnorNlU2dSt1bGY1N29BMmlhVWw2OXhCNlltWkNRSCtqQ20rcmVVYTFq?=
 =?utf-8?B?bUMrM2YyYzh4aUQwRVFUUExZMXlxTktEYTVta0tKc2o5dmpCT2d1VXk1d01i?=
 =?utf-8?B?OUQ2aytQYnRNb2w1U3F1Qnl1dnVmNkNJUHo2My9IRVVBU0kvdTNJdzh0QUVn?=
 =?utf-8?B?Rk0vV2duNlFSS3h4ZmxmNW1TVmduSWdlQmwzV0c3KzNIVUdQNitZNHF6em8y?=
 =?utf-8?B?ejZQMnJBNXo3N3lwdUNnTkNDN3VyOTNwUE4vY2dva2ZCVFZWalArcFFJQnJH?=
 =?utf-8?B?STJZeDZBMnJ3RWdyZzN6QXRGN2hlMkdYak00ZFNlUTJRcElmMDlwQjhHYUdT?=
 =?utf-8?B?bXZvbTdjZGhtc0hQMjFjTXY3UWxHNWhHV2FIcDd2cWJvUDJxZVg3Nmk3T28y?=
 =?utf-8?B?WGsyT1RHK0l3aXMrcUh6UkpPOVFHOFdDOGJUMHpsWlFZaTJ3WXRxWjIvSFR3?=
 =?utf-8?B?L3ZkVDRKT2VYSVYyMU5IVE1Bci9QcHlSNkRPR2l0V1VGaEI2VnoxWitIWGt6?=
 =?utf-8?B?YnJTOWVsaWhDeG5uS3ZsQyt4RVM4bGdTVXZSMkp5RnVUQ1VKcVNmZG5jbURh?=
 =?utf-8?B?YlQwN1VDVnFOamp5Vi9qbHhqQjVPcmVKRVJsTCtWY21mc0xOb1ZjUG1WMVlY?=
 =?utf-8?B?TVo3UUFySlEyMEg3RTlNMFMxeFprbmFTYXlVSExVaFloTDQ5Ri95M3RaWndR?=
 =?utf-8?B?QmlFOExDT25QL25mMFZpdkZNdzJPaVRYV1ZLZkwzSzJsNEo1emdiWjhKb0Ry?=
 =?utf-8?B?UjJOd3FyeEVidCtDUzNHOGFxYzhwZG5DVy81d0NKVURwSFpwcFZXNm1vTGQ1?=
 =?utf-8?B?elJQNElWZGRMOGFKb1lKTUdHUmpKU00rRG4zRm5HcW5PaTdyTElvZ0FvVnEx?=
 =?utf-8?B?bktiMVV4eGNOemdxZ2RUZHZrUmtld25QaUJIOHg5ODBDbWUxc1dkOGdKanRH?=
 =?utf-8?B?YUpTZDg4dVRWWUQzdXBSUUxWYXNLUmtLbjNKVldaQkFPTHhqaURVc1Fid2hY?=
 =?utf-8?B?R2p1THFrWm5oZWNxbVlhaVFSejg0TXBoUW1kSmNpZVVWeDdEU29FWXFqa2dP?=
 =?utf-8?B?Qk0zcGZqVFIxaWhCa3pCTlFjbmZDSER6QkUrQkR3eXZqbkVSc0hjWkRLMG45?=
 =?utf-8?B?R0xtVmdqS3Rzc2RlYWZraHF6MVh1OFo5TkRndGMzWVZHZWM4QnFoLytkWHpT?=
 =?utf-8?B?ZFkvRGlGb21OaWsvWGU5R01iMjhwREFYZXVjNnJucUdTMnJ3dllyU3JoSExy?=
 =?utf-8?B?bnlidEh1WFBVaW9ZTHdUaW9JdW9SbHlvNmxCTHZwYUV3UVI5ZEh2UjVvUENh?=
 =?utf-8?B?R2NWUWpnZWRtY0FWUzE1NjVSUm1rZHl4VHdlNGFRcjA0Ri9RODR2T0diWEgv?=
 =?utf-8?B?a0xvVHppUTVkRWdzd0JtOGxNZ2I5TklTRkd0VjZGRjdINWt3ZmhJR0hvTUYr?=
 =?utf-8?B?anZsakVRc215QkpOckg0TUZlRERCWnJ2KzYzVXRkaTJaZGs3djVjeXlHUmxz?=
 =?utf-8?B?S1pyc3B5eWxGVklUTURuRFdnejRGQUpYVFdzNkVxaC9HY3VRUEFBN2xWYVFB?=
 =?utf-8?B?eFlHWmRKODdjb3d4d3FLZnBFZWVFeDluRDE0TktyRVBVSTJQSjc2cVVGb0Fl?=
 =?utf-8?B?aS95bUVLbWlQZ0pBcXpYcDA1cHh4bkJlQUs1RUduTFVFOHJQRkVGQ0d1SnFL?=
 =?utf-8?B?TlpEQWtQSTdXQ0VuUEIrampUam0rQlRQWWRrYVZtZ2ZBZmZQR2hzNWhmL0l1?=
 =?utf-8?B?Wmx0L2NkYTFtV2thMU1rbElrWDR0NmJkNkE4RjhwaHFqZU5FR3BqYW44UlVH?=
 =?utf-8?Q?FZ/fSI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:39.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d26c478-e605-442c-21e4-08dd809c7f47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208

When init_rebar() fails, the previous new changes will hide Rebar
capability, it can't rely on vpci_deassign_device() to remove all
Rebar related registers anymore, those registers must be removed
fini_rebar().

To do that, call vpci_remove_registers() to remove all possible
registered registers.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 026f8f7972d9..325090afb0f8 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static void fini_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
+        return;
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+    /*
+     * Remove all possible registered registers except header.
+     * Header register will be removed in mask function.
+     */
+    vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                          PCI_REBAR_CTRL(nbars - 1));
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -80,7 +100,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -EINVAL;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +108,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -EINVAL;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
@@ -97,14 +117,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
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
@@ -118,7 +131,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, fini_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


