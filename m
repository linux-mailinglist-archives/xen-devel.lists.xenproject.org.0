Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81575AC3D2D
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997346.1378274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPh-0004kC-J4; Mon, 26 May 2025 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997346.1378274; Mon, 26 May 2025 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPh-0004h5-E9; Mon, 26 May 2025 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 997346;
 Mon, 26 May 2025 09:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPf-0003hH-UO
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c248069-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:30 +0200 (CEST)
Received: from BL6PEPF00013DF9.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:c) by SN7PR12MB7882.namprd12.prod.outlook.com
 (2603:10b6:806:348::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 09:46:25 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2a01:111:f403:c922::3) by BL6PEPF00013DF9.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 26 May 2025 09:46:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:24 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:21 -0500
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
X-Inumbo-ID: 4c248069-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZNcvluNG6GQdfWF4G0nlv/cxQmeZ/eWjgW8oiCa9zfPRL90y7wABTeF/SPp0M5DfWje2Xb3G7O9v+wcy6UjyNwFddBiGZ7uyv1CNs43fG8cyOTcup+MMvDXHRjbDD3moX+C0FRMAOHL7KpkSVpY7jsFT9Fgno58LGArqOqXxrKVu3hicNfl3GXbHNqhe0cfOB8w66aVqQBRMcY+pE2ZCke/HJhQ0GrW90oAYptrSrFjayGznsqonWrWZyq9B9C9qh8OVvKtIsbZousaLXHBoVhbr29l9GKXVWqnZA5iAg0q1JTBQvWwBUTk90XuW7Uk3VikrOduo57Qu8chpjVbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZipsPW/ns1bYXVu9iRhK77+DF2OaAhLQxGjFTNkOoi0=;
 b=WqGKTiNXEaiAM0d5ppcbEGjsjsoY/vucawaaBxlj4FH6dOvkctu+g4wCg1prFWzZmmhMiXLP9ppopvVlwWeMFLPbr5OvA1TcMfO+9iAE/j/oyL0vqyOoKhBsMYIY26VGJcnI7v5SF3HzZPEK7CW4ATb1zEwEiaaYiwPT9dTuP91C5EA0w2aSeZyAQbCEkn3iurXcFhRm12WF9B9/97INwyxcIke4aZtJ4VnGDibRwKYVMaqwyQKz5JAZBsPkDSg9iHUTQaNpp4CpirVsCwMZ2vicrn3kGexS6FCCG4CAdjvTXK4WW4lcZ2imDrW8uvfFSQbZJxVjJ7XF3SZwqQfdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZipsPW/ns1bYXVu9iRhK77+DF2OaAhLQxGjFTNkOoi0=;
 b=KCaahkoOQg09xeREJdIRjlk0u/hOF0vwcaO0XABiYXFZT9VNoQneZbYkl5zH5Z/QvN/iepplNExuKPtAn+X6uZyfbMeonMmzgLn+DjrepOsOPsfT3tBwXRxNv54khjxzihJb6duuKwzhxbLsM9UlUlhUM/zwm6uug7YxSmzbsNc=
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
Subject: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Date: Mon, 26 May 2025 17:45:53 +0800
Message-ID: <20250526094559.140423-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SN7PR12MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: c28d7e39-a65a-4d7a-aef9-08dd9c3a2d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ymd4WEZzNURJMXVRQVNMcEJWNmptOHZ0YkxCY1lPdk5HVXNXaFVtNjYwTlRk?=
 =?utf-8?B?QnhtVVQxQ1RlRyt1SlhmSUxTTE13SG8yTFplQWJack5kS3Zidlp6WGdySkx2?=
 =?utf-8?B?ZHJKSTFWamdzaFNXYWV0YVZHRU1OL0RvTUtnWjJvRTk0MmoyTnhZaHprQkg0?=
 =?utf-8?B?anRwWGhQNm1ibnZOM1lQWmNrNWE5Yk95SW1VYTEySDJ2VWJ0LzBoTXRTd2k1?=
 =?utf-8?B?Q0JHR0NVV0pRVnJFS0puVjJxRDlTcFpMT1MzWWhteElId2wrUkR6Z0RUN0Ev?=
 =?utf-8?B?OG82cnBvRHJhV1k2S0g3cFFpVzZvWE5aUFdJbnNUVmVYYzFuQjh5UDREWDNt?=
 =?utf-8?B?ZnVpWGY1dTVLMVhUMEV4UHYzc0l4a0JkNnJXOHJNQVdYTzViUzZZcDh5Sklq?=
 =?utf-8?B?Y1YvK0JKb1RjNjN6d1BPS3RSNnk5RVVXcEg2MzZHdTBPaWNFR2ZZcTNWc21E?=
 =?utf-8?B?aGhwMXZPNThrZm5TSWZXREpDSUdOdjMxRzc3THpYdVZqQTBwQ0NwMXJ1K3FD?=
 =?utf-8?B?c1pjV0FQRXJKTVpybzJwRzVmdnIzZWd2L0RIeW1aU3V3M1lZekN4d3JNVlIy?=
 =?utf-8?B?ZE1mOTdWVkRiWWlDYytqWmloR1pCejFDUUhHejlMT05MTitqQzcxcUtsMnF2?=
 =?utf-8?B?NTIrcDNtQUdBci9tbkpPTldQZWdZUDdvTllHTTMwQ1RyTHZxdHNaaHhaSktw?=
 =?utf-8?B?dVZLdVVsVFdWVWRrYnVvZERaTkpZZzJVbkZVVWsxUldsZ3lUOWovUytVWlJZ?=
 =?utf-8?B?KzkxR24zNTRZWnUxb0YraGhGM0FZZUZ5N21ycEE2ZDdoL1hnTjN5RWgxdlgr?=
 =?utf-8?B?RWY3L3ExemRaMXhJN2Vwd1ltakxvcGkvRzFUK1RiVEM0ZVd2dGRzMWdoaStt?=
 =?utf-8?B?ZjhHUi9xR0t6Q2pLckF6aVdUWGZGNnQvYkJ2clhWRERWeEpRdjhES21IZEN4?=
 =?utf-8?B?N2RPM0x0My9Dd2ZKSU1oYUhDQmZjSEFqMXdncEFBenJaeWFYNndkNDZXSmNM?=
 =?utf-8?B?c0lJR3FNVGpqVXJDNm5lS1Qwc05CVnlTQXdSMHJsZVczKzFzVHZjYVNlRGhW?=
 =?utf-8?B?TE8vZTRhbjhWVlZvU1dXczZxWlUreGxoR3VjUFAxQ2dCdUlZKzVUUisrcEFF?=
 =?utf-8?B?cUUwdjNBYnVmY1RkaUFZN2dxR0JyeU5EWlNyYkllMzdob0I1VGlHTjdqVlJm?=
 =?utf-8?B?YjlUSGxEMzRkaWxGamgvTDJyL1pqdUZLOThXSjdQMkFUZmR4Ti9rYzdZRlhU?=
 =?utf-8?B?NXpoUDJHOTBtUnhHSitqUDdJd21vYmV2UjcvOEFhOGhxdlQ2c2hyV0hXRHhC?=
 =?utf-8?B?UXZ2djNrZlJ6RGpPY0VUTUIvSWhGbHl0c2dCZmhaZlQ0NTBZelpSeUw3QVdu?=
 =?utf-8?B?bHJ4TWxvNHVuNHhMd0d0YWt1dldId0R3U1VLc3FFbHlCQWxuN1ZSYVQ0ODBN?=
 =?utf-8?B?RWhDbEVncTlKaE1FMFE1Y0lBemFDbVVqOUczL09qWDg2aFFBSXpya0o3V0xq?=
 =?utf-8?B?aVpMVm1pVUFKSFFJa0l4RVNRY1FtTVZ4YTRaMDVQMTg5YXhjNzNGRHRqMUJQ?=
 =?utf-8?B?TEZ2YUF0eVNqa3dRczRZNXYwTTJRQ3NMVDVsZlh6aUMrODJuaXFDdDB2c3Za?=
 =?utf-8?B?NGxSUk5leEE3VzBiTVh3M0ZucFpjbWEyVTcyM1lVMHNpb2NYQytWRUxETm5M?=
 =?utf-8?B?NWZwQjd5Z01nZG05SDJWZC9VS1pSNG1sRkdjYXpPMGR0YkhwZU9ISDhzTFNw?=
 =?utf-8?B?aXFEUFl0ZmluMFIrenN4dFRTM0dackJSTXRiUTAvaGhqMnBRWVRNdVlkOFlK?=
 =?utf-8?B?MkFUU0N6S0swR1dKcGJyL2JXSUY3VHhzcllKZjRnZTlDTlR6NTUzeFFEZFd5?=
 =?utf-8?B?Wm9PM2loZUVkVnJaK0FLaEQ3ZnVpN1dxSnBIRzZlUWRoS3JkWUVPMkNDMXR3?=
 =?utf-8?B?aUlQQlhrajFBanR0aVpZME04MVZPOFZOd0pST0hzU3BYa1h3ZVluS1hUck5v?=
 =?utf-8?B?QkVuV1pjN2RPM0k3OE04M0h5VmJGVERwR21sREtwUDl3WXBLV1J6eDRHeVA3?=
 =?utf-8?Q?LL65X5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:24.0702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c28d7e39-a65a-4d7a-aef9-08dd9c3a2d74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7882

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
v4->v5 changes:
* Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
* Change cleanup hook of vpci_capability_t from void to int.

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
 xen/drivers/vpci/vpci.c   | 46 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 30 ++++++++++++++++++-------
 xen/include/xen/xen.lds.h |  2 +-
 7 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 4b2f761c9c24..9fa1cda23151 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -872,7 +872,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1068,7 +1068,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..2d45c7867de7 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 74211301ba10..674815ead025 100644
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
+REGISTER_VPCI_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..9cafd80ca2c9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8474c0e3b995..2861557e06d2 100644
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
@@ -83,6 +83,34 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
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
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( !is_hardware_domain(pdev->domain) )
+            continue;
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
@@ -128,7 +156,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,14 +186,13 @@ int vpci_assign_device(struct pci_dev *pdev)
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
index 61d16cc8b897..e5e3f23ca39c 100644
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
+    int (*cleanup)(struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_PCI_CAPABILITY(cap, finit, fclean, ext) \
+  static vpci_capability_t finit##_t = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+  }; \
+  static vpci_capability_t *const finit##_entry  \
+               __used_section(".data.vpci") = &finit##_t
+
+#define REGISTER_VPCI_CAP(cap, finit, fclean) \
+                REGISTER_PCI_CAPABILITY(cap, finit, fclean, false)
+#define REGISTER_VPCI_EXTCAP(cap, finit, fclean) \
+                REGISTER_PCI_CAPABILITY(cap, finit, fclean, true)
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


