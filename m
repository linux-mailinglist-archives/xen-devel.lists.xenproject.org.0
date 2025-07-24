Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00709B10034
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055187.1423690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqv-0006ch-2n; Thu, 24 Jul 2025 05:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055187.1423690; Thu, 24 Jul 2025 05:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqu-0006Z3-T7; Thu, 24 Jul 2025 05:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1055187;
 Thu, 24 Jul 2025 05:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqt-0005TY-DY
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:47 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 241702f7-6852-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 07:50:45 +0200 (CEST)
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 05:50:40 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::1d) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 05:50:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:40 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:37 -0500
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
X-Inumbo-ID: 241702f7-6852-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKfVra+2ntnSHk9ev8PjHEJQ29PXyNWB+rgoSMuJXRC3AnZWoHsIxzrPqgpeDxdZl1pj6kEv+7UYJKSCl/dFNVUda+OQ4lWEPER/gP9C7CbK9JdLHOk+0yhAJTOSdMEIYcMGGbBnPpmKof7OP+ji0KeMlwQPFb1EJNHhMnfiH4FZYyincQACy+PI+5mfqw2C2P6+n1cpMnuhWun40nhitpeZLy1z2mP5eueQnKAt3HTn5c45cq/DINjvN+TsD028xxIwhnYfvrBdmfOxmO+Nu5/jONH4u6myKCktOFPIrBY+o9oAerl6wqXReEeVmJbAl93U8qeTzMjaEfYIk9RtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4bwasl4+TdfoLt+NDg4WnuAbgZxNeG5XWVyjSSjvBI=;
 b=Hex2rmlCieZblgaNITHqlBMLXQatfim4ZqEnYZMuV3DiT77FQ4lCej2XO61xrlQke4NpQo37bekYS6+kmTfEooHfh9ZVFmWOfpnOVVdpzY1zJVKTaVIc3ADa2IrbupAHzKMChr3xTyB51qw39V0ZcbOZGx3+AMawUavloHrCEbpJb9xDVWK3J7rG1SLwMvv7dOtHDNcsAQQkXTWV2hpQHrxjac9a2XqUC+k82C9bTSe6kzmK4gBo1UcntvmrMFsTnHq3Wd50Xjhv438msXVb2eydzHFiQaEgfrEe/a430C3Z9nrr/sJQvRRPG4Mkd5Dccdo/2l+E2bDqJB+m1PB3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4bwasl4+TdfoLt+NDg4WnuAbgZxNeG5XWVyjSSjvBI=;
 b=OPg7MDuMFy1kZ6MryMpciePOx5AR/X0+uWndZbk6bX2UVDxx4I8IUNIKdLqvexoSfweXwCo35Q3MD86HAvjPBt6ATFdMwYzVUqnwvt6yf64OmuIph9F9P3Jzp803CEWS4Vg70Zev9mX3sww8L6erkZhgk5csAkgHx51FvFrGC4c=
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
Subject: [PATCH v8 6/8] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Thu, 24 Jul 2025 13:50:04 +0800
Message-ID: <20250724055006.29843-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724055006.29843-1-Jiqian.Chen@amd.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: ff71942d-7667-477b-6f0b-08ddca760582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0UzMk15U0lSKy9ka2ZoYUxkVmFWTWRjU1BDVHIwUHFxMFJIeU5YT3BHZU5J?=
 =?utf-8?B?U2JEeUFzR0lCZjkxdzhXeCs0Umk2NDUvRThUV3pJa0dGZldrQ0hpSkx6N0Fx?=
 =?utf-8?B?WEtKOVAvTjh4UThIbktXQ3RpU25BUWptaFhyWkhPQmNTdkd1RUNTbzBsanIy?=
 =?utf-8?B?ZHgyWkRuSjZPNHFBbVIvU244SGgyNWJOY0xoQitzb2RIV3hVb2FLL3pDTHVz?=
 =?utf-8?B?TVNScWk3UEk2WGNmK29jb0JrdVpQZnJpOUVobTUrZHdMQnZNeWZYUWc2eHBG?=
 =?utf-8?B?M1U3WEpEVzlNc1dicDNHR1NBeGxTaHIyRjFDTk1tZjdsNkhoOVN4RDI5bEtS?=
 =?utf-8?B?WEcvMWNCWWRJMU5rUHVXRnUxODRCSmlqZ241MnlrTCs2c3lQVFAwVHZhMll5?=
 =?utf-8?B?WHFaNG5JSlVEZEh2L25meXMzc3dpSlRmMkM1NlRIOWtoMXZna2FHak51eFF2?=
 =?utf-8?B?WDFDZjNyTkJ4dTVhZlB3M2o5dFZmK0VEdDBlR0wrZjVodEFCd2kvVC9WWEQy?=
 =?utf-8?B?czI5eU8yZ21HWDZSd0syeXF4THhxSGV2aDFBUnFpMUtBT0xoMlgwcmUyVWtq?=
 =?utf-8?B?V2pYd3ZOdTUraGtzLzhvVUR3YXIzS2NueGMxeVkySGtGUVBwQytVM2hYQWNl?=
 =?utf-8?B?TXUxNWljdThQRWJQVUFKOVJyMkE5U2pwY3VhK0dCemtVU2JURDhuczI3ajNX?=
 =?utf-8?B?dUcvdjBQc1R2MjhZQVNuejlDT2c1bmp0azA5UmplTkliRDd6UDBhc3ViSUJQ?=
 =?utf-8?B?NStxWTRScnU3eTFsL3lVNlNqVG9qblJIQW1NZ0xKU1hWWmRkQ2UwUnV2bG5r?=
 =?utf-8?B?VmhscVBHRUlsM2Y5bVdBM09uR2lVU3B1NzE5VVV3cWw1U01CRVJkOXlZU2xK?=
 =?utf-8?B?OWxJdTdCK1VPaDE4SjJrNTAzbitFUE53dmJEWDJvbjNzR3QyWDZEejB2and5?=
 =?utf-8?B?VFdDU1Jwa2g0Z0dQTW5hOXFqalRLMXgrZXcrS1Rrd0lIUkx0cW0xWW8zT0Rt?=
 =?utf-8?B?TTU1R0Rpbi9ZaUlvR1gyazArcDZuVFF6S1hhNy9Jb3FFVWU0K0piSnBYVUlL?=
 =?utf-8?B?SmtnMWF0UVRuK2VEYVovajB6VjZKZEFYVHp3cEF1T0RCSXhyZTdyVHlQblJz?=
 =?utf-8?B?WmJmSC85Vk1sR0MxRkVYSlR0enZ6VW53dncvdzluWTErbDJrTzJqc1hLeDVO?=
 =?utf-8?B?OGlsU0FRbE5nV3lPZDBFclovLzdCc3VFZTFVcGpHV0tIRGZWb3RGUEF6bTVo?=
 =?utf-8?B?UDArZzVvQWZidkQyaTRhY2RSd3ZtemVxbHhhcC9YZTF2c05KTDFvbFYwQlVX?=
 =?utf-8?B?a3VnREh1bDBBbGgvL0hFUC9FeDg4Nk5yaWpGdzA1MStHUjI5N1g4amUxREpS?=
 =?utf-8?B?a2lsamlhemJSTEFlMlhuUVhPamRXbjNKUlJJY0JORnd2NU5OczBRcldWRXBj?=
 =?utf-8?B?OVRqS0hiS3A4eWtuMG1PMmlCZXNrSVprS0NHbTllZkpTQU1RaGlZZDE1aGVU?=
 =?utf-8?B?WUdIWlRyRFRxbDlIdTNTU0lhZ2dIaWN0K0lpSDJjM1pLTS92VHcvcnRVZGJx?=
 =?utf-8?B?R3hUdGx1MlZGa1c1cmhjWHJsMnZGNStZZWNObzRzeEhPVkdFcGoyZms3Z0NC?=
 =?utf-8?B?a1Jpbm5qd1c5WnQ0TXpQdHQvdEZKV1hlZlEzQ3BNc3NkWSs3ODVtTzNFNFc2?=
 =?utf-8?B?L3gxdlMxQzYyTFo4VzZsbk9rZ01sN0Uwd2ZqK2J4b3Irdnp1WmtEYXJCUmd2?=
 =?utf-8?B?Vjd4THVkMm5qTmRYOTREYWNPTWtJZHRtOVZPUVRTbkVpTGVkSzRVc0xnM2p0?=
 =?utf-8?B?amdUMG1oaEdCZlRtdUhZeEw5RUg3bVJPeS9wQkxxQ0hldkIzWXVpdHBUazlr?=
 =?utf-8?B?bEl0emtCWUJ2UmhIdEREbHJVMU5KUDVKSDdmT3FLU29FQ0RJTkxIY0NGWHdz?=
 =?utf-8?B?ano2Nm9wc1pwTFpucjRqKzZZZWdaWmV5VDRTbjl1b1R0andOSk82N213a0JY?=
 =?utf-8?B?dENqbGI2M2U1QkZHV1ZIYzJjQytOamY0UDRlMTdkY1I3TUdTOTVVSElsWGxp?=
 =?utf-8?Q?UG3JqO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:40.2523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff71942d-7667-477b-6f0b-08ddca760582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189

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


