Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF69A81D6A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943390.1342205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCe-0005d5-NE; Wed, 09 Apr 2025 06:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943390.1342205; Wed, 09 Apr 2025 06:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCe-0005YO-BE; Wed, 09 Apr 2025 06:46:28 +0000
Received: by outflank-mailman (input) for mailman id 943390;
 Wed, 09 Apr 2025 06:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCc-0004jx-Dk
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20623.outbound.protection.outlook.com
 [2a01:111:f403:2405::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a5ebc31-150e-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:46:24 +0200 (CEST)
Received: from BN9P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::32)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 06:46:21 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::12) by BN9P220CA0027.outlook.office365.com
 (2603:10b6:408:13e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 06:46:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:17 -0500
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
X-Inumbo-ID: 5a5ebc31-150e-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzQFwHKRF0Mlqc+zjTMkmp3v3FjDmMKYiL3EU9m3SmLTHyHiz4A9lnBAaRs7n5SJzCCQ2EV2r7hDnMXGT0ttz9xseiXTAmm1qZ4JuqyYhlLiUcX9UFg3oYBOUoMB87D5kMOwxd2LN8kUvE6Cgt2OyG9cUlatx85BoXBujNwbLyX3lxQxQP1gMcVPcd6hmzOnIJuxdjsXSXfG+Ox9trD8ar2r6xIKWfKF+yu8AFJWK76bomYegdQjYyWrQHLbCo1D7ikikFnEWCgtVfb7lVnIyXrjIJC16ixmWcfZkeoh8iU5HFobvMSJ/XP3xilpNUNSyYIVRNgKe6yz/4Svi/loGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0p34/jpXG5FC1Q0PYSnU3Xkg8VviJxZCXtcGrEqUC8=;
 b=OcvorMZWBS0dOMgOVj/P8HJeX3ujt4dUFAzmKQvckCe6DwbYqrkJW2oJc8wpPJV1UcJ5f0GIgucwzEzIekuGtQUfygkChzbmMk/DLHYpK0ze6U833/r/0YT6PY9qo6ribI3vXlwsvWnGsRI04IHm67rrJJgYMiZ39P8+t7nF+3ePDjI28dBkwCAolG6/eLwwybzGvxtn4++dl4sZRv5JzUfOk5Z/B/KI+V9hcQXJ4Eaj7kcs1f3KBbgYFDdkwcXv2G4NdJCkwruK/A5myj5TV68BBmUo8GO0lxFRHRs6zaKB0MhJ7hHmpwidf8PY16ADhwqM0dgLVGgpKU0+Bh05mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0p34/jpXG5FC1Q0PYSnU3Xkg8VviJxZCXtcGrEqUC8=;
 b=JhqctnH9sb5JL0icFBsFsqNUYP0m6vpYXZDH/HWxV9+qzsG8cW2KiDSF2V9yRDLA2JWvBWevt46zKeu3HWizIwiQBJ0yYopK88yuGRdHY2CDIQEo+n6vZZk3SJso9Bbm+TbMYgyTib+AG/hwYVwya3CxgC9iNkJrRKNU8QjKjoQ=
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
Subject: [PATCH v2 7/8] vpci/msi: Free MSI resources when init_msi() fails
Date: Wed, 9 Apr 2025 14:45:27 +0800
Message-ID: <20250409064528.405573-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MN2PR12MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b59b37-7a9a-4c6f-04ee-08dd77323ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alNNbDRGV0RyRjBCU09ETU54WVlBQVdGdEdDMWlaT0dySlZ6S040RHFEdnhr?=
 =?utf-8?B?Y2wwV2FoYmVlTDg4bEc1WER1cm10NVlUM1VHVXVXTVQ1aS9yaUlnYndYSGNU?=
 =?utf-8?B?Z1I1VTRiWDJDMmtuTDc4TzEydUkxNngvM2NIWVoyVU9TcmxDS08rU2wxRGZ0?=
 =?utf-8?B?U2dZU21zNzBmUjhMN0pyL3J5bFZrdkgrUU5XcU0vak1GWHEzQjhFeVR4dThI?=
 =?utf-8?B?R2N0UlFrUmdSOHA2aDBMdXFaVWdCYVVuNlZpeVU3cTMwU0V0R3FZRDN3eTUv?=
 =?utf-8?B?Ym1INit6SUo0L3dvNEhsK0xiWUp5K2t1ZjRxY0VKUTdmZEYwUjR6Y1F2UUc0?=
 =?utf-8?B?dU8rZFJsZjdNcytrKzlDNHNXbVFXRCsrSjVGRHVIbVdLWFlkRHVWZ2pjQ3gr?=
 =?utf-8?B?UzVVT3I1cFY1TUxTTUhkWmQ5dmV3TnRRSVYvbUtEczgxK2NWb253U0ZTR09v?=
 =?utf-8?B?eS82c1VFeGxCRGpzTWtZNktPNXF3NFJJcHJRbEx5dzhCSGFEdUV4SjZrU1k0?=
 =?utf-8?B?bHRVMkRySzdXZlBSNUNyaHMxQ1B2Q3lnZjJkd2IvTkNINWduU2pFTkN5Z0xW?=
 =?utf-8?B?SHNIRWJLVU1obUtxb0RQMlFOUUtsS1VNbHJIN1owaHVJWVJCZk0ybU5POFRx?=
 =?utf-8?B?MjVBYXNIeGZKYVlCaVUrZkFYUmhTUk5vT3NTc2dyZnhuOXNOQ20wTTlGOXdn?=
 =?utf-8?B?Y0pOUm42R2FHTmZncUc1QUViQ2srNmh2VWdpSkhLZ3ZlVzB3YXRqL2NxWTZp?=
 =?utf-8?B?TGtZUVpqR0JvWU1WS0JRditQZWFLUjRySzE4TjFtMjNjSUVFbm9IT1JKeW0r?=
 =?utf-8?B?bFpVaEk3MHBJeTI2UHc5Q0VDamdsNWNNS09namxncmR6SDRoTTZJWUYrWVZM?=
 =?utf-8?B?WXNNMk0wSFpPVGl0eFFnN3VUQStPVmVReDM0NmVTdzkzZDM3cno3bU4rcERh?=
 =?utf-8?B?SHlVZXBERkxvUkJVTGlTOXdJczJxSkJZeC9zR2F5d0VVeUMvTnZQNDg4Z2V3?=
 =?utf-8?B?blhTam45MFpGY1ppdHFiNEswZ0lZNC9OYnd3Vmc3cnZCM1BEN1FBUGVrbU1C?=
 =?utf-8?B?eE41UWdaVWgyR3p2bjhUci83TmR3RGw5bVFjS2FPWXNVU3dhdUk5VTdGck5Z?=
 =?utf-8?B?bnRrSS9wOFMzeVRnYlFRV2xXNXV5T1pnS29iUkdzRHN2NFFPcjQ0UzF3NUZr?=
 =?utf-8?B?ZzF5K2JGT2lTVHhwQkNjUStyZ2NlMEZadjNxdG5Ec3dPQ0NQQmcrNlR3all2?=
 =?utf-8?B?TThKSU9Bb3BJRzlBSmlPRCtFOUtUNW1MdWNEd0kzdWtQWGxtd2huUS9Md0Yr?=
 =?utf-8?B?d2xhVGhpa3hhelBVZ0VTVUwzei9KMGVFcDhKcUIvSS9WY0RFT29QS1EwWFBi?=
 =?utf-8?B?UlpDWjY4cWdXK3h5SlM5RVh3c082TGFwK3VuN200LzNYcWYyekZ5ejFpQjY5?=
 =?utf-8?B?YWRPWGNxVDVaT2NKUjdZUEVYdUM5NmhLUjBuMnNsZlU0WkFOdlo3eEx4YkhH?=
 =?utf-8?B?ZnBBdzVaU2VHaVBVTUY4Qjhvc1FhSXFCS0JRNnQwbnhpUmo5QkdQUkl6aWxl?=
 =?utf-8?B?V1hwM1NFMmt5a2hFSUVlaTBjQ0k4R0p2L0tyRDRnN1ZCSzhHczFuL2NFaEpr?=
 =?utf-8?B?eHhhZUEvN3JqdXgyWC9rbUFLZVF4WjhkZER6Vm92a3pmKzdTU0hTdUZoVDV6?=
 =?utf-8?B?bS9DZTF4enMyY1Y0VjdQOHM1TXBIT0tPMDlQY0FaK1JuQjA1aFk1aDViOFFO?=
 =?utf-8?B?dUNpZUNPRlRWSVZzS0dHZzMxZFA4MkF2c0RCTm1ncHlqV0M4U1g4U3VzK0dQ?=
 =?utf-8?B?ejNZOXJOa2szZSthUXBqMTVTZ3dnZEVoaGx2K0ZsS1pFUmpmNU96aGRpcVNl?=
 =?utf-8?B?RXRnQ3RxVlo1Uml2RndoWnBWeDlyb0Ria2lRWTN2Q2pwVnBSRjBrZTVZZGty?=
 =?utf-8?B?QmhUb05kNXNLTkc3MzFXZXpxTE54REo5a3dZU3FpQ2JaR01OeFU2T0VWTzlz?=
 =?utf-8?B?QU5LVUI1Qko3eXZKbEJ6V3RXVE1rckVJV0dIWHJuSnA3WndndFpCdmtLR3JM?=
 =?utf-8?Q?8MNq/X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:20.9590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b59b37-7a9a-4c6f-04ee-08dd77323ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222

When init_msi() fails, the previous new changes will hide MSI
capability, it can't rely on vpci_deassign_device() to remove
all MSI related resources anymore, those resources must be
cleaned up in failure path of init_msi.

To do that, add a new function to free MSI resources.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.
---
 xen/drivers/vpci/msi.c | 47 +++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index ca89ae9b9c22..48a466dba0ef 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,33 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+/* 12 is size of MSI structure for 32-bit Message Address without PVM */
+#define MSI_STRUCTURE_SIZE_32 12
+
+static void fini_msi(struct pci_dev *pdev)
+{
+    unsigned int size = MSI_STRUCTURE_SIZE_32;
+
+    if ( !pdev->vpci->msi )
+        return;
+
+    if ( pdev->vpci->msi->address64 )
+        size += 4;
+    if ( pdev->vpci->msi->masking )
+        size += 4;
+
+    /*
+     * Remove all possible registered registers except capability ID
+     * register and next capability pointer register, which will be
+     * removed in mask function.
+     */
+    vpci_remove_registers(pdev->vpci,
+                          msi_control_reg(pdev->msi_pos),
+                          size - PCI_MSI_FLAGS);
+    xfree(pdev->vpci->msi);
+    pdev->vpci->msi = NULL;
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -209,12 +236,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
     ret = vpci_add_register(pdev->vpci, control_read, control_write,
                             msi_control_reg(pos), 2, pdev->vpci->msi);
     if ( ret )
-        /*
-         * NB: there's no need to free the msi struct or remove the register
-         * handlers form the config space, the caller will take care of the
-         * cleanup.
-         */
-        return ret;
+        goto fail;
 
     /* Get the maximum number of vectors the device supports. */
     control = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
@@ -237,20 +259,20 @@ static int cf_check init_msi(struct pci_dev *pdev)
     ret = vpci_add_register(pdev->vpci, address_read, address_write,
                             msi_lower_address_reg(pos), 4, pdev->vpci->msi);
     if ( ret )
-        return ret;
+        goto fail;
 
     ret = vpci_add_register(pdev->vpci, data_read, data_write,
                             msi_data_reg(pos, pdev->vpci->msi->address64), 2,
                             pdev->vpci->msi);
     if ( ret )
-        return ret;
+        goto fail;
 
     if ( pdev->vpci->msi->address64 )
     {
         ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
                                 msi_upper_address_reg(pos), 4, pdev->vpci->msi);
         if ( ret )
-            return ret;
+            goto fail;
     }
 
     if ( pdev->vpci->msi->masking )
@@ -260,7 +282,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
                                                   pdev->vpci->msi->address64),
                                 4, pdev->vpci->msi);
         if ( ret )
-            return ret;
+            goto fail;
         /*
          * FIXME: do not add any handler for the pending bits for the hardware
          * domain, which means direct access. This will be revisited when
@@ -269,6 +291,11 @@ static int cf_check init_msi(struct pci_dev *pdev)
     }
 
     return 0;
+
+ fail:
+    fini_msi(pdev);
+
+    return ret;
 }
 REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi);
 
-- 
2.34.1


