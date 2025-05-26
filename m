Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B781CAC3D34
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997347.1378288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPk-0005D3-0U; Mon, 26 May 2025 09:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997347.1378288; Mon, 26 May 2025 09:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPj-0005AK-TB; Mon, 26 May 2025 09:46:35 +0000
Received: by outflank-mailman (input) for mailman id 997347;
 Mon, 26 May 2025 09:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPi-0003hH-94
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:200a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e12c9f4-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:33 +0200 (CEST)
Received: from BL0PR0102CA0026.prod.exchangelabs.com (2603:10b6:207:18::39) by
 DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 09:46:30 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::b3) by BL0PR0102CA0026.outlook.office365.com
 (2603:10b6:207:18::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 09:46:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:29 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:25 -0500
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
X-Inumbo-ID: 4e12c9f4-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP/vku6xvFOnVqfNrX34k5zc5lCLDS+ew9JVoGJhKlNnEm21LT9tAy1M61awkuYyOw8zLryTN6Bm0fbPoLt4CXCr7QcFuTT9G1drAXO19SLOFlwVAdU6olfGI+I6iKWLTROxNfXJy2OkyWDxIQe4mp7OldtHSu1uX/+uDOdd1mj46F+U0xgeA1gNPKg9BhbYWmwH17j1vGIYcSKPY6XgcRDARAkEtpB8yyI64fflJYdj96wlsyxmc9KwDRCnWQ8gxVhqUnc9bpXhYkzyfU+Qm98RuKev9Z3CkgBB5CkY3I/YCp+PUev2a2canuAzZfP1A72hHprygBYYPmjIwOq7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzigtSLOhnEm/3jzO+ojdi4ugIrKKVRZMdTKswuh48k=;
 b=ujsLU93NBWWUX69VWe5/xaO7lxpA4xEVmTM8gSRhvqOY54LpFLU2CTuAWR73o8GCX4LeixYERTux34AVRhRYQ3ti7A9zaPHHHATSUEK9KlL5dcuNQs2FXLnD8M7oSw7h2sMVlccgUk4Uj84sJR2BEKYUY2V9NDUDoAwqnreJfczOsChDd4aYSpxZz/SzEzX5UGi6i6clPPyG04wYPlxOfaN5FJWAJoI/GaTcgOOVtEyvxZ1GlrsohaPkM8MsRFPZh9XYpGvAPbLS+k7i2j9FFaceDHhFjItIQyAnMyQN1XEKW6UGnouP2/CfITLKenPx1t1lHu22MyfG2Hi/xDWYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzigtSLOhnEm/3jzO+ojdi4ugIrKKVRZMdTKswuh48k=;
 b=Cnn7FgGd29aMfD0r8+jqS6g3nxK7UBUXTIwOs24oGAXy3FZAqaIDO9tshp1Y9HjZvqEPTfY85NTb/82IzkiK7raejh3ghQt40yb6L7768Eae8h8sZxHnJ4Ao+Qybk0Eo74+e8RUf0UMbmtv3TNTHwoZ+S1WdTrbcaJH9a/44P4E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 06/10] vpci: Hide extended capability when it fails to initialize
Date: Mon, 26 May 2025 17:45:55 +0800
Message-ID: <20250526094559.140423-7-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS4PR12MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: f472eaff-55aa-42d4-969b-08dd9c3a30cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU1hSmNscXNrWENJaklXQ3JwQjBpaHMyN3o1bngxOEM2eGdSSzdKRU9Kd0tR?=
 =?utf-8?B?aWtMN0tWcSs1OVVYV3d0SXlJem53Mk5vblJ0SlFSbFNHL1NZV3FFcXNQMVhE?=
 =?utf-8?B?SjR5TXhjT1c2b2l4a2pDbTRZR3NBZkdUdEJ4dFJkcHZuRGtYdjU1T2kwTW5L?=
 =?utf-8?B?TzcvYk80K2dKS2J0c3pJUWlzTFBSbEdBZFlKRUFkZHNWYTFjK1hsVUpURmN5?=
 =?utf-8?B?eUZveDJDb1BqT2w1aUo3RmpQb3dkcTBwNG9PeXlReXF1T09BeWpCdGZndk5k?=
 =?utf-8?B?UDZXc0ZnWWlxTEtPbFVJVlFnWTlkdGF0QmFaK1g4NUtQa29ucGFOaWxKZWEv?=
 =?utf-8?B?dElPN0NxenJOT3YvOXpZV2dkcHlYeTdzcWZtcm9Mcmp4eVRYalM2a3g5RDZp?=
 =?utf-8?B?NEd1UjMwdHRTTUNlbGlsMU9wZ2lHUnA0V2h6VHhVdDZwRjdXVERhcmdTTnBl?=
 =?utf-8?B?WWpPUHNRRXV5dmt3V0Nsc3BFdFBzSVN2eEFQS3RmbmwyTzZHVVNWcllYMHQw?=
 =?utf-8?B?Q01tTTRKZ2JNKzdlN2ZVU2FBcjJSVVR1RWNXbFlFb09aNFVOb3ptUjFlMnpy?=
 =?utf-8?B?TkdzdFZNZW5iS1N6RnNyZlAvSjZHNG11d0liaW1xdWFHOHYyNHZMRm85bi9X?=
 =?utf-8?B?WEYzaXh6YXRZUTlHQmJPMmM3NllNeGQ2YmQrRWtWSW5RZ20wQUl6Tnh1bXdr?=
 =?utf-8?B?eE9tYVg0TzBVd1RvK0U4SUtMdmRNMjdtdFpOTTFiMC9ZRjQ5S1RDYUdINEpa?=
 =?utf-8?B?VkdtV2FyeG5qdC9LbGVEclFSUDFuT3VxUkFDcVhrME9xN1FlWWdVNHhRQ3Q0?=
 =?utf-8?B?b0R3WFdnOGRPdndKU1Z6a0ptMkNnSW5jNE9RZE4rblc4a3F2REpqWDRPZWZK?=
 =?utf-8?B?VTk4U0lBZjVHaWRpME9NbGRkU3JRL2V4U0gxUHpPUXF1NGU1d3ZxUDJ0YThJ?=
 =?utf-8?B?a0F1RlJ0andQRWVldUJsYVlyaDBrNWVDUlQ1K0lpMXJyM0pqaEJYTjJaQXVH?=
 =?utf-8?B?aXBMUjVTUWsyclJmanpzNEhGbjQ5bGJCekxTbzk3Rk1ncGJnbTM3UzdCQzBB?=
 =?utf-8?B?QnpLT3BWR0R1aXNjTW1kZmRRamh4NDZIeGVGd0tWYVlaTTZ4N0JqZEVESXlH?=
 =?utf-8?B?WEU1OUhwSG0zMnAxRDF4aFh4blQ3LytLL3BoREhYUkJKeWZnbUhPeWtvbEpE?=
 =?utf-8?B?dWE3VnhVVlIwYVlCZVg0MmFnZHY1L0hyMFJZYTdxT04vQXc4Z0gyMEV4RW9o?=
 =?utf-8?B?aCtmeDdDQnRwY0ZSa2MvTFdDdnloSHBmekRDOWVSVUoydUVtVHBWaTNXMThG?=
 =?utf-8?B?YnkrRC84Z1V6VHQrRGFuK01rU2VjbE82aXdLdHRKOHlHdmh5cEZ2WXlPMTFq?=
 =?utf-8?B?UVlsL2JodkVveHVDSk5NeVB3WFdOdSt4andPT1JMSlN2ZDdnV3NucEhlUWZS?=
 =?utf-8?B?RlFwZGFrYVpzWmVKTjlWR2twVktPV1pPRlhMd1BPbkpLUkx1RnFoVm1CWTdC?=
 =?utf-8?B?Y25zTHV1WUVRUTZFQzNXNW5YdGI2NHBXbTZFTlptUVZrWW1jM05mb1F2ZzlP?=
 =?utf-8?B?Q3lKa0sra0RPZ243UDFUR2w3Zzhvam9BMmdIcXhLb0tNVHRBZElPQzcxd1lv?=
 =?utf-8?B?bW5VeVZKM1Rkd3dVbk9pVFk5OCszcVJFeE96ODE5Vzh1bFlXMlpOQkdicFQv?=
 =?utf-8?B?V09tNGpiZG9wMTF2bTArWEpNNDJCNytsK0Q5bU8zQ2haRXpEV0poMTFka01H?=
 =?utf-8?B?S0N3akJ0amxKTUhuZlUvRDMxMVR6ZWV2a1Fic3J4WUZYa29MK2ZjQjRvb08v?=
 =?utf-8?B?cldBbHFaRjJPRGo5WW9Sc084dzFpS1dhcHdCNXRlWW1pb3VmcnV2eUZpdmQy?=
 =?utf-8?B?RzFQU1FicWJybHhxQTB4UGFsWmozNXp4MDNqTHBxdllaUzRwN0dPejQyM2lU?=
 =?utf-8?B?dkJicWcrdHNkRGg5a0owS0VxdmVRcVpEYk5TTG5yRWtMbDlHdldIMXNBWk42?=
 =?utf-8?B?MWRrQ1NTS25DRFJDY3Z0VnlZWEhVbzZlay81TXVrMGxOK0VMb001cTI2Y1lk?=
 =?utf-8?Q?T1N0H/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:29.6973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f472eaff-55aa-42d4-969b-08dd9c3a30cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707

When vpci fails to initialize a extended capability of device, it
just returns an error and vPCI gets disabled for the whole device.

So, add function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v4->v5 changes:
* Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
* Rename vpci_ext_capability_mask to vpci_ext_capability_hide.

v3->v4 changes:
* Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header) (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
* Modify the commit message.
* Change vpci_ext_capability_mask() to return error instead of using ASSERT.
* Set the capability ID part to be zero when we need to hide the capability of position 0x100U.
* Add check "if ( !offset )" in vpci_ext_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize".
* Whole implementation changed because last version is wrong.
  This version gets target handler and previous handler from vpci->handlers, then remove the target.
* Note: a case in function vpci_ext_capability_mask() needs to be discussed,
  because it may change the offset of next capability when the offset of target
  capability is 0x100U(the first extended capability), my implementation is just to
  ignore and let hardware to handle the target capability.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c    | 100 +++++++++++++++++++++++++++++++++++--
 xen/include/xen/pci_regs.h |   5 +-
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 60e7654ec377..2d4794ff3dea 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -176,6 +176,98 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    struct vpci *vpci, unsigned int offset)
+{
+    uint32_t header;
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    r = vpci_get_register(vpci, pos, 4);
+    if ( !r )
+        return NULL;
+
+    header = (uint32_t)(uintptr_t)r->private;
+    pos = PCI_EXT_CAP_NEXT(header);
+    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
+    {
+        r = vpci_get_register(vpci, pos, 4);
+        if ( !r )
+            return NULL;
+        header = (uint32_t)(uintptr_t)r->private;
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    if ( pos <= PCI_CFG_SPACE_SIZE )
+        return NULL;
+
+    return r;
+}
+
+static int vpci_ext_capability_hide(struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *rm, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    rm = vpci_get_register(vpci, offset, 4);
+    if ( !rm )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)rm->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            rm->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * If this case removes target capability of position 0x100U, then
+             * it needs to move the next capability to be in position 0x100U,
+             * that would cause the offset of next capability in vpci different
+             * from the hardware, then cause error accesses, so here chooses to
+             * set the capability ID part to be zero.
+             */
+            rm->private = (void *)(uintptr_t)(header &
+                                              ~PCI_EXT_CAP_ID(header));
+
+        spin_unlock(&vpci->lock);
+        return 0;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    if ( !prev_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    prev_r->private = (void *)(uintptr_t)((pre_header &
+                                           ~PCI_EXT_CAP_NEXT_MASK) |
+                                          (header & PCI_EXT_CAP_NEXT_MASK));
+    list_del(&rm->node);
+    spin_unlock(&vpci->lock);
+    xfree(rm);
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -209,11 +301,11 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
                    pdev->domain, &pdev->sbdf,
                    is_ext ? "extended" : "legacy", cap);
             if ( !is_ext )
-            {
                 rc = vpci_capability_hide(pdev, cap);
-                if ( rc )
-                    return rc;
-            }
+            else
+                rc = vpci_ext_capability_hide(pdev, cap);
+            if ( rc )
+                return rc;
         }
     }
 
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..3b6963133dbd 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -448,7 +448,10 @@
 /* Extended Capabilities (PCI-X 2.0 and Express) */
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
-#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xfff00000U
+/* Bottom two bits of next capability position are reserved. */
+#define PCI_EXT_CAP_NEXT(header) \
+    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xffcU)
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
-- 
2.34.1


