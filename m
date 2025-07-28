Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C49B133EE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060940.1426531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2b-0005mM-75; Mon, 28 Jul 2025 05:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060940.1426531; Mon, 28 Jul 2025 05:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2a-0005iE-U5; Mon, 28 Jul 2025 05:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1060940;
 Mon, 28 Jul 2025 05:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2Z-0004fw-2R
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f26d768-6b70-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 07:04:43 +0200 (CEST)
Received: from MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::29)
 by IA1PR12MB9467.namprd12.prod.outlook.com (2603:10b6:208:594::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 05:04:39 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::92) by MW4P223CA0024.outlook.office365.com
 (2603:10b6:303:80::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:37 -0500
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
X-Inumbo-ID: 5f26d768-6b70-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neBJpoRKDoqeBwtqF2f5wC9nUOADXSK9Xg8ZaQPFvhArEXbcV+2Gk1Mu417aATLHiZXV92jNqXL8XPHg5drJ3phH8YBjuVdS3vJrrW+qvnh9NyqyRtzDciHsRu7YkGJhAV27/nDKZGk9Igw1P/AN7uovisKRPsj72qdsvo7iE58p1iVqsbk2aNcfVamZh39iueRnOzpuDV/bJdTdRHby5vsvMbB/Ms8hSg07CiLaDpOA55QbTq1QssiGBG7241p15RxL7aJQ4hH6P8ihqvvHxjtSIb/yi0x3Vqb1SYV5aRbeDOBTGpcEOChOn+j9NuPF7W8L0Xz6vkIXhMMn4kqnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bfkBougyMwABmIvtPu5b/zP80odPV4q0yveTRdf5CY=;
 b=e93zhDrZ1aJN8533wr1vhkm3gAtuZ3BGj4Bmy8TzQ6Kyd5hLpGKEDP6mdXK3o7DxBOPmNg/t7UB39k9yESL59DO8x6k0W1rjA2P77a1IPl0QniKCVK1q5b5f2LP5QSkciWa533G+8iRPiNYlZLvGTQttU4oO8sXKveLJuy2juFxr+3GRv1IaN1yU94G4IntxMtMliX++H3f1OJwQuZGNS30FnO0TEfHE281wFL7hIvMEocEWdv9vAWkdaiBFt6yJoHE6kX96MO4IemDCveDu50m3O5xGJMe09Jg1jh+cCvg0Kip4ItLgQrwlpBtDGLThPYI9iH2wWpwFUjmlJkv9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bfkBougyMwABmIvtPu5b/zP80odPV4q0yveTRdf5CY=;
 b=3oFKYADE2fOBrd80dswnkt9mnfwxikTobzxAUSIwOYbj6MK93iGhRXGOr1ay4UZzf8yIMc0BP+bQBFGwKBjKBe8H2mF4o+2x60HguSq3Bsb67zwAB2kt6AbZOTuJu7OZ1TXBf2EvfLGyNoeoNhoFcMyzpYDqKVuUi0xLvJB5YA4=
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
Subject: [PATCH v9 7/8] vpci/msi: Free MSI resources when init_msi() fails
Date: Mon, 28 Jul 2025 13:04:00 +0800
Message-ID: <20250728050401.329510-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|IA1PR12MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 81075f59-c24e-4f09-6678-08ddcd94416e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkdkNFJKQU9HQmkrMGNEMzl0QllKRGJrY2x4YU5ZQ3pwSWc3YmMyUVdJRWdF?=
 =?utf-8?B?NWJiYkMwdWE5ejBkMERhRmZzbGNZUUhzSWVWM0V1c0ZsOVcxQXV5YzFqWXpL?=
 =?utf-8?B?UXhFQ1d1UWdqSU41dzFjQzRYeEdHbUYyVFRUN0VYbHprMEszM1VrVGpRWG9q?=
 =?utf-8?B?b1k3NnpINk9sUHoxMmFqYmE5UTEwdHVtR0VXTlNVOUllR0wzNitSU0VLS3Uz?=
 =?utf-8?B?V2xpdlFDNVpMWmFydnUyeGNndVVVRUhLZ1l6dEtES2dPN2VKLzFhcEZVaE4x?=
 =?utf-8?B?emh6TTM4ZmZ0T0lhaDdoU3VBZ0p1K1F2Q3pWWlUwWGNCQlVRNy8rVmtQY1VR?=
 =?utf-8?B?TWE3R2QyZHpvTUl2QytWbm9NMlFHaEFsVUgrV0tOV3BOek1tSHN6cnpwa3NR?=
 =?utf-8?B?aDlDQTA2U0NhMTJBUHhVbDczbGR4SWtPSU9MUFVpMGhzVW9lalpPWnlGSnpL?=
 =?utf-8?B?eXRFWmJNZmFCRlhhUWNxR2hyQ1l6S1Z3NEtyTTBMSGducEhqeFZYQllqczNh?=
 =?utf-8?B?RmlmanBMY213dWZVNTJDc3dqM0NGMndzUUZsSUM3SnVzakRkc2lwVjJuTWN6?=
 =?utf-8?B?YlRsc1RPcjU2ZTA4ZE13cTFML2U5b1dvK0dONEFMbWduZWo0WU9hM3pua0Vv?=
 =?utf-8?B?cW1Eam1UUFliY1kwR0dVTFdzN0RCRGVLa2JBaC9IaGt4Z2F5Tml3UlJ6M1pF?=
 =?utf-8?B?MlIrdHdZUGtjdVdGWG40aTlnZzJ6SWdpSnY0T004OUFyWTU3S2JtZHlZTSt2?=
 =?utf-8?B?M3BKeG5aWURGRncrY3VML284SDlzOUdabFdiVnFjU2N0R3JDckhlODM4SERl?=
 =?utf-8?B?cUJvcDBFdW1MREFBY3p3bkd5OHozSUoxRWtGUnUzTmdUTzBJVXh0TE1wcTJN?=
 =?utf-8?B?ZlRFTk1INDRLVm9SNk9NQmlHN3ZoWW9pS1N5WW1GdFkwZXJ2SCtMTThoeDQ1?=
 =?utf-8?B?ZlNZRVNtOGtFWk5LbGpoUml5a2M3UitIS25VRVV4Y3ArTk9uRkNPeUJVNHlk?=
 =?utf-8?B?bXNuRjgzS3FTV1BWcUNMKyt4bW03UGh2Rzl2Z3NNU0lBeWFoSXFvWHk0clIy?=
 =?utf-8?B?dVJkNWYrZDJLc3YvYkI0czZwcEZ5ektYV3NESHRVdmIwbWxYSHFja0NFZU5V?=
 =?utf-8?B?cHFMa3JBVmtTcSttRk1QYXRKUndYWjB3THl0RC94Q3RSa0dLT28zdk8wU2s2?=
 =?utf-8?B?T2xyU2V5c253SGFWbHBER0NGbzZEWnp5a05yaVFsNlI5Z09DVHpnekpPdTI5?=
 =?utf-8?B?dWtqQy9GVWlrRHh3NDZncjBSM1cxcG9OUVdrbWZNSUVmblVFU29BbDNZMERz?=
 =?utf-8?B?Sjk4Qks4elZRNXN2WndvZW9HMjZWdzhTeERhYmRhY2tIc21JTFEzVE1OaDc3?=
 =?utf-8?B?RUFTTUZrNnZ4ZGlIV1JzMzlvbC9IUnRTclZNbHcyeG1KSVprYnlINkZxQmJU?=
 =?utf-8?B?MTVFZklZd3k2cDIzRWNTM2k4bW91MURMZ3JLMEVtcENPWUEvd0VHYnNwVzNY?=
 =?utf-8?B?RU1oOWRtL1VXOW9PSEkrZUl0cC9Hdk9ObDBuckxxbnliODlNWDNha3lxa1FZ?=
 =?utf-8?B?SU4wY1RFTENLOWFybEMzL3pLMHdlUGErbTh4Qit4bkFrQmkvdlRwZWloYVRj?=
 =?utf-8?B?RkVjcnovMUFla3BkbEJpUGQxR0E2cTlYaEZmVCtDZ2V2bktZUDF6MFF3N2lo?=
 =?utf-8?B?aC9jZS9PRjNWL1IrWnBoL0hWL0l5YkdUY0djNU9tbTQvamNteDFNUlVnQ0Vt?=
 =?utf-8?B?dWhBYTBKTFVncGdjbmRUMjgzRlhIS3R4dFk1OWV2Ykd6MTE0bGdjb3pESUhS?=
 =?utf-8?B?UEZzakdMVXJFS1dqcHBpNVdWVjhSakI4dDdObXNVNkpxLytHd3ZuVEppbXVo?=
 =?utf-8?B?NWxScFVtZEplSmdFdFFYL1J3OVovK3VEdjkxUk5lRCtKQVBtS0lCMjZXYnhi?=
 =?utf-8?B?ODJKaWtIMEZHVGNnd1JFeVdmS2swWWk5U1FENkxhcnlmREloVzlIUTZOUVds?=
 =?utf-8?B?dys3KzlrdVdEenp4YlFpRVI2d0ViQlBrbnk2NWhBalFYU29sdmNGK21CTGpr?=
 =?utf-8?Q?tZMl0T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:39.1745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81075f59-c24e-4f09-6678-08ddcd94416e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9467

When init_msi() fails, current logic return fail and free MSI-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSI capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSI.

To do that, implement cleanup function for MSI.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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
 xen/drivers/vpci/msi.c | 46 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..ad5138c4cb5e 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,50 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev)
+{
+    int rc;
+    unsigned int end;
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
+        /*
+         * "-2" here is to cut the reserved 2 bytes of Message Data when
+         * there is no masking support.
+         */
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    XFREE(vpci->msi);
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
@@ -270,7 +314,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


