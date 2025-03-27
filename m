Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C7A72A9B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928504.1331208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjr-0000Wx-DG; Thu, 27 Mar 2025 07:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928504.1331208; Thu, 27 Mar 2025 07:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjr-0000PJ-8v; Thu, 27 Mar 2025 07:33:19 +0000
Received: by outflank-mailman (input) for mailman id 928504;
 Thu, 27 Mar 2025 07:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP17=WO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1txhjq-0000Fj-2P
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:33:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc47039-0add-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:33:14 +0100 (CET)
Received: from MN2PR01CA0031.prod.exchangelabs.com (2603:10b6:208:10c::44) by
 MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 07:33:10 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:10c:cafe::d9) by MN2PR01CA0031.outlook.office365.com
 (2603:10b6:208:10c::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 07:33:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 07:33:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 02:33:07 -0500
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
X-Inumbo-ID: bdc47039-0add-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxQteUsH5vHrukHWOXL7jnRxfO9wslEmCrC3FAU7C1tE3iKVgmt8rHA7FgdqbI4ddx2kWwK4CzJQnWi9td1RmXZj8OtuiFZw4Vi7xXmUDUqsrjx9MTsdNkYoLVn/bXHfceSPjjz3e59Ywli1pOAeprSegbPlLQKNv/bQI4j0X6No2vgM5WvTjEw5tZO3aQSd6dolMo9rOigUFNsulOvQXlWRd1H6kLXvTEB5ruo4T/YbVsupnaDFDd8LVJauhkGcIMOYHcepCOAXZt7dA66QZd7+CUu/L6cgq3RP2rsLjCihunDvOaBrWPJSCqVj74XuqF9DB0xjVEUbGK5B+9hv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYEeEBUWQ7pVi/5cONRapUgnYozVHriILuKaiULbW5w=;
 b=ctu84xR8wzKV9Ozy6n2QPlXcQb3cVKPALvYOo7cTfUrBukdJmJqgW0FIHdKmmSCRxRbL/nGH57Lbkixm3TKtVF413gMFMkWApTj0+pnxI8QprSejF6Vrre5f4CWPAf0b/M9tF2RQUvvzio+xlAKPwjwoeNDjhUx69vzq6veWX2HhzPVgHbbwHGejhvPbG1J3JAdbmBHdULqnGt/gdKN2NH+yEReSVJlATuaH/Ud1/UYWXHEZgkJ1cz88FQ8TMTwuZ8tc2FGbmBxfk6lBnREma0+9Yjbc9vF3teGTf6AV9e5o2FiyZLHvy41gdYM2k1CQPUegWyzN6e3L74tIcwIKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYEeEBUWQ7pVi/5cONRapUgnYozVHriILuKaiULbW5w=;
 b=dbWjjIWS9eFnxkO2PoB14oOgjqPmsHBWhQZcwVUKHurHqLj3I0WFppfDrs1IHbB4UoqAQCllkXU9eUldAegqW8foxyEHea5pBsqsCwapRCLBsuEcHDtOt/iMn8ZnZTM67GP94vMjHKz2LZx+ItMeqFM160zojdasQ/WTx1ck72Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Date: Thu, 27 Mar 2025 15:32:14 +0800
Message-ID: <20250327073214.158210-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327073214.158210-1-Jiqian.Chen@amd.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 497b1b5f-847b-43df-e616-08dd6d019fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kDTweUrhoNfUj7/yoXOQNc1G5QN7UYsu61aN3Eou22MFVKCOK2upOxm204H/?=
 =?us-ascii?Q?ynx+YpF/9aQ/uVcPmWMHs1uk0UzTfoG3fxpPPBEiWXylp6ytkwGfpWtyQ/cB?=
 =?us-ascii?Q?cx2GzGcPmRNyUv3A8xNhEZ3IFL7T9jwjM1oJS24xiWC/dfUAwI5br2Ompurm?=
 =?us-ascii?Q?mEZn5E48n3O869M0DuLHBNb1Pb4onxBrinF+mne3p0i6Jb/+YM+Z8frshCkR?=
 =?us-ascii?Q?nKrRA00FfZd2ZgxcYA6sWCtiQTDPnKd6RBl5dyJsQlKt2F+HboPdfSY2QOg9?=
 =?us-ascii?Q?2UHYiwiM84CUZMNVXSV8RNE9tas+yosl4e3fVx79mI8VATtqtIA9m8Mu30uL?=
 =?us-ascii?Q?w0+Yk7E09b1Lohd0D7DzFqmYVAWew3RMbwyn0C1G67+czRRwKjfOTGABJqF0?=
 =?us-ascii?Q?4FMLdLpUNjEScnVb3ANZcSHQJhC5/L3GA4HBQbdUDDBfjhyIolzcRRrPmPo1?=
 =?us-ascii?Q?c21MmUGQuw2Y9KELkalS6jbp3GP8poAG2au3+S3pi7jCPlPbcxwoeX9P0wuq?=
 =?us-ascii?Q?Zhida/QjE2YRf10Ssb1wEH8yk8LCxFk090u4VyOIY8Q6RO8BBObsB5GM98Uw?=
 =?us-ascii?Q?5xi2/cxF5z6Ue9TNo0cKPTGHjjR37+oIK3nR24LMzMU3S2hw8KmqZrKl2L4H?=
 =?us-ascii?Q?m7jg9nkOMUsme4ScIZaL8raS3IkX5q/Y89Dh12mgdguzhPBP70QYCAZus80E?=
 =?us-ascii?Q?IWbhaUwgr3HjhQb40xCcm7Uv5kx1C1akDvYN/xEdma7AEkEB4yYSRBUk21m0?=
 =?us-ascii?Q?B+RKB2CQitAd9Kg7B53A5p+9LRTzPTaG2/G7XC2merhW+4EH/kVCXveyrBcv?=
 =?us-ascii?Q?FXyEPYGw6kpzwck3bfnGHK2YgN1Mn1OA6pMNIuOcVUNRfmQsMdB0smksRHyz?=
 =?us-ascii?Q?d759eWtuwouhJ4T7swq18XOE5svEEbN0uuOdPSxIXIbJshawTzRhjVjILeFh?=
 =?us-ascii?Q?kQuGai/utScYXUvhPH3e9FUNTJoEv4w0hbqjnxXT3OEP6DPsm+uBS80/5LmY?=
 =?us-ascii?Q?PYiNUyoOB6p3NzP0Ga6lYLpCJ4ReikwnFe0DrB7ZTJ43WTMmQVX7mg/8P35R?=
 =?us-ascii?Q?R8UT4yBKKttsm3JzhjVzzqYU6KU/rB0a84GRZKC/b7IZR4UAA/Q26ZGgjMtc?=
 =?us-ascii?Q?B1MIDNPP5hPL1Rt192xMqANSIo7OB3x86+LP8EojSr1rWS46sOhaEsm82obK?=
 =?us-ascii?Q?vHKS4g5NPOfdVu5dCVPU73b9Pf5/mszAdll+IfNDh8WuIlHSM1n0RUQ5XuI9?=
 =?us-ascii?Q?5+3LqcgLAWkMb+88Lb/APIZaZuP9omnRVb2zLHxglVBGzgOmzJniVDjVNuSM?=
 =?us-ascii?Q?vDd57S9d9VHIjV8LUqpL0UW7jgwBHlcWysEJXc9r9cLbvM63hTqGhAOzKqR/?=
 =?us-ascii?Q?0RPYevTMsVJmn24RiNscA87N1C7QZXy2SP8uAr5jAywiANkUiKQZA1rnxMBk?=
 =?us-ascii?Q?T38YkxPrO3NQGhpsjmAHzj9KCkAKUiqy98eZVNCm+CQK6+Sz++yFEE3Ensvf?=
 =?us-ascii?Q?dL9eCYlGgSrSvQE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 07:33:10.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497b1b5f-847b-43df-e616-08dd6d019fe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128

When init_msi() fails, the new codes will try to hide MSI
capability, so it can't rely on vpci_deassign_device() to
remove all MSI related registers anymore, those registers
must be cleaned up in failure path of init_msi.

To do that, use a vpci_register array to record all MSI
registers and call vpci_remove_register() to remove registers.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/drivers/vpci/msi.c | 57 +++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 9d7a9fd8dba1..30ef97efb7b0 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -195,6 +195,9 @@ static void cf_check mask_write(
 
 static int cf_check init_msi(struct pci_dev *pdev)
 {
+    unsigned int offset;
+    unsigned int reg_index = 0;
+    struct vpci_register registers[VPCI_CAP_MAX_REGISTER];
     unsigned int pos = pdev->msi_pos;
     uint16_t control;
     int ret;
@@ -206,15 +209,13 @@ static int cf_check init_msi(struct pci_dev *pdev)
     if ( !pdev->vpci->msi )
         return -ENOMEM;
 
+    offset = msi_control_reg(pos);
     ret = vpci_add_register(pdev->vpci, control_read, control_write,
-                            msi_control_reg(pos), 2, pdev->vpci->msi);
+                            offset, 2, pdev->vpci->msi);
     if ( ret )
-        /*
-         * NB: there's no need to free the msi struct or remove the register
-         * handlers form the config space, the caller will take care of the
-         * cleanup.
-         */
-        return ret;
+        goto fail;
+    registers[reg_index].offset = offset;
+    registers[reg_index++].size = 2;
 
     /* Get the maximum number of vectors the device supports. */
     control = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
@@ -234,33 +235,42 @@ static int cf_check init_msi(struct pci_dev *pdev)
     pdev->vpci->msi->address64 = is_64bit_address(control);
     pdev->vpci->msi->masking = is_mask_bit_support(control);
 
+    offset = msi_lower_address_reg(pos);
     ret = vpci_add_register(pdev->vpci, address_read, address_write,
-                            msi_lower_address_reg(pos), 4, pdev->vpci->msi);
+                            offset, 4, pdev->vpci->msi);
     if ( ret )
-        return ret;
+        goto fail;
+    registers[reg_index].offset = offset;
+    registers[reg_index++].size = 4;
 
+    offset = msi_data_reg(pos, pdev->vpci->msi->address64);
     ret = vpci_add_register(pdev->vpci, data_read, data_write,
-                            msi_data_reg(pos, pdev->vpci->msi->address64), 2,
-                            pdev->vpci->msi);
+                            offset, 2, pdev->vpci->msi);
     if ( ret )
-        return ret;
+        goto fail;
+    registers[reg_index].offset = offset;
+    registers[reg_index++].size = 2;
 
     if ( pdev->vpci->msi->address64 )
     {
+        offset = msi_upper_address_reg(pos);
         ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
-                                msi_upper_address_reg(pos), 4, pdev->vpci->msi);
+                                offset, 4, pdev->vpci->msi);
         if ( ret )
-            return ret;
+            goto fail;
+        registers[reg_index].offset = offset;
+        registers[reg_index++].size = 4;
     }
 
     if ( pdev->vpci->msi->masking )
     {
+        offset = msi_mask_bits_reg(pos, pdev->vpci->msi->address64);
         ret = vpci_add_register(pdev->vpci, mask_read, mask_write,
-                                msi_mask_bits_reg(pos,
-                                                  pdev->vpci->msi->address64),
-                                4, pdev->vpci->msi);
+                                offset, 4, pdev->vpci->msi);
         if ( ret )
-            return ret;
+            goto fail;
+        registers[reg_index].offset = offset;
+        registers[reg_index++].size = 4;
         /*
          * FIXME: do not add any handler for the pending bits for the hardware
          * domain, which means direct access. This will be revisited when
@@ -269,6 +279,17 @@ static int cf_check init_msi(struct pci_dev *pdev)
     }
 
     return 0;
+
+ fail:
+    for ( unsigned int i = 0; i < reg_index; i++ )
+        if ( vpci_remove_register(pdev->vpci,
+                                  registers[i].offset,
+                                  registers[i].size) )
+            continue;
+    xfree(pdev->vpci->msi);
+    pdev->vpci->msi = NULL;
+
+    return ret;
 }
 REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, VPCI_PRIORITY_LOW);
 
-- 
2.34.1


