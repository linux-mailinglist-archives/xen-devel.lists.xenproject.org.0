Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD1AD6C2E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012642.1391173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGP-00011L-OT; Thu, 12 Jun 2025 09:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012642.1391173; Thu, 12 Jun 2025 09:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGP-0000u2-Fz; Thu, 12 Jun 2025 09:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1012642;
 Thu, 12 Jun 2025 09:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGN-0008FN-Jn
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:23 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2407::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcbe0f62-476f-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:30:22 +0200 (CEST)
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 09:30:15 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2b) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 09:30:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:15 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:13 -0500
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
X-Inumbo-ID: dcbe0f62-476f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnngxCUfLqA+isdHJ7e7vhFXijn9uHM/ewIG8ZFNFJg1t/NI5nyMCmNkF8RyiigDu28vaDKpdtzZF6QTF7aWPHQu6XLlxsDSw2Lg40CAAcqJdJCVRjjHZneNwdttYK4FTOaJDb7Yr90tXIN4yt2EAF3Cm7xLUNXTii1uGPB8JoRSSDGLitjIxSy7AUTIiNlf2ERvRYs5YvuBCPdOQBj14gwEvTF/o++/E2DoOvMvq3C6kxtkqi/zkl2wEqVNNOCuB1V/Dods/9yc9Miiuq7i5f7+XffLzNSfuwac/Ze0spkyxJTg/BX2BtgCSikggLXztlpjYZE1/SbgbjKafwpcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dba9OwLmQ/7Y1y07VvO2y1cWEQ1y3hVwbBKPQbrsKrQ=;
 b=hwP/w9/oCeKGN2vmcDc3VtEd/PMFI7vpWfu6QPouAq4XobMnQff8KmZrqaJqQYUES19rXlT4G5IGrFAgBNyvYAbTGc/FqtGwnu5w2NoZDonIqYdreI8e5w1OSVmNwDfi+UZZGT49EqI49osQf//PRVatLFoZ9v+NCbSXm66yS7NX902IxOWZ1h0qd1jvdZ/JdWBOiK/iWsgIicWXXr/Bnl/rCaQ/q/gamQVfDuq10SAlk54ivdMYbwu1Ltsv9zvC1WX2CGMlVenKHSPdVoHhWi9FDc0lCJ7hCWrxdZEaijm+3upGCs0bR8vLZ0Lwm/iT4Mu7wyOcGamOqZoKonT1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dba9OwLmQ/7Y1y07VvO2y1cWEQ1y3hVwbBKPQbrsKrQ=;
 b=bHNjwPa/Y1rXXCtDkWYfEmkFTCBZu7ruPb2LKcwg4hQkhB71XgPmKh741KwYG7RQDSpkoc5A6sM4d/yuB9N8m7nheaqvNqWwK9lwMbt/yUWy+C2l2YJ+bgw5Gxy74jK/IqCK3c1MuCCyXK++cYHStcQW68YdPQG4tfcQz9IsOv4=
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
Subject: [PATCH v6 6/8] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Thu, 12 Jun 2025 17:29:40 +0800
Message-ID: <20250612092942.1450344-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 7128e0aa-fca3-41a5-1aac-08dda993bcf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzJ6QWg1elpCOFRUVWFlRHBIWmlaRUg1Y1JQNThkeTAxUTl4NDh6NkR4aGxV?=
 =?utf-8?B?SzlLeURNU3RyWjI1WTlYQUgweGtMSWUxVU5RdnJQcldJaWR3L21xMEFVV0Nh?=
 =?utf-8?B?bVFMNDZNelNlOFRyZWo5S3RHNVNpMG5NNVVPZE9CQnhUVGVuamZobXlhQWx1?=
 =?utf-8?B?UUxLaXdhWW1UK1gxcHRWbDQ2c1FZK1dmVXExQ2ZOK1dhemp5eVVPcFpKcVdZ?=
 =?utf-8?B?bHJHQlJYK0hmTFIyT0FmbGwwbXBad3RHU1oweUdHNVMwRnpzaWVvRmZPeEVm?=
 =?utf-8?B?c0tEVTN4Rlk5bUREbFhnd3dvamNSUmRGZUtlcU9nWHVhV0N0bVdYV2E1ZjNs?=
 =?utf-8?B?OFRBUHcvMmc5WFhLbXlnNmpyZjV6TzdyVFBHWmpRUjFKc3BTQ0lKVWRHQVhE?=
 =?utf-8?B?Ujlrek5laTRGYUhXNXhzc0Jwcy9jTzhTL0lsR1dGTDhSbHk5c3laTGtLRUF4?=
 =?utf-8?B?d09XYUtSa2Z2OFNtN2Jiem5YSnJsZm1nNXlyUTk2dlNxbTRnNTVXNTdwN2dn?=
 =?utf-8?B?Yk11cC9KZVZsMnU3QnRWd3RiK29taGl5Tm1aQ1IyT001OTBHWFpaYlpqdW5I?=
 =?utf-8?B?anF2RlJtRHhSS0NHS28vcDBRV2lYRVJxd3NyZEJCUDVudEU5NkpTUSswb3Np?=
 =?utf-8?B?d3BNRmJOaUU5dzFSanFWSmdHVFB6THF1cmcwTEcrUzRjR053WnZVVGlEUDVC?=
 =?utf-8?B?c0R6WmdrWEtiTlFzcVlLZkVrZ0tKenM0blNENHJCdldNckcvdlp4T1RqOFQx?=
 =?utf-8?B?SDJOcWZFT0hZV0JXT0dibWZtVGRpeDY1b0J1Ymw0QkFZSW1JK0d2RTJCaVpP?=
 =?utf-8?B?eXN3NzU0bFViLytaMWdVNUF2NDZ2MGFEeEhEdVZnRU54dmFCdTlpUFM4Vjc0?=
 =?utf-8?B?ZVlHTGUzK2YrOGhuWjNocjU1WWNFQ3VPSVdxbm5pdFZ0VWc3bXEwL0RiSGRq?=
 =?utf-8?B?RmY3djRMWVNibnErM1Y3NC9jakIxbDdtaVF4WldxN1hpVVFxQzNXN2ltd2tU?=
 =?utf-8?B?QjdyTlFrazd5dk51d0dhSDhwTUg0RnUvb3B3T1Q5d1pFdmxiNmNDUzdmdzk0?=
 =?utf-8?B?Uy9ublQ2SVIwd01kZXJhaE5INkZVVHNMTnVEQStrZTBOMXNEZGhQY1hmQ2ta?=
 =?utf-8?B?S3FIdE4zbHRtMTRuV3RqeUJaL2NXbE1PQVVmK2tqOFJ5ZGZCcTlRSU53d2l6?=
 =?utf-8?B?dFprenR0WERlb3FZdTJlVzdrZmJBdGtyUXdCY2Q2a2J5OVFvaDdkZkpwSEVy?=
 =?utf-8?B?TGFJZlU4NFFBMDhqWW5IOVVxczJyTk9PTXBYYW0vajVRbUlKRkthZkhNdTUr?=
 =?utf-8?B?WXZSL3NzN1BjYk9wRlN2TUYrOUw2M1huYlpEdE8zRHdXeUNWSTMzdnRkTC9S?=
 =?utf-8?B?enFodng3VW9zTnB0Q3RjcU5vTVZaS2FUMUZJaUFWeE42cDcrenFZV1AvTnRU?=
 =?utf-8?B?SlU3akRSWi9Kd241bG5kV0o5MTIrL0djYW5ZSkwvRnRxMzN1YVdoOEZ0OVkw?=
 =?utf-8?B?NVBGT2tyMml5MU9jYzZyRzFOSTU2NEdvcW1DOHpPZU9wUUxYbVUyZ0NZQXVx?=
 =?utf-8?B?SE5sRWtDQk1kT0hQY2lUWUJzVmdKQWw4WVlSUjF5cjhkbTBFLy8zUEFYYjJo?=
 =?utf-8?B?Yjk3aWN0bWVxWENFd3BTVS9CT1poVGlFOWtZUEM1QldRdGlnWFA0SjdYR2w2?=
 =?utf-8?B?ODd2cXFOdXhzY01uRW43S0RhRHRPTTQ4ZENnUFd4REV4NTZrOUNWQ1hXVHlz?=
 =?utf-8?B?dWNYMW5WOUpqc0RBMTN6OVFUd0NJazQ0UWI4YnQ2d09CMG1qZ2tQR0tVc1lw?=
 =?utf-8?B?UDV0RlU2RmZqbFJGd0tCQWk4SU9OZWhWWGN5NVB5Q2dXclVOaG5oU0pYSXlX?=
 =?utf-8?B?U1lxRHlQT2ErenlBSlhkU0NsbWlRcEhMK3NycGFTcEtWVklRV1A2NDBBM0dt?=
 =?utf-8?B?VEwzMUFaOEhJS0xmRk52eTk3RlpJb0hwdm5OdXcyQ1Vldzc1UGcvNDlwYXFR?=
 =?utf-8?B?U1F0U0hpcS9VeUNDbVk1WlZLSGxJdG1aWU94QVdRUHhhMjFUbXNYUXV5a2l6?=
 =?utf-8?Q?zW+gp6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:15.0804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7128e0aa-fca3-41a5-1aac-08dda993bcf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334

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
 xen/drivers/vpci/rebar.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 9cafd80ca2c9..4b1892fab3d6 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(struct pci_dev *pdev)
+{
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
+    return vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                                 PCI_REBAR_CTRL(nbars - 1));
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
+            return -E2BIG;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +108,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -ENXIO;
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
-REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


