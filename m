Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B66AC3D2F
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997352.1378316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPp-00062W-Re; Mon, 26 May 2025 09:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997352.1378316; Mon, 26 May 2025 09:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPp-0005wE-Jn; Mon, 26 May 2025 09:46:41 +0000
Received: by outflank-mailman (input) for mailman id 997352;
 Mon, 26 May 2025 09:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPn-0003hH-48
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5091a631-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:37 +0200 (CEST)
Received: from BL1PR13CA0181.namprd13.prod.outlook.com (2603:10b6:208:2be::6)
 by IA0PR12MB8279.namprd12.prod.outlook.com (2603:10b6:208:40c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 09:46:33 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::6c) by BL1PR13CA0181.outlook.office365.com
 (2603:10b6:208:2be::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 09:46:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:33 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:31 -0500
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
X-Inumbo-ID: 5091a631-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq1kJrnr/fvzqqisowZKymlNS2/GoPbzezudxgpFD+jNGFvd5rNS3Wxow27lLS9wc9gfVTsrz1y6c1URbpRwCxb71yiCqKdAOJAhB7j6VMfeDWmsH/VmFjmYcMy6SzuomsR6/9r+a83EfBzF2vpyjxrCtXYf4/Zfd02XO+BT/2hZ5OymQtAOoz4bmW3b6perZV9To7EbQKHEjzZ2vkJN/6FSxwV6NQkT5m/+GX67LwKVyFQcc58FRVv3fgK6H5e9dyJgaJQF8wHXlEzS6a/IgWrsTNEIfKuL3lyUBkCmgBYz14zBuIvizMLyIVBgu1fI5Lk5qEt4ShKu8BawykXxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aE/xhQc1ScjD8FKImKyyPi2cNcNucokrC3sZcN9VTw=;
 b=KEBZOc7AOiLriDlJPOLVXx7f5wfrWHX7/kSI5t7WHx+EqyJUr8OkxuMc33WXGi2xngMuPz4OlmOwZrC917EtJnnV0zVJNLpaxNL9hGXXI7stTjEJkMMvsxx0NNzYRfnAxr919CFS7pcA5yOTKnYPcR5D0el6sUC5SCtVizTUFV1OjWE37lPE+NYG3846zlh+WOmVMHBB0FqSduj0kQVgZZYGUoIANKo4c+KBkE2oVK8PkK6qcGYEUJR7Mtj73ERgPe6fa8oPBdjlHUnKmbIHv+D8xjy1Uc3BrwZlEocXqgjHHSctxFID+Ek1ob2PSbLk0Xy/a8plDh4fp1z44dUSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aE/xhQc1ScjD8FKImKyyPi2cNcNucokrC3sZcN9VTw=;
 b=cIakaQFL8jpEI8ibgtzEkWtOy0QBXReimvA6eU6NJ6Lcgu12y716Z5y4EOFz//IcsG8vm6p43fsRWxwud1ZwsdArpbB/rKX5nLZS9SgZOB6hlnlvzhdevCYRc11GKj1uvyuV7IHDK09Anjkwgkk29Ba3oJXz/foGL4KFYYcKyy0=
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
Subject: [PATCH v5 09/10] vpci/msi: Free MSI resources when init_msi() fails
Date: Mon, 26 May 2025 17:45:58 +0800
Message-ID: <20250526094559.140423-10-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA0PR12MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 135ec16f-577d-4648-bb7b-08dd9c3a3317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlJqa0F3T0pnYXBPRDdtajdOeUsxRUpnRjBCekVzTmo2cks2UEVjUFlQcmtr?=
 =?utf-8?B?SWw1QmdEcTMxWGZiU2JkMG5RYlp6c2FSOFVvWFMwNktiUGxXM0JEaFA4R0xZ?=
 =?utf-8?B?aUd3Zk1BNWEzc1ZNbUl2ZFc2anlKRnBFaFlISmpFR1lycnZYK0wrZUNLcXRX?=
 =?utf-8?B?N2MzZDdlY213ZFQ4eE4rOVIvSkNXN1ZMLzAxQ2tkY3p0eW56K2dDZ1NKMTV4?=
 =?utf-8?B?VnBOV2lKK056dGZDaWZlRWIyUW9BVnFLendRSm11OXQzb254Q1NLeEVGeHNr?=
 =?utf-8?B?eUczVExacXE2MXltVkVvVkpXeDdLOEFuQmdKeGl3NnZxU2hOYmwwSkg1R2p1?=
 =?utf-8?B?SjBjZjQrRzQ2VFlmY0ZjeVpMSHpGYmtSWG9jalNOWTQwVW9BaExRVGZxUEUy?=
 =?utf-8?B?dXJHZDE2emdFR0dxRWg1aStZaEhzUERmQUluUzJIcUhsUjcxWVJqbzE2TWRS?=
 =?utf-8?B?OE13R0dxQWF4T0hqZ2dMU2wvQ0hibFVDdzVjU0NyRHh1K0lZVCtTKzA2TFBk?=
 =?utf-8?B?SGVxcXdNKzh3eHgxWXQwa2ZqM3RnTFpVQU9sQ2tGNjdKTGFpZE5aQUI4U1dh?=
 =?utf-8?B?ZGJ4OE5XV01jL1hvZG5vNXAwb0lKZGRiclFRNUYyb1VmdVRNTm1aa0NrSHBR?=
 =?utf-8?B?b3NiV3hkRHNZL2hKdzcvaWp5cDdBN1ZacUJTcGpsakVSS1crbFp6b0RFU1JG?=
 =?utf-8?B?MFk2OWlZSm5wTHI0ekhPbmxJblNVeWZKajYyT3JUdC9IN0xtZHBxSmhpcXcy?=
 =?utf-8?B?YUw5OWFrWVQxdzBDa2RLVUhrTldyU3Zwek9PdnZsd2o2OVB3b3E5WnZiT3JX?=
 =?utf-8?B?OGxZWjgva1MrRFVJQVVROUc0c2pnMDhRWm4rNnhRclF3dXBVcmMxVjFMVk4v?=
 =?utf-8?B?S2lqdmpzRkF3dU9LMDBHWldQWWhQWFkzMzFJSkpSZHRaMHRRNHlMNVFoNTZP?=
 =?utf-8?B?YVRHdlFZSVRTN0FTdFY5WlBuZWh6VmZjcDFjQzFxM211YVh4bTF6d2hqYWh2?=
 =?utf-8?B?UHRBRWVOOVhLR0dNM1FyajlPYTVJYjNocys0QWJDNFZ4NE9RNDc1VkFxV3F1?=
 =?utf-8?B?Z3d1TldzNG1DdmF3WDFUWFlIUVEwZ051NGFxR2FTVHlWWisyTS9ndzVzN01y?=
 =?utf-8?B?aGwxV0daL3U4aXJPUDZ0MG9jaFY5Z3RZQi9XeWJKVU1TMUorT0grQUh5TFlT?=
 =?utf-8?B?VjJCNGlRRDFMYkV1NXZqdGorZjhGWlZUS0NoMUU2anBTTTI4eFlxMUpKUi9Z?=
 =?utf-8?B?TEVEb25LbFUxdFJEaGNsQVBzc2V2U2I5NWFzTEZHWXJTUG1GOENpbDMwYU42?=
 =?utf-8?B?c2Jud1ErQTFsNlBsZ3B5UFlsZlU4Q3F4cnJhNDlTcjFzbUdEZ3hyanA5Ykxl?=
 =?utf-8?B?SlZvd25za1dBMzc3RjFMUzA4OVd6UUJiWDMyc0NMY2orU3g4cjk5RGNRT3Vj?=
 =?utf-8?B?WjlpOE83blhVRE9qTWNqLzY3dTI0eForWE83Y1M3c1J1N3dHK3AvR0UwZTY5?=
 =?utf-8?B?cGo3RkVGN0Q1OUFFODN5TmZPR1VoemJLdkNSbVQ2Q0xIcEFFRStKZTB4ZTZ2?=
 =?utf-8?B?eVREZnR6WXdrS0w4MDZQd1NWcnk4NHNPT05FVnFqME8yTjRvQktNM2RydzZp?=
 =?utf-8?B?ZTJLU1NuZ3NZMzg0ejNLTm5reUlqRUZBY2J5VmhqUUp6RTlCQ0pwMUVxa1FP?=
 =?utf-8?B?dU1yVVhEeHZiUUdaYUJ0VHZVdUpHbkFDVnNvc0lTZEtoNmJxLzB0cG1ZL21p?=
 =?utf-8?B?VFB3emk4bkh1aEtDQVVTaEUydkYvTWIvRi9ISXFsTFY0a3g1SFRVVlh4UVVW?=
 =?utf-8?B?eEpCS2pGQk9ReHA4YmdpVXlDemg5Qm00NkRwcFpyRG04TmdQVnFSYkJUMXFn?=
 =?utf-8?B?VHFTU0FXbURvYmZmbEhvQng0ZDhpK2Eyc3NCY29tTFhsbHcxaDBrcllFdmxu?=
 =?utf-8?B?UG0rNkh2bzF2Z3I5bU53U1pLSjRMOXFXeTkvdFFxVjhZT0Nvd1hSbTRwdWFW?=
 =?utf-8?B?ODBPbXphVExGRHVucWdURms1U09yUEowOXJvaUNEMXljL29QZU02K3pNbGJp?=
 =?utf-8?Q?dNDChj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:33.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135ec16f-577d-4648-bb7b-08dd9c3a3317
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8279

When init_msi() fails, current logic return fail and free MSI-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSI capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSI.

To do that, implement cleanup function for MSI.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v4->v5 changes:
* Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi" since cleanup hook is changed to be int.
* Add a read-only register for MSI Control Register in the end of cleanup_msi.

v3->v4 changes:
* Change function name from fini_msi() to cleanup_msi().
* Remove unnecessary comment.
* Change to use XFREE to free vpci->msi.

v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 2d45c7867de7..4e106c39efae 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,33 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(struct pci_dev *pdev)
+{
+    int rc;
+    unsigned int end, size;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !msi_pos || !vpci->msi )
+        return 0;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    size = end - ctrl;
+
+    rc = vpci_remove_registers(vpci, ctrl, size);
+    if ( rc )
+        return rc;
+
+    XFREE(vpci->msi);
+
+    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -270,7 +297,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


