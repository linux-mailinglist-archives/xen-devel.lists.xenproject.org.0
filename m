Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59156B133EA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060934.1426489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2W-0004jD-M0; Mon, 28 Jul 2025 05:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060934.1426489; Mon, 28 Jul 2025 05:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2W-0004hH-I7; Mon, 28 Jul 2025 05:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1060934;
 Mon, 28 Jul 2025 05:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2V-0003wp-F9
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec5e005-6b70-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:04:42 +0200 (CEST)
Received: from MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::19)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Mon, 28 Jul
 2025 05:04:38 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::58) by MW4P223CA0014.outlook.office365.com
 (2603:10b6:303:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:38 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:35 -0500
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
X-Inumbo-ID: 5ec5e005-6b70-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/nnB0NMLDrQu0TpvmTfhE1B1rubse2Ufz6Bj71/yd9Ux28C1uwmjQXGTby4XvGrlyiKbqOGsM+V50tt5WbxfysydmhW8vX/tufbHVPpgvw+Cmb9j397GgcEry73KjpUZQIceSbP1cR1pdAO8QtZRIx3IY0QEEnUUSinnpqoy+7lpWDHjEyzBur1unjrIlPPBeiDeQVqG8soswKeFgWE9wxtOxhoblv7BIF6lAmzqn5980yAbTtUYu8D3q3bjNYBUMHbAmGZ+IBiUJvRQqBBCIFNjsNKhskMiEILrjl2M1uAhbRa71DztIL6++BtdOMrp6w896hbcg0dy5OaEra+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSK4MocmsXefnbTknLFh3X0UgjvHUsHcEkNwm7FW86Q=;
 b=ip0gt0fchX8qfWL2gyMV61jxuKAa8EDEGkxPsQENXJGK8NHCsymA9Ke2SM6j8J/PUwJvfjKG/L0KtLcGve/SZD+IhQ3c+XNsbwmlwvAY6fz1xLGsCdFk89bzpDwFCB7D6vGnLm0LMV2eQx5LPhRlAWcKjoH11LELIAJjDAi5YqPskY2EJ6VLp1yAfNabwrnUrpTScXneIS9NDnCgDORZlrkVMs01EOs/IFsRsb9GFqa+lddE6uBO/LsSuBx5Yam9cMzkzDiKgBkXOi3QH8ko3CFK5G6nq6WY0+RQ+jre2hhp+mlgZExWm0vQ2g+2akJeo0+ApOfAiM/zR2hP3rsOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSK4MocmsXefnbTknLFh3X0UgjvHUsHcEkNwm7FW86Q=;
 b=wG6CFrRFsT4FXy7c+SsVGM13NPSJDmFbd4CLxOi1bk8L9yrc/XR5Uc2Ng0cewaKAC7ARsbI4yMyNunFXK6LsADLLt9cHYTy8wsLNuUL2t4sYoZW76eS90HcIkpLqc/QG4UZuYwFNMem8uabSwRO02VFPiYUkKjMSqx2JPMurZH8=
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
Subject: [PATCH v9 6/8] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Mon, 28 Jul 2025 13:03:59 +0800
Message-ID: <20250728050401.329510-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728050401.329510-1-Jiqian.Chen@amd.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: a20581f4-dd0f-47cb-3738-08ddcd9440cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWl6RlZFMDV6VG14SXVnUFdwOGJmM3Nsbk40eEVTNkJteGFVZFI4NVRDNXVM?=
 =?utf-8?B?cGY0QmhKbDNSRTUwWkpSd29KdFlqYmx0WGptbG1kTFV4cnorZGMxSnA0UEFX?=
 =?utf-8?B?ZkdDSW40RUtoTjRLb0dGYVBuRWFkZjdCRTh6MExnV0JGbTdLQ25qTitkOTA0?=
 =?utf-8?B?NHVydjB2QnhTK2Q2YTdiQnRyeFBvNFVsb3BwZ01mWkFOZW9SOW1yUXdQRGo5?=
 =?utf-8?B?MGtzeGgrUGNuT2xXR3RYTFk2eGFJNVJLWDZNbVZPYWtlditsNHY0ZElISERj?=
 =?utf-8?B?ajBJL3FQR3JZdDNLdU5qT3p4dEpJRWhFU0VLR24rdURySGhJWGF6Y2tRVEll?=
 =?utf-8?B?Q3JqcmNTamNXbHBZbzYrcXpVYlVZSHIrNEJJUEg3UktaZEVJOWRrTk90SjdX?=
 =?utf-8?B?QXNCUDdYdWp6azdiVCtRbzlKZ29oWVJHbE1tQVdObUwvMnpZekNXc0kybURT?=
 =?utf-8?B?MUFtakpiVWpMRFdTYTBYWFRiR1J6d1BEV2IzbkZhU3FKZS9lbitYSzNsK2hp?=
 =?utf-8?B?QmNlbHZHWmFQbHB4RTMwTnFuQ0N6UExybUxXQnFKL0RkT29URlc0TnFHUWFR?=
 =?utf-8?B?MlExc29VR2hIRzdTTUNOMUlRaTRpVC9lQWhDK2NJU1RGUGphTjVmZWd1dU02?=
 =?utf-8?B?ZFhFdmhydy9LZnVJNEYrM09xUkRWVG5FOUxTaXBOSm41WE5GTVdtdWtlNjJC?=
 =?utf-8?B?OVpjQ1M1SVMyYzlCTXg3ZkFuZlc4Y1ZzN2RiaXQ3YWZtaHlNZFlXN2s3eVlZ?=
 =?utf-8?B?ZVFkQi9yRzBtMVgzNDRPcTc1Z3drSXVtZy9CWVNFMVN2SnFQYTVqZGR6a0R2?=
 =?utf-8?B?N2ptTmlRYlI2SHZzMEgxT1Q5VjhZekhKT0lncG9qN1hjUlNraHJvTWNLdktr?=
 =?utf-8?B?N3RrZDBVeFpsTTlOampIdW9RY1dMdG5pTkk1aHBTOWtzNG1lS2h5QVNxaWtG?=
 =?utf-8?B?VStnbEJ4Z3IrU3VEbVNlVnVNKzRZN2V6OFJMcGhnN1hucUdGNVJLd3VZdlZ5?=
 =?utf-8?B?M2hQUSs0T3NCdFRDODlEaWZnbUZncHVHaFlON0FqUmh1RFoxZm1OSTFQQ3Ex?=
 =?utf-8?B?Q3k0NWY0UDlaYnNDdVp0RTRTaWJKNUFRVGxnNDFtVGpXbnlPS3VMdkdxcTV0?=
 =?utf-8?B?MFJqbDMzV3FMLzMxMUY0TjlPVXRPYmVFVVJjdDlrNEx2UENqN3UrL1Irc1BN?=
 =?utf-8?B?Mk5Qd1N0ZzY5NjAycEIweWpvYnZCNFNuSUVMd29sTlZtamo2Y01VTUtpWWYz?=
 =?utf-8?B?QUFnZlZWL05hRDBOeGF0ZXlHZXB2M3BYeHpPSDdud3ZKOTZUY0dEVk9CSUxY?=
 =?utf-8?B?REhqankvZUh6bTFWcDNHWUdCb3htZmg4SDNaemR4eW5yRUxlQmhNZ0R0c3RM?=
 =?utf-8?B?YnNZUjg5VVhJQ3hHQitRa3oraDFzRzh4UmRhTTBxK3hORzRFa0h1NnBxV0ZC?=
 =?utf-8?B?Nml1U1dJM3YvNHY1bGFONlNxYkc0U3RaSnJFUStvN3dRdEJkUng5cE1vRXVJ?=
 =?utf-8?B?aEdtOHNwZVVvQWRUT3VvRkcwaEFJdWkzQ2hwTzIvRTZQdGpaZmJVcGE4Zm11?=
 =?utf-8?B?RU9QMXdZWVJrUlIwYUdJWGZEVU96VDFNenZpeEYrN0xzOFdDRnNNMWh1WjE2?=
 =?utf-8?B?M1VqeVF2MmNjVlFWd0ZqM1kwOUhnVDErcGsza00xYmVCUHgydlNMNEg5bE9Y?=
 =?utf-8?B?OUNDbXV2SFV0eGhwdzhkVXRJd09TRmphY2lPS3V0Mll3RE1ZQ1hBUE1ReVNo?=
 =?utf-8?B?NDFib3lCNGlXelI3ckV5ZGRWam56ZStlOUJxeGg1R0pxSVNRSVgxMy9MMGli?=
 =?utf-8?B?bFNlYVNWOUwvd3k2cVowQmlLdlVmQzJqZWN5MEhDUUQzVkdNQkppMmEvR084?=
 =?utf-8?B?MkdRdTdmY0txano2TllGc3phbjk2OHMrQ2EyY3Ria00wbnNEajNwemdjQnAw?=
 =?utf-8?B?WU4xUVVtOENKeVJva3M1YkRrbWxBVGpHQUZGWVJwbkRMQ1psVWZRY3JHcitt?=
 =?utf-8?B?R2lpSk10S0FXWlNhWTYrZmxLWjBHN2RiRUhRN25nRnA5MlhQczJzN0tqdjhL?=
 =?utf-8?Q?8mDbWN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:38.1109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20581f4-dd0f-47cb-3738-08ddcd9440cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995

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


