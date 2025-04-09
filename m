Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF6A81D6D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943391.1342215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCf-0005xA-Ih; Wed, 09 Apr 2025 06:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943391.1342215; Wed, 09 Apr 2025 06:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCf-0005ly-Ch; Wed, 09 Apr 2025 06:46:29 +0000
Received: by outflank-mailman (input) for mailman id 943391;
 Wed, 09 Apr 2025 06:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCd-0004jx-Dl
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b0a6b7e-150e-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:46:26 +0200 (CEST)
Received: from BN9P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::27)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 06:46:20 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::e6) by BN9P220CA0022.outlook.office365.com
 (2603:10b6:408:13e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 06:46:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:15 -0500
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
X-Inumbo-ID: 5b0a6b7e-150e-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayDtjRsagk769H4aVouXmvKtWmebWUdrjIZDPXDiBYPCd5St0R0llI/Y7n7ober/O4b3dO3Tw5Q9qGgWXGYn8vfI1jTV++y1Milw3YwX8uKUJlluYIhbw3mxZu8560MoYwiRRObvP3AknBydRWN7rTTZPS6yy0XYLubDlgT3wkakhCC/LkLNgjtGnDWfTfVgmLGD/ae4cuaJD9AnvY6qmmpsOWoO7QS3julXs371s8RkUlv3PwyifE9gad8NITL4Pd2X8PBeFyxn2sI0GqwJNogw3WGutdDR9y3w6kxwDiwwfXCAw9Lz1kvXwPnrweUzvltJx3Rp5JnP0h5O4/YlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05DKwtjOHiEcIbXDskCI2CknrGZBxVgzCxsRLip2mQ4=;
 b=slJ9uTm+PvUmXI7VYug3EewFAXkiM416vDj9ur3jG2BsGY82koYNKY0gqjOMpHjqVoKlntXSfbOwUbNH016VUa9iQYUqAnVUKieDmsZ+5M32j5bM0t5ihVWu/jNdt9nDSXI+35XIhCm7uOnYDdCfVvmd1XByObERKiwJFhAYfbJW1+hET66DwMyy+zUigHCb+OhotahTMLsiGCAmcYFKm7JNEhUF37/SQDqFu/16w6p1VBU5dFxV41WZMq4NNVcVGxKNlt0ZoKnzGpTw5D7PNH+EaLNrGBKFcFJ6qVrTOKHfBKBl1BadcTyOI9OibE4DorUV9XGtVRP06ieKL5M4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05DKwtjOHiEcIbXDskCI2CknrGZBxVgzCxsRLip2mQ4=;
 b=OgD8Xgf9rRBsyhlDxFowbUfF6Xo+YjtsH7KD+HTWvUInn3TiQtSncjKUxlUKwh2WfQM/yKeHaaTOdi5Ko1Xnl8TfvN4arTVFCy31iST16pJEWtSj+N4Ea5+HVqf3c4n21cXOnH7fHyp3wYIrhOKN+NXROW4PrBG5CdBOeEN4kN4=
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
Subject: [PATCH v2 6/8] vpci/rebar: Remove registers when init_rebar() fails
Date: Wed, 9 Apr 2025 14:45:26 +0800
Message-ID: <20250409064528.405573-7-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b3e61b-7173-4252-f69a-08dd77323c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2luWk9aNnpqbE1ZMnFhcHV2eXdOVGoyaHkyZk0wbEFOeFJRa0ZDMjdITGEw?=
 =?utf-8?B?V3R1VHk0TW5wYUp1c1hHQ21zSjUxN1VPR3N3L0NsQUExdUtmMlZRcTE4bFhu?=
 =?utf-8?B?WjRyN0UyNngzbmM1b3ZpZTd1RjhLcFQ2eWI5VXN3bmlhU0NSVGhDK2tjbFZt?=
 =?utf-8?B?QVdQWGowQkpPVHJ2NThtT1N0Y1EyQzl2UWpnZDd5dXErMy9vZUZtYWY3QXpC?=
 =?utf-8?B?SzJKVWRhOW1OSWNpVGp2MVBCSnU3NEhqeVFMWHB0RUxURFozQ1lWamhDSldm?=
 =?utf-8?B?cnNjcDRkYUlyL3RQaDJKSkVGVTdmOUFTdUkwUk5EWVhZc1B6L01wT1dXS3JZ?=
 =?utf-8?B?Y2lmMG5GQ0RwQmFyZXYzcURPQTlTcUVRYlZRU25VRGloTGdPNWo4aTlOZzAx?=
 =?utf-8?B?THNwTHBQOE96b3FwZW9MYXNCL1pvTjFqV1VHdlYxem9CSnNHMGl6MlhCalFm?=
 =?utf-8?B?a2U4Qnhiamk3enVTeWIrcVhkU25ib3BXcStSWGJlY2NNanR3R3lidGdzUGlJ?=
 =?utf-8?B?dWYvL1lLdktZMlI2S21wTEl5QXkxeXlmVmRZSVlrSUNsQ3oxU201VzQzVVll?=
 =?utf-8?B?R00weVhKNUZFYWxrdVc3YjhNcWFLVmgwODlYaWtkZzNDTTNwTnlIR2xZNmd0?=
 =?utf-8?B?SnZLRUF5elN1M0xmWEhNU2dNZC9OZFdoUUNPYmJLNmpHK1JaMjU0aDBSWkFS?=
 =?utf-8?B?VTV1SHRSckxPTkYzV0UyOU5tUmo4TXJMU09LSDRKTFRuVkhBWXllQ1RoOFVt?=
 =?utf-8?B?SUJ0NDdza1k5WlJYeTgydTRRQ0dqS2Y4LzkvdmRsb2pFMEpReEhLYUg2Z0Va?=
 =?utf-8?B?S21OTVNoUllKRHFZUmlJMGR4dndaV2MrenZpQ25EQVgvVXVSK2c0NENRREpI?=
 =?utf-8?B?Q1BuMVhza1J3c29Nai8xWGFaR1BSWTZwOE5IV21VeXpCSkNZSFUwRitMMndY?=
 =?utf-8?B?TmFRRlZ3VS9FVEFYYUdtMHFlTVloQjY3bnVibm5wakd4eHFCc0J4TnhvZXFu?=
 =?utf-8?B?VWJDYmV6OTBvd1A2djlsdVBsanhtbGN2Qnh6aUdINzhsSXVRdkFtZlgyVjBU?=
 =?utf-8?B?NXRoZ0QwZlpOV05xd3lRMTRCaWYydmVFd0FaTHp1aXZ0S3hxUkhOSndNQXhU?=
 =?utf-8?B?M1NmdGpvdzlZYlEvTnNNU21tRnlDenJteTErL2JtK3pqTm5Od2liR2xsOCtJ?=
 =?utf-8?B?T0h5RHArUWtlck5ZOXdoeVpNMjQ5Q0xlcEpOaDFkNGJiSmhmb0VHN01KdFdS?=
 =?utf-8?B?ZEh2cUI5TDlTSmVDbjZLaVp1QnB2WTVaR0FCUTEzaHNXTXJyTEFKOGtlNVhO?=
 =?utf-8?B?SGZoZDFudWxtWE5PcUd5byt1RlZHdlFHVGFDelNwazdsRUxFNVBGVTdoUWNG?=
 =?utf-8?B?OEdFekIvS0hMUEdFRG5pQWJONnpUd3h3OFVtZXNNK2lFeE1LVFhxblRaOS9l?=
 =?utf-8?B?c1hCZnlETEN6S1NhKzZmbHBFV2JkMUNrTlFHUWFNR0JZUTFHUCtiOU0rZ3l0?=
 =?utf-8?B?VEMrakZoYWN4NHVpOVg3dnE1STJLenFtMHc0K2N5SEN6dWlyb1RNUmE4SUxJ?=
 =?utf-8?B?NWl4MUg0S1c2eXMxeGJFbFlpYVRrNmkzRHYzZnJ5WTNxUmhaeWtDWUFFTkNI?=
 =?utf-8?B?NWNUUHQzRDUybDE5d3dXK1FCaWM5UUFFMmpYbXJxNE9vamkyVGM0R1JTUTd5?=
 =?utf-8?B?WDJZNGNPb1pNRFNtTU0zWlVzaFVzR0xQUTVlakIwM0NIMjBWMFdxQU5PM0ky?=
 =?utf-8?B?alJkTy9lL0xwM3E1YWlIZjRIUHRiTDc0QTc4dWJ6T0s1NnMvNEkrbVJNSDli?=
 =?utf-8?B?Qy9xbnl6SVNia3lwQ2VyenRTdkZPcnkrQjZqbXhwK1plYjViYytKMzdwcUFX?=
 =?utf-8?B?NFZiVEJtMUwrMHZKRk1jdXY5Y2lTZ043cDZkeFZxYXdYSzNsS2hvSjF5c2NU?=
 =?utf-8?B?T2dRbGtmZXB1eWlJSjM2UDVNMkZCWUplWDQwSEl1Z3RRRko5RDhiWFZHbFVp?=
 =?utf-8?B?d2orN0FackpvSmdZSnVqOG82a20rTjVFa1krNGk2UUV2UkFZWFd0MWxsVEFa?=
 =?utf-8?Q?+vzciO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:20.2246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b3e61b-7173-4252-f69a-08dd77323c72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053

When init_rebar() fails, the previous new changes will hide Rebar
capability, it can't rely on vpci_deassign_device() to remove all
Rebar related registers anymore, those registers must be removed
in failure path of init_rebar.

To do that, call vpci_remove_registers() to remove all possible
registered registers in the failure patch.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 79858e5dc92f..e030937956e3 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -51,6 +51,7 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
 
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
+    int rc = 0;
     uint32_t ctrl;
     unsigned int nbars;
     unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
@@ -70,7 +71,6 @@ static int cf_check init_rebar(struct pci_dev *pdev)
     nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
     for ( unsigned int i = 0; i < nbars; i++ )
     {
-        int rc;
         struct vpci_bar *bar;
         unsigned int index;
 
@@ -80,7 +80,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            goto fail;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +88,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            goto fail;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
@@ -97,14 +97,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
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
+            goto fail;
         }
 
         bar->resizable_sizes =
@@ -117,6 +110,16 @@ static int cf_check init_rebar(struct pci_dev *pdev)
     }
 
     return 0;
+
+ fail:
+    /*
+     * Remove all possible registered registers except header.
+     * Header register will be removed in mask function.
+     */
+    vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                          PCI_REBAR_CTRL(nbars - 1));
+
+    return rc;
 }
 REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar);
 
-- 
2.34.1


