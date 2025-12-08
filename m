Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B3CAC79E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180070.1503345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSF-0001SF-QB; Mon, 08 Dec 2025 08:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180070.1503345; Mon, 08 Dec 2025 08:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSF-0001Ob-Mp; Mon, 08 Dec 2025 08:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1180070;
 Mon, 08 Dec 2025 08:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmTq=6O=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vSWSE-0000Wp-91
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:18:46 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8088bf75-d40e-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 09:18:41 +0100 (CET)
Received: from SJ0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:a03:39e::22)
 by SA1PR12MB7271.namprd12.prod.outlook.com (2603:10b6:806:2b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:18:36 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::41) by SJ0PR03CA0287.outlook.office365.com
 (2603:10b6:a03:39e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 08:18:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 08:18:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 02:18:33 -0600
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
X-Inumbo-ID: 8088bf75-d40e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onhbc/9ZMy9G8b2roTJzyW6XGaBijJqosAmJHeU+ZX4rJEdlbz+8grGRf3F4T5PFd5XF0xoqBYIqTEJtT04UM58ObqrkZYZChEAdst2ilbtyylMYKkH/DMtLuEXCjanlLQq1sQU5/62eJK7fSkv4GafhP4M8uwBdM/4S/A+tdZ4EwTq059dskBdf3aXktGHVDuoQYU8pPIjJ1/+gct/DBIJh9anPcxQFVWHun+fDM761buKYAGkSnYWcpqL2Pc3ff2NTRb+kHb70EzGAk/oZv07XQaOljKRcNpEwgQWqnNLgEi+JraNH5FMDJXMjfOlKfG1GE6DeMTPLkBJh1RQ2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ll3zGyqnoS22DY6zoekAmF0Bra4jeTbZ+pxTmziEM=;
 b=hTSAlCdjj2II9t6F0V6C86Cr0BZRoKQl2wX/WEby19O0Ezoxr8NLI8waqgeR6c16pz4lIUWgCClW9m5So6ntq350lBsIUiYBBrvGNLIGHaAUSS3R28y5gFrMivShaT9thikPLjHay8MxGwqbvVFAQfJ5Zo475k7nk/sU3tf/A2kgZ9dVV5MySOI3ZwJnyDRjscaPMFClgRQTVGGWOwZ32h39VTeQRVtS5WYAuo5PGA+rk/0Eb6o8AzRPc/woHIlSBzVXTAR+5vDKR1E0wv7nrYabvo+Zt+8YUF+LJrm4e9vZV6W0q4c2vPIRkSSkTtZ7bEwR9hqnF8nYtEtuIVyJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4ll3zGyqnoS22DY6zoekAmF0Bra4jeTbZ+pxTmziEM=;
 b=NQyL1hXyQ5BfBQKHUsshrH7vDIcnfdlpi45Ah0YXRMp/JnXBvpQohjaCvtn9uwI84dlYShDQ4s/ukpj9jWkha0gZSnwvXiv8rMDd29txIpGLtgkFLvFHpldOm8QOjqWfcaRLa3lMewlJnb7mf9FtgFsNc+VWtCweN8WqIHPh2V4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RESEND PATCH v12 2/3] vpci/msi: Implement cleanup function for MSI
Date: Mon, 8 Dec 2025 16:18:14 +0800
Message-ID: <20251208081815.3105930-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SA1PR12MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a833f3-aa14-44a7-3af2-08de36326259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUVHZlFaQitIY0IwSlNtR0YzSllJbmgzR0J4RlpSQWk5ckV4WkN1U3BCSkU3?=
 =?utf-8?B?dno1ODhJNTMvcTR1ZzBrWDVUcms5bjIzSWtMOHU1WGJuYmRpZ1VtQkx6NG0y?=
 =?utf-8?B?ZFhqZWt6YStIdkM4eDgreTFwVng3YkFkUmZoai94Wkp3U2draGRvU2pySVZi?=
 =?utf-8?B?Y3M3Z3NXYzhOTnIyNjU3eFdQeTZ3c296WTNwa2dSckUyWG51WXREcmg3Y1FZ?=
 =?utf-8?B?ZTEya2ZRZkdqNlFMbjdCekowMlFMVmFQRVg0YUp1NzBqbDcxQ3E4VENYU1Zk?=
 =?utf-8?B?NVZEK0dqYVIvMDZqZFFreFVIS2xmSDI4RXNYQVpnbFUxWXY1Zjd5RGQ3ak00?=
 =?utf-8?B?M0JGYm0wWnhYWUR2U3FWUVd0S1NBOTI0SDlqQjVLR1B5WVhBMlFRZnU4NHcz?=
 =?utf-8?B?cCtUY1VBT3J3cUNIbnI3czhzYWFxbHJzVkpEZllod2hoaFNldDFjNFlGRWJW?=
 =?utf-8?B?M1ZjNEhKdnRDUWNzUkJBRG5tdFJCRWJqWXpWMkEyYzlqeHZFeVkrSGZHeFNy?=
 =?utf-8?B?SjR4cUhhb0toRHJibzcya3RPSFMyRm11WUpYemdMR2dneFJLaDdnYzNzSVpJ?=
 =?utf-8?B?MEV1SHJWOW4xM05jTkpUVzNBN3VwdkhsSEhCdVNLZTJBQmVvc3dPb3lpN1Bo?=
 =?utf-8?B?L1NXalluNk95cU80VTdxb3p2dis4dUJqajM1YmZ4T3M4MW9RL1JXcVZoRFlU?=
 =?utf-8?B?V1hXSFJGWUJDTC9NSVgzVFRvYTEzbmJPZDNUQzBoQ2IxVXNyUWhBQ3FDbHkv?=
 =?utf-8?B?dlRBWGhQWmJDZHpISmhDNllnVldwRnlad1ZNYmlxelZLMUwzSUdmUHNzSk1Q?=
 =?utf-8?B?T2o1NWNobEZNSnNnOFdkRDdDd2dTYmkrenRxQ0dCSVFMd0JJSGJMZ0dQNkpR?=
 =?utf-8?B?Z2VEQzdaRlc1Z29qZXZFR1hQUVI3ZUNmTExPZzlKMGsrSDM2a3V5b3k3SFVz?=
 =?utf-8?B?OXRzMkRCLy9jTk0wM2pzaUlrUVlGSmttajM2YVZCYTBES1JaTWZMQlVTY29m?=
 =?utf-8?B?K2FUUGVnKzVVaTMzM2NZNVlUWjFRb01SR2VHS1ZJb0VKTlNra3lyVmFIbjY0?=
 =?utf-8?B?SkMvN3Q0V256MDNqRFd2dEZubzhWWnVUN2pYdTByL2prOWREajE0czJUUUk3?=
 =?utf-8?B?a05wOVlRQTduRWtwcnFlK2lQVlJoeDRxNURjYzE0bWN3YXVOZTM1Q0gzWG1O?=
 =?utf-8?B?YWV0RGwyYndkbDZYSUFkM3NSTklkS0laalphNE85SnpNQzZjSjhiaFhIdU9w?=
 =?utf-8?B?ckZBaFF1RWExUDRMMWloU1J1T1RCVHpmcFFsaVRBZGRFWVlTOGJIK1Q2WUNT?=
 =?utf-8?B?STI5dFNuSkVaRUJGY0hKblRPekkzM3d1eThwWHVROFBmTDdvcVJZQSt1K0Uy?=
 =?utf-8?B?QnV2YkFyNDJKUDRoQmRzbnpTTXpuVDFHbU9OdUxrYThPQUM5Q215VTlIcHlW?=
 =?utf-8?B?akJsK3htTStwdlJaYXlQNG5EcnN5R1B3MHVUR1dxZStvcjVubkVwTDFaQ3R6?=
 =?utf-8?B?TlY2cTFvckFFY1dydVhPSDFTckh3bVIyQkJ6TmVWZk5TUkxYYnhraXJraThH?=
 =?utf-8?B?M3BZN0g4MElGUGRSNzJJSG5VM1Z6dDVEYkRxRmJSZGF2VUtqaGFtdmVFanJE?=
 =?utf-8?B?QjNiOXVkWGhwRUxjV3owN29LOFV0RGNCVDQ3Zk0wTFlTN2tXNWpoK1kvYk1V?=
 =?utf-8?B?VHE5cmJqbDA1WnFjYXkzYVozU01mZXd2OEJsend4NGZGVUhlNElRVENCcWxi?=
 =?utf-8?B?aU1rNE1lVkk0dFIrWmZVS2I4Q2xsVVVWVzF2SUZxWTUyd3kyVjJUaHZqcE1l?=
 =?utf-8?B?WXlneFNJWEZNYk9zeEFLYXdLOWNBa1VTTFZEcFpmWVFGalBZYSt3WkJScWJI?=
 =?utf-8?B?bzZJaUI4WldTb2FZMHF5WFp1eWpacGMrc2xib09wUDV6MHgvREUzTFEvK0Jl?=
 =?utf-8?B?Um9rVjcxTDNSZFFUSEtvT2ZYb3EwN1VaVCtoaytXZDhMRFlVUjhROVBjVHgx?=
 =?utf-8?B?ZGNOajhqcWIvejIybGczRzhnNnl5cTIrd0FzVU5zZmVnTjRLcGRRN3ZDK081?=
 =?utf-8?B?cWJsVS9jaUFreVFNLzNiU0FzZWdpampzYWtCd29qRWN3RExJTHR2WllaQUZS?=
 =?utf-8?Q?mMjA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:18:35.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a833f3-aa14-44a7-3af2-08de36326259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7271

When MSI initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement MSI cleanup hook that will be called to
cleanup MSI related handlers and free it's associated data when
initialization fails.

Since cleanup function of MSI is implemented, delete the open-code
in vpci_deassign_device().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v11->v12 changes:
* In cleanup_msi(), move "if ( !hide )" above vpci_remove_registers()
  since deassign device will do removing registers itself.
* Read address64 and mask info from hardware since they are not reliable
  when init_msi fails.

v10->v11 changes:
* Add hide paratemer to cleanup_msi().
* Check hide, if false return directly instead of letting ctrl RO.
* Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
No.

v8->v9 changes:
* Add Roger's Reviewed-by.

v7->v8 changes:
* Add a comment to describe why "-2" in cleanup_msi().
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

v6->v7 changes:
* Change the pointer parameter of cleanup_msi() to be const.
* When vpci_remove_registers() in cleanup_msi() fails, not to return
  directly, instead try to free msi and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
  init_msi() since we need that every handler realize that msi is NULL
  when msi is free but handlers are still in there.

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
  since cleanup hook is changed to be int.
* Add a read-only register for MSI Control Register in the end of cleanup_msi.

v3->v4 changes:
* Change function name from fini_msi() to cleanup_msi().
* Remove unnecessary comment.
* Change to use XFREE to free vpci->msi.

v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array
  to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c  | 55 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c |  1 -
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..181ec902dffb 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,59 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    unsigned int end;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !hide )
+    {
+        XFREE(vpci->msi);
+        return 0;
+    }
+
+    if ( vpci->msi )
+    {
+        uint16_t control = pci_conf_read16(pdev->sbdf, ctrl);
+        bool address64 = is_64bit_address(control);
+
+        if ( is_mask_bit_support(control) )
+            end = msi_pending_bits_reg(msi_pos, address64);
+        else
+            /*
+            * "-2" here is to cut the reserved 2 bytes of Message Data when
+            * there is no masking support.
+            */
+            end = msi_mask_bits_reg(msi_pos, address64) - 2;
+
+        rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
+                pdev->domain, &pdev->sbdf, rc);
+            ASSERT_UNREACHABLE();
+            return rc;
+        }
+
+        XFREE(vpci->msi);
+    }
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSI by default. So here let the control register of MSI
+     * be Read-Only is to ensure MSI disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSI ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -270,7 +323,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 07c7071d0a17..7aaf015f63d4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -368,7 +368,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
     xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


