Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9160AD6C30
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012639.1391141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGK-00008X-Fl; Thu, 12 Jun 2025 09:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012639.1391141; Thu, 12 Jun 2025 09:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGK-00005y-Br; Thu, 12 Jun 2025 09:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1012639;
 Thu, 12 Jun 2025 09:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGJ-0008FN-5b
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2406::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9eb4d42-476f-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:30:18 +0200 (CEST)
Received: from MN2PR01CA0030.prod.exchangelabs.com (2603:10b6:208:10c::43) by
 DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.37; Thu, 12 Jun 2025 09:30:13 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:10c:cafe::7f) by MN2PR01CA0030.outlook.office365.com
 (2603:10b6:208:10c::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Thu,
 12 Jun 2025 09:30:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:11 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:08 -0500
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
X-Inumbo-ID: d9eb4d42-476f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD6IhvCDbAW9ZNUpYZC4cKen3GwnXkWpDb08N7wmyl5jA7emsbsXCZaXyWCzc4ISHZvB3T0emherFR2v0YMXPoQtRYlPa0/C3Dp0lZQRxlXpuTKmb8fVmDeoExU0ErjJxCHwfo0EC68HJUGuRAa28x37uUL3AcrTQH+ESxl5JHUKKfmlDU4n9yZqjpGR3m4AyFDNBRhbuPgE813GcpPy220juulHK9XMmloSshqbM0nziycMjAO/asK4AfLPTvczSrF/7Y9bL7eAoBQH84ZwXR79vZUWBkAsNxbgBQwf/54o4GMMygIcJ5jMtwfZtPRqMfHVcgWlKp5FBZlJttgjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7auHwpyxpytntHe/oRuau3bRRq71BOpI+30rPcbIvdw=;
 b=BM/ad6MEsM/Sa/6vUtsBT43+rYWlXGpZirs34CVOXWTBVc9CKx6kYHgV7SohfEiM5KXzi9mPFAsG4oqFzTbjfFRk+rZL2TKb2Z5I8AEwVwVBLYNPb/rnCl5Qp+o6zP8Su3swSKVKQisqZgUVNXNg0OBebsamz/1Ll4oDDVwad7Rcw7bkevV6VF+7MemhphQEc5aEuFb7fjGlW8cQuY97VG2hsfinCwsgwNV9tqIc2ha+tOzL7AZdcR+T3IMGtn4m7RHBE2y/JQ4T3PWPTbWTNphwZlYOOmp6HIQ8d3YXapDaQKYe9JY1BeIwR0HSCvk6nKPL16UOu2nuY1BxifDvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7auHwpyxpytntHe/oRuau3bRRq71BOpI+30rPcbIvdw=;
 b=zfkaDcZApYlIHQzLIl2I2DHGTj3pD48Tc034Xdf1rNb9jNVfk3y7gfVT5spyUOG66G8ea1Y5j+jVIf91bKG6Ie8Pij3kekWMHyCSakwzqH2Lb3be5tRMh3oYBBzUZEXuZyKYIWOb3CkAsVwz7adwgw9S9ECwOZ9GZKsFPkLBhp4=
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
Subject: [PATCH v6 4/8] vpci: Hide extended capability when it fails to initialize
Date: Thu, 12 Jun 2025 17:29:38 +0800
Message-ID: <20250612092942.1450344-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2f39df-4a9f-4264-0e20-08dda993bb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnZSWjZobnRnTW84R3FQeFdNVmRiQU9qN01EQlZ4cXBETGpaUllnakYzRTEr?=
 =?utf-8?B?VmZSUCtzK0tDNG1jNHd2cmxYSjFZamtUalVpV1FDdUJiNzdKRjVOUG96ME1M?=
 =?utf-8?B?eHNrczBNMWp5V0hQZ1l6azRSK2NQd3FOQzQvaWg0L2lhb1pJTWk5Tk9ISEZD?=
 =?utf-8?B?MTRwcDNZNW05SkM0YUhLcm40cXZUWmxDaUxJMGJOTTV4SGFXM2lERGtXMVZ1?=
 =?utf-8?B?V29ibkkyRGgycFFhaGJzTDZTc2h5WWhEZTJFZmpQemNraFNiNTNKaEVFYzBJ?=
 =?utf-8?B?eThDeVZxS2lxWGtwUWttamhqSWVGN2pNZ1R2SUdNZ3QxeUlUY0VxZ0lySWkw?=
 =?utf-8?B?V1dibWN2S3BYRitsZklxa0Rpb25mNnJDdDJkSCt6d1V6SkF5VnRjQkRhSzAz?=
 =?utf-8?B?aU5Rcms2UmkwUG1wb3ZQZVNFWDJZRXIzNE9GSEtjcW9mL1JpazZYWlB6dmk4?=
 =?utf-8?B?OGZSaS8rbU1tWmh0TVpXTUF0U2E0aEpORS9MVzgxMW91NXFxbUpjU05MTGlD?=
 =?utf-8?B?emVmN3E0LzluNFlSOG4xSjhMQkVlV1lLR0p1ejUrSVdQQUdndyt4dUFxRTgx?=
 =?utf-8?B?RGw2eWI4MGJKZlhZMzFMczhDVWxjNi9OM2o1eUhtUkI4VDE4bElMUkZFQ0F5?=
 =?utf-8?B?bzg0ODZLTW1WTFZ3S3RRaDl2N1dFUWdMQXNBM0tOTUZGaUxxa2ZXczVPQ25N?=
 =?utf-8?B?TDhXZ2R3eFdEbWloS21PTjBFQzJtcUJ6ckc5bTdHZlFEbDhxSXJhdHlSUzFl?=
 =?utf-8?B?TWxINjljS2QwQ1F0dWJQRlF2UUw3ZEw4bzgyU2xoZFJKS3JpRzcxazBIZG84?=
 =?utf-8?B?aUdhK0phdVpLUzB3d3FkZWQ4Mkx4RG1mMnlKT0NKeTJzNThkN0hzMHBDY0Rj?=
 =?utf-8?B?YldSUUdmRGkxcVkwRFdxcUhJemo1ZVo1ZEZ0aTN0a21aZXEvYmpCQlRZSjU5?=
 =?utf-8?B?RUlERHE3MGFYRnhUdGlOUGJRQW9RSUZ4aWYvZkV0N0gwRG11bFNHQmxRSHli?=
 =?utf-8?B?eUFIaUhNNFpOTi9SQUJSYmsrYWhrZTczN1loeUlYUllWaTdKUUUxc0ltOExP?=
 =?utf-8?B?eGNId3UrSVRyb1AxdENlL2xrbHZkaXFRQlIycm5oVXpiVWE5OEtVMG9YRVN2?=
 =?utf-8?B?UEoyb0hHT1QxNGdVbXRrSWVLaFJwM1dsWW8vSGJwalNvTDkvTTJ5eFYxelhR?=
 =?utf-8?B?bkpjUHRxS0JSbFZBcmI5d2JSVmY1bzZnQVpLVktWTmtnTU5YRTRQdnJQK1hZ?=
 =?utf-8?B?RVNTYzk1TVRjTlNrb2hjTnVCeEhRMUVuKyt5YVJLMEVQM2gzdi9XbUxZZDVB?=
 =?utf-8?B?ejZxeGh5YjUxSm0raWYzMUVuS2g5UEQySTdIN0NqbkIzKzdrR0JjL1NqTjll?=
 =?utf-8?B?ekY4UFN5Z2lIRG80MGFFR2NJSWp3Zm1GR1AzVThYanhsaWN6TStKd0wrdFkr?=
 =?utf-8?B?RWxUTzlyNEtqUW14Ty8ydWp1RTVLdy9ENTBVeSsrazhCMWgwd3JOZGZwMzVN?=
 =?utf-8?B?VDhsY2E3UEpmZDhOZUY1UUFsYzRPS1M0bmYzRDE1QXdXNCtRcHNNdTc0SUx4?=
 =?utf-8?B?YWx6NG1OSUp5UjJUemRzUEJhU2JhYmhLWVNDd1NndDRJWFh2MWYyRFQrVHNS?=
 =?utf-8?B?TzBjYUNGa3FaMERIUGJsTW1rcCtzK3JSQWhpZ2QxN0pQb0ovQ2NlajBxMTA0?=
 =?utf-8?B?dkxsc0pmNWNFTmkyelNTcUxlZU1sc2ErbzAvTjk5SG9BbUpnZm1SVEdCTkx1?=
 =?utf-8?B?bzJDR3NxM2Y0YVB3WkhkdFNndzZBRjRlNDBVcXMvaHI3ZFFIeUVySlBwMDMw?=
 =?utf-8?B?WStjbkNaeWJGWndZbk9RcXN0ZUlZMHFVYllNY2NaT3RWLys4ZExGZjcwZzJB?=
 =?utf-8?B?NGV2bDVMMkQ2U2FiT1hDdUNUV2huam1vQVlJcjdIRDFXTkdyRXRMckVMUW1R?=
 =?utf-8?B?cGZUaWE5ejRyZUFYOG1HSFkzTXVUd0YwSUw5YkRPQmkxUzBpMDBKOFlKUnFn?=
 =?utf-8?B?SUR0SmV4dTZrOC9DUUtNaHVTeFcrU24xc0pKa1VaYXNJLzlzM1Jrb3dybDNk?=
 =?utf-8?Q?1LB/DI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:11.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2f39df-4a9f-4264-0e20-08dda993bb11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

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
 xen/drivers/vpci/vpci.c    | 87 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  5 ++-
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f61dcf9e8131..0c266dd6a265 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -165,6 +165,91 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    struct vpci *vpci, unsigned int offset)
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
+static int vpci_ext_capability_hide(struct pci_dev *pdev, unsigned int cap)
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
+             * and force OSes to skip it.
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
@@ -204,6 +289,8 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
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


