Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20462A94C82
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960846.1352575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVQ-0007TL-3J; Mon, 21 Apr 2025 06:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960846.1352575; Mon, 21 Apr 2025 06:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVP-0007RV-Ve; Mon, 21 Apr 2025 06:19:47 +0000
Received: by outflank-mailman (input) for mailman id 960846;
 Mon, 21 Apr 2025 06:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVO-00057v-Mj
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e32d6e1-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:46 +0200 (CEST)
Received: from MW4PR04CA0377.namprd04.prod.outlook.com (2603:10b6:303:81::22)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:19:42 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:81:cafe::1b) by MW4PR04CA0377.outlook.office365.com
 (2603:10b6:303:81::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 06:19:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:38 -0500
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
X-Inumbo-ID: 9e32d6e1-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3GbvFWV3T9sbOndCdAGYgCAvTEFxxs4bZGA9p8oLrb+l79UO7dEMS0mmA8qHpcMdMDIGsxlqfNWnhXiGDh1sSDiYCSAvwdcEtI6392rA6QK+MGr+5qVrjvyPTFBkYSxBfrF+inNKEWuCulIlDSXJ557/x7fsrJAb7G4Hb3OeCl0USt2Wyj1sNr9eL+YSplQpFMU7dB4oCQnSGSJ255lvTJ1JPPRGzzHzbAEWeOKwy/M1kg1d7fcELlBG7g08ju1UvR/6qwp7SPoMDLS4LfKAPWVzrT3lACZJLjbl8Uou9mmYfYh8Tw2PN5m0g3SmesvdrT5ZgqDH7p3Z60QpuiDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbhJV+X4QM6DUMRC6Mk8VHfG8AJ7SeVNQi3bNQIZl1M=;
 b=VzCtQcUJ0o37Hg9XcIRfv5HJokUGDAABEhA3S0FqaE3KkJnAVycg0t/k9E4PG6Q9HP1/xJj40VTZ9xas6NPmbDJ+jXncGyMfT+hOzcESX+40Hc+vhc6I64JPZXsG31lg/xI7yjSTXkhAQQbyukxdrTqQGE9TC8keYIk2fLXr67w2xfDn8GI//zqFSkxjk34iQb2fRpAJ/D+Wh3N2GrV+WwqAJfrJrWhndOYalWvL46s/iPE/hM7P90XFATSIRXOdd+Tu5Nv8ZYesqwpvNDzd4JuU9YI2kgVE8OGITN/bhby1Ql5w/p/U5Zu5lyJnEbHip04/WWmp+QxWcginRXGhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbhJV+X4QM6DUMRC6Mk8VHfG8AJ7SeVNQi3bNQIZl1M=;
 b=KcrUkQle6LayMDuScY75fn9wkM3Xm9BrHnCce/3h2W64Yg77IZ2/QER6Oi0q0LT/nvVNRNUmP7OnpFLPbIv9dB5uLQYFd3Ib7JLE/iODBM58VhCuZ28HLdtKynJABkxtxK4y7l+F7XJQtUuu1UstSalMtokXHAhJ5SRhaA/hw4E=
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
Subject: [PATCH v3 10/11] vpci/msi: Free MSI resources when init_msi() fails
Date: Mon, 21 Apr 2025 14:19:02 +0800
Message-ID: <20250421061903.1542652-11-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: aa267d89-12fd-4895-a6ff-08dd809c8054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzlzQVJ4VlA1eTZ0dXpRSVBZM1ovSE1aODU4N2JuNEdXVkNLQmxhUGtvQnRQ?=
 =?utf-8?B?Zk43aWF4U0t5VStWV3lPckJzVlI2dnhUUHc3NzBPbjVwSVBCMUVRZWVVNG9w?=
 =?utf-8?B?dmttbCswKzZTU0ZreTRBZTVhV2RRWGU0bzc4VTEzQ2t4VGlBV2xhZlBHUWV3?=
 =?utf-8?B?ZTZ1YllCbXM0SGEveDRKczMwRWNaRFF1Sm1pakZFdnhKNzEvOEtGQ29sZmxI?=
 =?utf-8?B?UXJ6Nnd0aGxlQjVnaDBITVhKbm5xbDduVk1lR1JmYkptN1RHRjkwZStJUmM0?=
 =?utf-8?B?T0RkcVpoZFY1dEdtRngrSzYxaG5CUERqdnNUOG1EdFNTcXh4alRXWHR6UmVM?=
 =?utf-8?B?M2dZdzN0dFJzNHVkWE9TZVB4N1dCSGExUjlPVy8vMTJoV01FbEp6U0dFc1Er?=
 =?utf-8?B?THRxWHFKcjBVNmw5dmY4NkZBSkg5cWNtQWtCR0pXNVN2d0RteVRMY1ZOSmpW?=
 =?utf-8?B?SmNrMXF3b0FJRjRtWWcxZDVLYWMzOUFYT2IrUytldWV3dnJBYXRpUFBSdkNz?=
 =?utf-8?B?bi90T25UQXBtcldWMXdIK3RaeUsrQ2gzcmJkcWJXTTJTY2lIYklYWEc4MDJa?=
 =?utf-8?B?VEVEaVJGUXRFMzkxcVJPZlFQbUsvREtIb3lUMEE4S25sbmVCbG5uNVdNSDZw?=
 =?utf-8?B?eUszaHkwY1pwcEJOOUJUM3Rhd1R6MDlJSm91NG1ZdzRIS09kZk1GZlRvdmhy?=
 =?utf-8?B?YW5pNllxdkxiczhiK0ZvSWlJZjdpMUduTzhXMDlmT0x1ZlFySElvVkpkMTlC?=
 =?utf-8?B?Mm1VOHh2UVJOdzAxdDhGbEJkU3lVT1ZYYWQ1VnZTcU9rZXBzcGNSdGgyMmc0?=
 =?utf-8?B?OFB4alBMeWN3WVBJZDd4K0pjL1puYmpXYVBOUm5QRGVTdC95NWhqVGxQUGZv?=
 =?utf-8?B?ckJCajVXNkl2RlJnUWliejhyNFF2MTNHeUVML0pZaUhCRURNOVhQdllhSFBN?=
 =?utf-8?B?c3JReTJIR1NVSG40TjBuRjV1SjhRNWlrcFc4WGhzWUxNUXZNVjV4LzRHTWF4?=
 =?utf-8?B?Z0xudzVMbjNrb3kwZHg2T0g2dDZUcHdGZi91N0FSMkxXMnpTZG0wdUdhbFNL?=
 =?utf-8?B?TU1HeUw2VmRtWWJDKzdGZGFmMzgzYnVIY3BDUG55VWtBMjdvcGdqVmN1dlFT?=
 =?utf-8?B?Q3QxbmNxdkpaWkpTWERyaXdTM3ZQcnppVjNyWkVHKzFkV0JtcXVRcXEwNG1m?=
 =?utf-8?B?bWN5OU50Ky9zcG1lekVWM3cwTmRVSjRyMlN5cmVxT3Z5eFdtOHZCU2FxWHdV?=
 =?utf-8?B?WGpkTkJlTTVCbWJmV0wrQzAxTHloQWpMNUVEcXI0dnlTZzQ4Nzg4KytDeDBr?=
 =?utf-8?B?K3NJSFR4WEY5MGpxejNXNTR5SURVWXF5dTJ6SnJTRW4rTUVwNGNnL3pXdW05?=
 =?utf-8?B?MDZ0KzJ5KzZ5ejFTNlFKYmg0UVNXZmcxeDBJanl4bzF6azM2ajlrbitqemRB?=
 =?utf-8?B?Vk90QjNTK2I4eXU4S2ovYzZNNnBQY0dXeTdOeldRVUZuU3dYd0llb2pKdzRm?=
 =?utf-8?B?T0RrL0JQVE1zcUdBT1lCb3F3MmtZSnBCSGo2NjVMYkZ6TFhIak16STZESS9J?=
 =?utf-8?B?WVo0eGpKUWdpblZwQVRjVCtSbi9MbHEvcjU2R1lEUXMrSHNLODBISVoxYktG?=
 =?utf-8?B?MWNUVlBjRytmbG5MYnlZV2EvNUYzU1lwbkRtMmJTbUkwRGxzd0RJWkNLdW5m?=
 =?utf-8?B?aTdRL0JERHZYUzJENmtnbEtGYkxhZlhRWXhIK3IwZlY4TlpEZ2x0d0hTSHJx?=
 =?utf-8?B?Z1ZmbHdNUXoya3N2NFZ2V05nYWhaWUdycUVEa0RyazhEZ3hJOUhKT21sRlc1?=
 =?utf-8?B?WEhIQXR6OUZUMmdUdk1KVEN5NTZjSWtvbFhpUzgxN2lFTWl5SmVzL21pWm0v?=
 =?utf-8?B?aFhTSERUWUxpVVNGTjZHcm5SRWNZWnZXcXE5aXN3QnRZdndFMDNkYTRVRDJ2?=
 =?utf-8?B?N1VqTk5zRklQdm5FYVdYWE5hdWw0MS9nNkFoNzFNTWl0a29DNDZ6MUFnSkFR?=
 =?utf-8?B?R1ZhVUR6RUo2NUs5OHVVQ2I3Q2hRdDVPNnhSMFAxRjNLWFp3Tm5MbzI5Sjg0?=
 =?utf-8?Q?c4hACN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:41.1356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa267d89-12fd-4895-a6ff-08dd809c8054
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569

When init_msi() fails, the previous new changes will hide MSI
capability, it can't rely on vpci_deassign_device() to remove
all MSI related resources anymore, those resources must be
cleaned up in failure path of init_msi.

To do that, add a new function to free MSI resources.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index ea7dc0c060ea..18b06b789827 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,32 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static void fini_msi(struct pci_dev *pdev)
+{
+    unsigned int end, size;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+
+    if ( !msi_pos || !vpci->msi )
+        return;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    size = end - msi_control_reg(msi_pos);
+
+    /*
+     * Remove all possible registered registers except capability ID
+     * register if guest and next capability pointer register, which
+     * will be removed in mask function.
+     */
+    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
+    xfree(vpci->msi);
+    vpci->msi = NULL;
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -270,7 +296,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, fini_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


