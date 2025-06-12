Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57348AD6C2F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012641.1391167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGP-0000u4-7m; Thu, 12 Jun 2025 09:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012641.1391167; Thu, 12 Jun 2025 09:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGP-0000ro-0b; Thu, 12 Jun 2025 09:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1012641;
 Thu, 12 Jun 2025 09:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGN-00081C-Av
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6bf5618-476f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 11:30:13 +0200 (CEST)
Received: from SJ0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:33a::26)
 by CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 12 Jun
 2025 09:30:16 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::fc) by SJ0PR03CA0021.outlook.office365.com
 (2603:10b6:a03:33a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 12 Jun 2025 09:30:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:14 -0500
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
X-Inumbo-ID: d6bf5618-476f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jd/vv5RRop1XO7UZ935/xi0DelOUWyjLztjNvDsi9Y3KxGbjalouUZXmFtuHatxqvaProZOb2DJPfqok+MyMtk56V9vuEWuZ8YjaK4gRLzb03hPzLeUrIN5Ewa/vcTGj1EyBJvxUCJAT90kHw2LK80NKqriPMJWWZRQscqR9z/Vwhfh9rqtZZyhTlb93a+9DiAfzFCs2VlE+vSCNOsbk2b46W8PG/m2FHVOXWR2vnPZqDkuAInIAfPOBlvOepCHgeyY9uQQulwZvQ164B/yA6Uv/neLnHbeMS6pJx1RUM0od9GwGIjxgjLaHnJaVUl4SgSLDETasVzcIh5uaJXGgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59MmMTpM4utVui9VClobGLCu61L2IzOwfewPcUNRBbw=;
 b=DVytAvnyWahKFXXk9/uTuWWuNIARbvO+I79gGQ+wl1ywSux09WS67ozOku4u2RM/qiIREaKpCpl4kQAynnFO5S7lECYoK8NZbMMrJ509BadQolx6+ry1QnhpuPOwBL9UxRnstNSk2RQ+CX/eIa+dB3ihvEiOM7g1rNAEaMAtioGX0TpwpqVWPk2wH/kqhgeYitBLtxbn/07cVv+9TTOqluY5iebARPJBoOfER+DSYLoLO64qaqIK23lN/ipN0/wpqp4xS3vQVTsmHu6+hCqiOfBDnvVRU2RmHaUx7dmf3H72kbB3/muZXlmRjagDGZ0GP3ToFaDY6TJKv5GQd2VXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59MmMTpM4utVui9VClobGLCu61L2IzOwfewPcUNRBbw=;
 b=Y3U5gLgbeHePLPw3lJOtb5cN2BFXFvftTw+Vawa8TCfokJrd/aJlD92usvT2n7UDbbEK3R7s/B9AKYKzEfn0oUtEbKxD0nI41iABQrd9+1ELINZGSiTk8iLcB43QCyKG7fU3jtEq9NGYcLBQ7gkmMLv8nmw+de0imwbN/ccXKyU=
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
Subject: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Date: Thu, 12 Jun 2025 17:29:41 +0800
Message-ID: <20250612092942.1450344-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 122a25a3-41a0-4e0f-d6fc-08dda993bddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2wrQmFTalJERmJVWmtLSzJTdmsxaHM4anI0V0JJOUsxSFJTeVpnbFNuRHUw?=
 =?utf-8?B?Z3pEbzFYMnR6YmxtWElzWkcrSllrYUJOcENGN3V2N3U1V3VVTjdxc2Z3VHhy?=
 =?utf-8?B?MlMyUlRpNEd5eVRqK1ZCZnFqUFd5NXo4U1ovTkdtenEvSDZkS1JPWW5FdEpV?=
 =?utf-8?B?RHBNWjlUWlE5S2VwdTlmUkVqL0ZBbmxwNEZvbVlIbjBBNVZjdU5oVFZTWmIx?=
 =?utf-8?B?YUEvckxYdytoeGhBSnJzZDltS1lQa1V0b2VXQUNrejlYTkNiQlNKdmw5Tk9y?=
 =?utf-8?B?WW45TlhnakR5VndNVWs0ZmZ1MU5SbnlzRGFxR0oyK3JaYW5PaCtJU0pOUUlq?=
 =?utf-8?B?LzF2RmdPR3hNak5TMGIybU9aelh0b050M1d1VDdNT2JZaFdrMEJJYUhCRFpG?=
 =?utf-8?B?b3dweFN2TWsyVW5GVE10Y2J4R0RWa2pwOUoyb2wyRC8rM0RBLzJJem92b2pN?=
 =?utf-8?B?QjcwWVZ3Mm9OTjBXKzJvNFlyYTNHaExMYnZ4bHVmRjJZS05ERjdvNEd1SElT?=
 =?utf-8?B?dnFkOC9TalFJOVczelUySDl0dmhTSTZ3MjUvdENPekRlbHZweWRaZzMySHI4?=
 =?utf-8?B?cEpHUTJxT1I0d1N1bklseE5EWG81dnBPZ3cxeld4VUVMTTdJZ29TMDF1SURX?=
 =?utf-8?B?MWlBd3ZrclJnc1N5YVdxbk9DTFc0bTk0QnQ0MWFsNHRmLzRHekJxZnh6eTFa?=
 =?utf-8?B?Y053QlMzWWNVczFiNjM1UXZTdWpERm1UckxiT0l3aWVCNnM2VTBrVEEwTzhJ?=
 =?utf-8?B?SnhISXNwVGxCdmI3NHY1MHlYTFFlbTZZTmI2dHRQdnpKSjNGK3JHMVQ3RnZn?=
 =?utf-8?B?RDlsTHhnOE83cHhlSVRrVGd6VEhjV3NtZTIxMnpwNnQ3WUgyNnpjN3Bwdmxm?=
 =?utf-8?B?OHFuRE5RZGJVRUxXekU3Mys3YVZZZHk5QkFyd3c5Q2lYZ0pMYU1FMmJGK2FQ?=
 =?utf-8?B?cG5HeUE5WlhmclpPc1drUlNORmtMSkJkendKRGdVcFdKdWxzcE5iczRJdkFw?=
 =?utf-8?B?QkQ3WldCemt3bVBubzR0NXVCLzVqRzRMKy91a0ZNaDg0M01Xa00zMVdKS2I2?=
 =?utf-8?B?aHQ0Wk1GQXJiSkpQN3d6M2M0RjhWNXZJV0xCYTFkZmoxRmdyaU4yV29EQmVa?=
 =?utf-8?B?QUZQUjh3eHROa3dJUXJMZGNEZkpOekcyekNKUDV5WlVBQ3hyWDlWVkJMbkVB?=
 =?utf-8?B?NjVua1pQTFNUOUt5ZVl0VllpS3Ftc1FqbUI3VC9wYTg4b3o4MVZGU3lrSHpo?=
 =?utf-8?B?MVdPaTg0YzExbjNnZFIrVE9aT1JzNVV6dm9nMFY2d3UxK0JxaWJaVi9UT3dr?=
 =?utf-8?B?aVZ0SGw5akpscUdUSE1NaDRSZUdwcCtWSG9tNXF5clhjZG9CTWhPV3lOeVVC?=
 =?utf-8?B?YlZ6TUYvUDltcHYwVll1V0ZwR1Nkak5tbXRWcnlxV21zNUVtOTFYMWFHUnRy?=
 =?utf-8?B?d1dWd3J0SmM4dnFRdzhON0pibjhqRDVDMkowdmVtTFk1c25TcmNJaWNNUW1W?=
 =?utf-8?B?Qi9OL1UyajBIMmhQaTNwT1E5Mkp6ZTh4UDEvSStRRGtVR2VpaXovVnBHUjN3?=
 =?utf-8?B?VmFEREdmbkRCcVRtWUJCbVJyRlBKZDhZZ0ZhUDE4TnZ3QlRWdTQyRiszV0ZD?=
 =?utf-8?B?aS9VWHVmQ0t1SlNFNHZBU1VLNjNGb3JtdXBraGg2ckNZMnVDQ0k1QUN4Zm9Z?=
 =?utf-8?B?bGFnOUpwWXQ0cjNGU2tMVkxmNXRxdHVFVVpTNFg0VGE2VkNyRXdRcUNQdUFl?=
 =?utf-8?B?aDB0RVJkc3R6OFpOK0tFdFBGQmxoRVVvcXR5VCtHZ0NMQ1VnOWZob1BEd0hP?=
 =?utf-8?B?eXEwZFVVdXZJLzdyS3NPeWZjdkpwNjhZYU5DWkdQOFc4NEQ2cENhQ0xQbkwv?=
 =?utf-8?B?bVRFZFg3Mi96RnhCcmJEVC83ZFRBOHk0cEhsdDAza054aHlyRGpFalp2QVdY?=
 =?utf-8?B?d0g0MmJEb2w4cUtKL3BkTWpzbmxrTjVibEVGaGRhKzZZYUZHaDZlOUFsTkJ0?=
 =?utf-8?B?di9FaVNZcVVXNnlXMWYxTXpIYjNHc3hMQ2FOc0FNZzYzNFNobjNnMHcrZ0Vm?=
 =?utf-8?Q?14P77k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:16.5934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122a25a3-41a0-4e0f-d6fc-08dda993bddd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300

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
v5->v6 changes:
No.

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


