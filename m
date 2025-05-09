Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85770AB0E31
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979881.1366397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgO-0005M0-Rz; Fri, 09 May 2025 09:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979881.1366397; Fri, 09 May 2025 09:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgO-0005HY-NV; Fri, 09 May 2025 09:06:16 +0000
Received: by outflank-mailman (input) for mailman id 979881;
 Fri, 09 May 2025 09:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgN-0004kr-0z
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:15 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2409::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2678fc-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:14 +0200 (CEST)
Received: from BYAPR02CA0029.namprd02.prod.outlook.com (2603:10b6:a02:ee::42)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 09:06:07 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::99) by BYAPR02CA0029.outlook.office365.com
 (2603:10b6:a02:ee::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 9 May 2025 09:06:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:06 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:03 -0500
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
X-Inumbo-ID: db2678fc-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRUoU7ePpLk1KsgzAz6ANHdNsxqxr7EXBGCSDRxEA9ZZQXjkqcXf548/IrfFkiq88lL8FbUQ1XmKoJbdVzWPQvRism0hp8b8n6Z5zFUY4cyKY6zjdA1KBbZW9o6+LSXjMwYsW0mB6f2YT8hSCaXuBzCl7gJqElHDKnp6Gx43AadTgU0NjVBET3U0sCdOO/gIh6ji+tKCt+Sv+a6bYhkhgvK2rtFjpTMDTjfVR/AQ3AK+42260vYjv6A8656M9NWrt0BjZnpbL/4a7X4c1i0DGSbUZeFm77bNQJBkrVWBhkRB+WiDi/st4X42gWW0Pvcalc+U8Y/eNsalsNQMOfCYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMW/1vCFD6116SzFGwR5Z8wmoiH7OylpThQIjgPoCaY=;
 b=orqvDK3De4WisxLSmKmZtE0cuBF5pG1tipUTMRK4acTJfxgDnzNNTC2U4nxQNBHYzETAJmhoxPCyUUjDEsnnHx+UiEIv9jYYzzc5+dmk6qw4OV5yFlOGuiP5IUoEkgyCFN330FaBRUxkDAAe0IJe8DRIJRg717mX9tHMjltfi17A/5eFfqfW3PtgOXPsjC8ESekA/omR5/mjq4Pgc8L9lAIylD70yO+4H6xe94Faoe44MRGHydFLh8ST3sv3r5avE3XcbtNX64XCHxHe+TVKwpoKCUXL7N7gsAF13QfeMQ0ldoHRRcjnDL4YxbFwaihzFWfQMYyk78iEU0ciGkEa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMW/1vCFD6116SzFGwR5Z8wmoiH7OylpThQIjgPoCaY=;
 b=oJL0bWLM96fUPAeSZP6yjFv879+8rR+1gwXT9ee8scvhUep3+KABCLaaV9qbjiGZ9gDuoh1Zq9v1ITIxQ9M+trDBlPIuXRMbSGb0AyMqxJtH9B72Qg2oErpiPoiy6VUmmFY9OE2wnClN9Cixrz3h4yb9ZPA6NjCXkBIUZ3JDGZg=
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
Subject: [PATCH v4 04/10] vpci: Refactor REGISTER_VPCI_INIT
Date: Fri, 9 May 2025 17:05:36 +0800
Message-ID: <20250509090542.2199676-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 937fdc0f-0fd0-4a8a-6826-08dd8ed8bbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVZJbDFYSkV3dWptcXZqd2xTdURuSnVIeEVXbWlJYzVkWXNaK0xVNDRmdHFy?=
 =?utf-8?B?LzZ2TnNtM2ZJZkpSNUxYRE5HSUJhcTl5cXY0bmpXaWZZY25yNTlyM2Jid2No?=
 =?utf-8?B?cFhkRm1XMnllSmJvVWNTS2htV1ZUS3VsY0NWOVdNNU1OeUZzMjRlSllTYUcw?=
 =?utf-8?B?Q2VCbWo0MFlXMjEwM2V4clorVHJoNHJabFZ6TnRqeGdaOGVWSVppRjBnWkRZ?=
 =?utf-8?B?Z1dFb1o1MGowSnlzVy9XbUN2bUdoN1luZjFTNGpsNmhUeks3UHAxc2h1VFp3?=
 =?utf-8?B?UXFvQjVsbkMvaE5LVmlvZmgxOUJqeUdrWmF4ancyUCs4VTFjeDVDS01Lclp1?=
 =?utf-8?B?VCtVQmxOLzBua3VjUUlNc1ZmVWZpNElzdEtzNnMyTWlDV3lLMFNPYUdiSkxL?=
 =?utf-8?B?V2RJY3ZyVlB4TVVKSURVZENyMHg5b05WVlRBSEZkNlVaV3J3ckpJdGlGb2Yy?=
 =?utf-8?B?QXBrYTJhUE5TR0ZQVG15aC9BaG1veDlBMEE2MjNpZUEvMExuVFpKd2s4TFhl?=
 =?utf-8?B?L2t5dzJDUTVwN285cGxSSjlmbDcrSGRPUVZ2cUFDMFpub3BITTR0cGhjcStH?=
 =?utf-8?B?aHVQQWJaQUtvL29vTFB3bnFUTEZFeUQ2Sm90QUNVMFJBRWJTQlRSckx1dVZY?=
 =?utf-8?B?WlpXWERMV0JkTE1XTkFsM0ZYKy9QT3BXSzFhcEgxYkxmOUkwVDUxSThvcHZC?=
 =?utf-8?B?SDkwbDFrRHJpNTBPYmFSQ2dBUjJtUFF2SUJFYUpzTFlUcmNWUTliOWRlWURh?=
 =?utf-8?B?L3ZRK1lkenU1VVdOdnJHTmZXSVlwTWU2cXZrSHRLejNsdmJaSUV2VE9ZNmpB?=
 =?utf-8?B?Z2tYbGtWZ1NhMGZNSTRtT2QxbEJmOXFSK1F3QjUwNkVtbjNqUE9tNmdXWHhn?=
 =?utf-8?B?VmxBLzlhbzJiOSthTk1BRHZyd2hVL05kWFowQ014eHdSSGRqN0hMNEplY3pV?=
 =?utf-8?B?NFphSTdlTVROakxYZTJjdTdlOWplTXRwRHppTFFveUdiOG5yVk8yWFJ2akl6?=
 =?utf-8?B?UGJORGtYMTBWd3g0eURDY1BhMUc1NHpjMTk3UysrclUxMnRMdkF4anJmYm95?=
 =?utf-8?B?VENKUFc1ZUtnb1JBS0NSYTFyRy9rVG1uLzYvWFowM3h0YmF5ZXJIeS9FS2Zl?=
 =?utf-8?B?a3prS25SODVZbVpvbXB3NE1YSjE3aHp5bE1hUmJNRVVkeFBJOWJJay9RWGRX?=
 =?utf-8?B?NXZWMHZjWDFtNjF1UkQ5TEcvQ2gwNlJvVUpjTEM3RjBkd3M0UVNyS091SHRN?=
 =?utf-8?B?K0VodzIyK0hmS24xYWVXMGlrWldVQjZCeVFvYUt2bFUxRnRDQXBaUDl4Tyt4?=
 =?utf-8?B?SmVTZGJqcEVwUGl5Rnk0U0F6RWphQnJwWGE4dU9pL2xsSnFUbjIraXE5STJS?=
 =?utf-8?B?ZEV0NXF3cCt1SjVnVG9JclpiZHMrTXVKNitYbTkvRkFjb3BBNmx6c1VYeGpv?=
 =?utf-8?B?dUJJT3hvQnl2bFlhNVJSY3ZQZU1pNnYwUDdhU09MTzM5c25TdlRzRGhZWDhr?=
 =?utf-8?B?QWFaVWJISHdXY0hHWWdubThSK2N1aE0ralQwd1VKMS9sRWtta1FJaWFIQ3B0?=
 =?utf-8?B?dnBPMm1uSWxLdUxaOW12T2Z0Tlg1VHBSeTB1NDk0dzQ3MVBXSjlOWTRUS1J4?=
 =?utf-8?B?U2pMVS9NQjhoakxIWnQySnFhOVZkelFnOG9OVUpPcm15MXRBdTJoQ1hrRUNI?=
 =?utf-8?B?aDZsWXRCMXRKbFVFMlJxenA1MEZ4VGNRN2w3TUZtUjNjalBkRDBWMFV5TU0w?=
 =?utf-8?B?OXpGR1RqWjVyQUNHcUZCZCt0M1hIYktHbHZVc1lQbjBRUzVRdDBZelN4Q09H?=
 =?utf-8?B?L2hpQWVmNGxIM1JzalUwNVRIKzNDc2FXYlRYdTA3SjlVemd3Z3o5WjFjZkpn?=
 =?utf-8?B?WXBPMm5oclRWZTJUUWpRTytWWi8zci9EV1JQQVlqVjEwdy9zZjUvSTZ0RGx4?=
 =?utf-8?B?dWhjVkhZZjd1VTlNc2g0cU1Ia1pjdFE4dUtQR3MwNi9ITXlSeHBvcTJOa2hq?=
 =?utf-8?B?T05mR1JQeERieTh3bUFET042V0hEQnBJVllqS2paQ0gxakNjSHBhZG1XZTla?=
 =?utf-8?Q?mwai74?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:06.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 937fdc0f-0fd0-4a8a-6826-08dd8ed8bbbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Refactor REGISTER_VPCI_INIT to contain more capability specific
information, this is benefit for follow-on changes to hide capability
when initialization fails.

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

After refactor, the "priority" of initializing capabilities isn't
needed anymore, so delete its related codes.

Note:
Call vpci_make_msix_hole() in the end of init_msix() since the change
of sequence of init_header() and init_msix().

The cleanup hook is also added in this change, even if it's still
unused. Further changes will make use of it.

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
v3->v4 changes
* Delete the useless trailing dot of section ".data.vpci".
* Add description about priority since this patch removes the initializing priority of capabilities and priority is not needed anymore.
* Change the hook name from fini to cleanup.
* Change the name x and y to be finit and fclean.
* Remove the unnecessary check "!capability->init"

v2->v3 changes:
* This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
* Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
* Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c |  3 +--
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   |  8 +++++--
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 47 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 30 ++++++++++++++++++-------
 xen/include/xen/xen.lds.h |  2 +-
 7 files changed, 69 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 2915c801adeb..9373d1b8be0d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -855,7 +855,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1051,7 +1051,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..ea7dc0c060ea 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 74211301ba10..f8ce89b8b32f 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    spin_lock(&pdev->vpci->lock);
+    rc = vpci_make_msix_hole(pdev);
+    spin_unlock(&pdev->vpci->lock);
+
+    return rc;
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..026f8f7972d9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 2022b61ea7b6..f03e1a8eebc0 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern vpci_capability_t *const __start_vpci_array[];
+extern vpci_capability_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,35 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = __start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        unsigned int pos;
+        int rc;
+
+        if ( !is_hardware_domain(pdev->domain) && is_ext )
+            continue;
+
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+
+        if ( !pos )
+            continue;
+
+        rc = capability->init(pdev);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -128,7 +157,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,14 +187,13 @@ int vpci_assign_device(struct pci_dev *pdev)
         goto out;
 #endif
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
+    rc = vpci_init_header(pdev);
+    if ( rc )
+        goto out;
+
+    rc = vpci_init_capabilities(pdev);
 
- out: __maybe_unused;
+ out:
     if ( rc )
         vpci_deassign_device(pdev);
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 61d16cc8b897..7d4274e178ee 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
 typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data);
 
-typedef int vpci_register_init_t(struct pci_dev *dev);
-
-#define VPCI_PRIORITY_HIGH      "1"
-#define VPCI_PRIORITY_MIDDLE    "5"
-#define VPCI_PRIORITY_LOW       "9"
+typedef struct {
+    unsigned int id;
+    bool is_ext;
+    int (*init)(struct pci_dev *pdev);
+    void (*cleanup)(struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAP(cap, finit, fclean, ext) \
+  static vpci_capability_t finit##_t = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+  }; \
+  static vpci_capability_t *const finit##_entry  \
+               __used_section(".data.vpci") = &finit##_t
+
+#define REGISTER_VPCI_LEGACY_CAP(cap, finit, fclean) \
+                REGISTER_VPCI_CAP(cap, finit, fclean, false)
+#define REGISTER_VPCI_EXTENDED_CAP(cap, finit, fclean) \
+                REGISTER_VPCI_CAP(cap, finit, fclean, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..84ec506b00da 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -188,7 +188,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.vpci)             \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


