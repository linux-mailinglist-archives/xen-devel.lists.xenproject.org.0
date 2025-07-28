Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B0B133E9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060935.1426494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2W-0004lf-Vk; Mon, 28 Jul 2025 05:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060935.1426494; Mon, 28 Jul 2025 05:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2W-0004jQ-On; Mon, 28 Jul 2025 05:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1060935;
 Mon, 28 Jul 2025 05:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2V-0004fw-Bf
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:200a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d84e76e-6b70-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 07:04:41 +0200 (CEST)
Received: from MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::32)
 by CH3PR12MB8076.namprd12.prod.outlook.com (2603:10b6:610:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:04:35 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::32) by MW4P223CA0027.outlook.office365.com
 (2603:10b6:303:80::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:30 -0500
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
X-Inumbo-ID: 5d84e76e-6b70-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIS+IhbcflxWP2bbCuPZ5UPxrK3fLrl96Lz5YkSBu0p+UCTyHdZF5yN7BLiS69jt4yzVHomRexftIB0DGx4R4Zo5BhcNko2H8a4j1JIEAYhDsACHVR7hgMnTh9/igBqF5fXOxA74z4gE9gkMDKz4hM/459LWK1bI753EgA86T2HvyTpy4jpJ+4bh2KsxlTcyUYQ/A6ebMDoyT0Mu8FBQ3VDf7aHBqFU7Rk0pWy7/a5Ar0AXANEQZjqxqvGfoWberXYUK+UwgjN2KWFvAyUGAWSsODzLtskam//LKfaH9udsrhg6u4KSG4bVaN8Gp0hJ4O9CsNaHDgxwzoNoK2v86ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3xrXoYo6E/43dhwJeTCjqizfm953T7+MvafEZSeVg=;
 b=tGqJKmywyiDmwDuDU6+p1qCwzOtywCDA46NdYbBX71Mf5oKwgDOWze9HurPQs5/rayNAUJW3rZD8CAEa54DwmLugFdtgKHw+n7AExv/G7PvOibB67Ldvus1u63chzNNDCcuLfwCSoOLzMOHLNWr2+atmqFPbWRfA4zFzZqLGy9nKOzu/78HzDfKBG9CoDrqU5HiE+UFVmAixdvkg1BBpd2VprwqbfXEU4AGmUbqGB2mENLbo8VHOBPdyRhizt+Z5t5ypgYRFQge5BzT/wR/QGJoSEkyJK2Oj6MnF0NQ7y5DW2soqRcG7VGHUMPr2vaz0L3kD8GcXEXAV09mPAQHvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3xrXoYo6E/43dhwJeTCjqizfm953T7+MvafEZSeVg=;
 b=jDJnqFKp40nANRBI6e3ih8vBzdkSaR0kIT703MGORpFqWJeb953NO7Zy7YX8o0dYVLPQzysBOq8D/qyF3VDTFtFpA8z5yi8IpkXepVGP8wjvTJjsvPU9qrt50/0tz0kV1Z/vqgBsqMX+SchNZOJaQNEwBxeeEdRHEoi5yWeh5Bs=
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
Subject: [PATCH v9 4/8] vpci: Hide extended capability when it fails to initialize
Date: Mon, 28 Jul 2025 13:03:57 +0800
Message-ID: <20250728050401.329510-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH3PR12MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d86ee8-fb0e-4b74-a677-08ddcd943f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3p1amhkREt4SGMreDRRVDJrUmhCbHhOQWV3RGRla3IvUU5namVOaGRZWUEx?=
 =?utf-8?B?U3h4bEhKYWVKazZQK0lLcjVsK3JZcHkzUjlKUVE4cU85VDNPVnBDRHZZWXQw?=
 =?utf-8?B?eUVpdW4zbUVpU1Y5cHpKNFkxZEw0NHdUZnI2K3RlUzNMc2lySGJCZFhLWmpB?=
 =?utf-8?B?S0ZpbHVmMGlmYzNxdW1NTFk1YVh2NFBrdVJpcWxsL3RJYUJKWUxEMG9ZZkVB?=
 =?utf-8?B?SFErdEQxaTQ1V05zaUJsUEpNU1JMN0NLYjQwQUJmMWJZNjVnYXVvLzhWYUkw?=
 =?utf-8?B?UXIxUzU5UmhSbmdKai8rQm1SbjI3VnRyVXZJMmZDdlJFeThpNFoyaXk4TWk3?=
 =?utf-8?B?b0VIZFV6cm1PVlZOUk0zL2ZneG55MWU3QUpUREZkcVNWdllMQzVWaXZEQ0JP?=
 =?utf-8?B?L0t3bkhEWTdXTUFZdHdxRDdmKzNLYzJHUE1PTmpTNFJUdHpxVkhUczJRc1Jz?=
 =?utf-8?B?N01VUHl1ZXlNUWdGU1ZVMTlFdVpueURreGdGcjFWN2MzZWVsKyt0UUhDVmV0?=
 =?utf-8?B?aHN4WUtzVTBPK3hrZTZoRmRQMGZJVW1ZWVBKMENSaTFBVmlwbHBVNjVsSlJ0?=
 =?utf-8?B?Wno0MmI4ZWk2SUNieUU0QnQ1dVZiSDdqTGJnU1F4Sm93c28xS2hmZjZycS9r?=
 =?utf-8?B?Qmtxc1FYYit3amZXNUw2T2ZNMmdxbDkwdzZOSERFRnRhN3h6YWxpeldHaWdX?=
 =?utf-8?B?K0pzZXBTaE5rY2N0QTNueG1SRzIyekFkTnBFRWdoQmxiWDYxbGU1czFxQWVQ?=
 =?utf-8?B?ay9DUytXenRKbjhxR2lkLzZVQzZsVVc2V0taUW1Da0ZBY0ZVODFSYVErV2wz?=
 =?utf-8?B?dlJJSWhuVk9xMzFwaVlhWVZrcitMSEcxUW1ua1YwekY3bDNCRGVtR2FCaE9i?=
 =?utf-8?B?MVppdzA4KzZydFllMk1QZll2ZUx3c2tXRVdSMUFtRk5DMHRGT2d4U1FQS0ll?=
 =?utf-8?B?N0pCdDAyMVM2TkJ5ZFBxbWd4QXFjZ1lZL0trNEpBbE5RTDJnQmltNGhPV0FE?=
 =?utf-8?B?NG5HQmgwYlB0TUp0aXUrMGZkaEd5Q09Gb3RxM1l2TXpDajZ5eGpnS1RBT094?=
 =?utf-8?B?MzRXVkxVMGxtbE5rK3F6L2h1QWZjZ3Q0NlFtNm0vWjJMdFJxejBucWlJb0pq?=
 =?utf-8?B?ZWUrNHNyMVJ1N0tGUk0rYWJjbFc1bVZvRTNnaFdCcUVQdVdCRSttVU8ydGFp?=
 =?utf-8?B?MzBvanVUTUQ2WUFQTytqTVR2YjVmTmo3ZmZwVnRXdExpM0dSaU9TY3lkVlhX?=
 =?utf-8?B?c0ZEMk9HelpaZ0pUMklYSFFReklWNUN0aUNxMkFaL1JiVnhPR0tTWHpKSGJw?=
 =?utf-8?B?eFAwMDN1YTBOa203WTBUZHg1VndIYjZ6UGFRc0xzRWc0QVY5NHFMU3dMRU5U?=
 =?utf-8?B?UEM4S1A4QWU0ZlZ1Vm9wVDFkcE5RQ2VmNHIvUW1Fa0xySko2cVlvYlhwRFJt?=
 =?utf-8?B?bEp1ekx1VGZjTzd3MTFBQmdxYnJka21QWlZ3Uzd1d2tKMHFWbTdjSWd0aEZa?=
 =?utf-8?B?SW9QVDRiamFQVEkyVEw1YzF1clRYUjVCRXZUWjMxZ2lNcktCNi9Yd01sK1Bm?=
 =?utf-8?B?TDR0OTBVckhETTU0VWZWM0RjekgyOGw0VlFBR28yRzg2WkdUTDdXMTNiMmZj?=
 =?utf-8?B?MlozcFYxWWFHZmRtOEp0eExLYUZYNy8vMW9HMzhxdGxPSHQ2cmdwbzl1ZjJQ?=
 =?utf-8?B?MWkwbHJKSGJqclJOSEt4QWY4OTIrZUxFNUM2ZTlmT0h5eE5kKzhQOFZ4bkZS?=
 =?utf-8?B?eUJWTE1Ud2xZbWxleUlIMEhYcWg1RWJUNy91V1ppZnVjVll5Um5Kcll6SjIx?=
 =?utf-8?B?WUtEbVlSZFFyd0xQTEQ2YmxQOUJ1TG95eEpLSGtqVG9XZXdDd05nWU9ZUHd2?=
 =?utf-8?B?ekxyUVVHb2ZBUXVZSVhXd3h5RXozYndLSkl5eW5OVkFocE9CcHI1YjBBMlVD?=
 =?utf-8?B?TUJwWVVGb0srakFEci9CcE05em9jVGxDTGVHbGhFT3AvZzRQaGg2d2NpdFB0?=
 =?utf-8?B?VmM3djJyaVJPaUdyaG9GOGlpdTMwcjJwRnhaOWpaMmZGZHVjbG55dUNFRFFJ?=
 =?utf-8?Q?lnH5jA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:35.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d86ee8-fb0e-4b74-a677-08ddcd943f2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8076

When vpci fails to initialize an extended capability of device, it
just returns an error and vPCI gets disabled for the whole device.

So, add function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v8->v9 changes:
No

v7->v8 changes:
* s/and force/hopefully forcing/ in vpci_ext_capability_hide().
* Add Roger's Reviewed-by.

v6->v7 changes:
* Change the pointer parameter of vpci_get_previous_ext_cap_register()
  and vpci_ext_capability_hide() to be const.

v5->v6 changes:
* Change to use for loop to compact code of vpci_get_previous_ext_cap_register().
* Rename parameter rm to r in vpci_ext_capability_hide().
* Change comment to describ the case that hide capability of position
  0x100U.

v4->v5 changes:
* Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
* Rename vpci_ext_capability_mask to vpci_ext_capability_hide.

v3->v4 changes:
* Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header)
  (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
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
 xen/drivers/vpci/vpci.c    | 88 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  5 ++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index da67226e4f4d..01f5746b64df 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -165,6 +165,92 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, pos, 4); r;
+          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
+                                       : NULL )
+    {
+        uint32_t header = (uint32_t)(uintptr_t)r->private;
+
+        ASSERT(header == (uintptr_t)r->private);
+
+        pos = PCI_EXT_CAP_NEXT(header);
+        if ( pos == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_ext_capability_hide(
+    const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *r, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( offset < PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    r = vpci_get_register(vpci, offset, 4);
+    if ( !r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)r->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            r->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * The first extended capability (0x100) can not be removed from
+             * the linked list, so instead mask its capability ID to return 0
+             * hopefully forcing OSes to skip it.
+             */
+            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));
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
+    pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
+    pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
+    prev_r->private = (void *)(uintptr_t)pre_header;
+
+    list_del(&r->node);
+    spin_unlock(&vpci->lock);
+    xfree(r);
+
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -206,6 +292,8 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
             if ( !is_ext )
                 rc = vpci_capability_hide(pdev, cap);
+            else
+                rc = vpci_ext_capability_hide(pdev, cap);
             if ( rc )
             {
                 printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
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


