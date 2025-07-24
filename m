Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59FB10037
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055182.1423655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqn-0005hc-L2; Thu, 24 Jul 2025 05:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055182.1423655; Thu, 24 Jul 2025 05:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqn-0005g2-Hm; Thu, 24 Jul 2025 05:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1055182;
 Thu, 24 Jul 2025 05:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqm-0005TY-9K
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dc0d515-6852-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 07:50:36 +0200 (CEST)
Received: from SJ0PR03CA0136.namprd03.prod.outlook.com (2603:10b6:a03:33c::21)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Thu, 24 Jul 2025 05:50:31 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::e6) by SJ0PR03CA0136.outlook.office365.com
 (2603:10b6:a03:33c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 05:50:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:31 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:28 -0500
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
X-Inumbo-ID: 1dc0d515-6852-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPNeZ2CL/cqDWUBdCCL7yarWSfci2qZL/RmCGDZPk61/J3n8IE0wjaJi9/Qn9jdS6R84hVFYNY232mF3DoSTXwzGKZ3ZQ+HDtP5chaBtOMAWTp75URiyCAgt+f/LjW9c+c5E9TtaVSmLlwPyXcKr6z3EKMorTsBbVubxbLBtthk8Hduo1EsKwcKqxJW2jtBVfvQWhJzCZj85eSKjHc5O8CKgk81YjRttMWyPsn28NLr2PbOjk+5h05iJEj3f1hiySzTAUnClI7G7qV60+G5MYB3Ni4pFsyf2CiwVac3Yh/FpuWrFMkGVEFkOs/tnmESy4dVv8jL/tBUOUXVcrB+PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op9jNEE5y7E5QsQP4lgC7JiCXflmdyD+5+TaoieFIeQ=;
 b=jFM39n0IDmy13gE/WrKtYbQaBxMuaVayHbXdy8pfpkU3TZI0RrpoMK9q26/dIms63xSSGxIiDUzKx5jKVuqBLCRKXrtASblCItgWHtVQnPmUvMT2vKL+28AsyH3YD8OtF8y5E2VU5NGj6HY4pRAAtRgqnANPYdNtJ4LMyyVc07bCeMBENKV3Mc1aNYYLjr+whLfYObL639L3+spqQtPVmmFITQ21o465SA7/ZR2vlKMxltxyYLfnKTeHjwraQKTvZ3X18d4aFGZRKBJQjhuGIsclQDABkqKP7n88QDIWONzWwPGKUDSiOJsmMMkQGcrFo7vxg3uuGTQTWZmmNSUgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op9jNEE5y7E5QsQP4lgC7JiCXflmdyD+5+TaoieFIeQ=;
 b=fgkmnQTL8QD8ulZYoNAsqs32ZSa4i8saW1HbkGrzYbZWB5EpSmj7W/0GIX7vgYyP9w1GEGS9EAa9xnbGVFbCoBSyNae4Jwkc5VW4RGKGS1iL5RWzmfsAq5MiY2F3sVM/HMPxuimvCpxrV+NAPAJYLeAp3zf3jyn3HbJspotyuCY=
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
Subject: [PATCH v8 2/8] vpci: Refactor REGISTER_VPCI_INIT
Date: Thu, 24 Jul 2025 13:50:00 +0800
Message-ID: <20250724055006.29843-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724055006.29843-1-Jiqian.Chen@amd.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: bedfde75-db70-4cd9-ac36-08ddca760053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YW5VMVRlckJDMGpPT0tvQ3hIOTVEWnE2Mk1VTnUvZHdiY0hxQm9SbGR3OTQ1?=
 =?utf-8?B?NWUwdk1uZVh4bFg4cnlYdW1aSDVUdUFlZjYwRHd3TDE2RTRGamlFdi9TOWdF?=
 =?utf-8?B?by90VlI3VzhCT3M0OU8weTVXNlFLMmRqM0NUNzdNTEJFZmR2TUxhd1ZDS2pF?=
 =?utf-8?B?MmtpM2psMzJ3a01NcldKZjFzeWFWem9GWHFZNHhiRzNWajhna0xvczd2MEo4?=
 =?utf-8?B?ZGdVNDRVOVd3cHVmL3hWNHYxRjdTdlZNaEltVVBPV2l3MmJZVWFTWjFoanRD?=
 =?utf-8?B?NWpsV0pEbW5QeUJrbVlZT2poaDhudnROblNJT2dhenM3T0o0WGg4bEdoS04v?=
 =?utf-8?B?eng5K2V3RXd2WFhFME9NdjdOUVk3OW9mUlZkK2ZnYmxrbHRtclZRaDJkQmZu?=
 =?utf-8?B?V2FhZ1AxUEJZdGIvUFZDS0MvaFFyUGlSSG1BOXJ3UExjaDNwenRva1FOY3J0?=
 =?utf-8?B?ck5GSzhYY1BZS0R1MzhUVTZ2dWN2SmZmeWxUa0w2bmpoMXI0UWhlMTMrZlZu?=
 =?utf-8?B?NklJRmYxM0Z6SVFpSjFmVTB4eDNZTUxaWDZYb0N6ZG4vdGVuTkQxNXBFYVhi?=
 =?utf-8?B?Wlo1dWI2MGM5cCszem9kNFhnWVAzOFRTcnlwSWU0empjTGswNDN4R010YjAr?=
 =?utf-8?B?emk4cm1tQjg5R2toVlpKV2ZZSFRYOWtpRHlKYnFTVTBiTVZuUXpmNUE3d1lw?=
 =?utf-8?B?NUYzaEdvRkUwU2JEa2hTM0VmaVVVZkxXRHBqU2YrUkZ3WXNEMVo0T1cyZTJU?=
 =?utf-8?B?SFJHZE5pdklGdnRIOEhNZTBtbHNTS1FxUXhiaU5lT0RadlY5MFRDSk1VMWZx?=
 =?utf-8?B?U0dzN1diczBrcklhVGhabkN6aS9CZmgrUEIvT1V0NjBzbnV6STAxMEVseGMr?=
 =?utf-8?B?SnBhbDQ4WkhuYnN3Mlorb0EwdVNNQWNlWSsxR3kvZWF0T09MTXhJcXJIQjhK?=
 =?utf-8?B?UVpvdG11Wk9lRXIwOXptNXRwOW5sN2NNSzdVcnlHUW1jSHZjb2lsYS81M3lN?=
 =?utf-8?B?OGZUNGRZL1F6dXJqbVk1bDA3WE5LSnQ2dS9UQXNGQlVxbkdNTEhJL0ZXNFRy?=
 =?utf-8?B?Tmh1U042Q2dqYzZRSm5mUG0rbStZR2g3SzM1Q1BqOHR6U09GVFR4SVFGa2xJ?=
 =?utf-8?B?YUFvM3pFNUQ4Qllsc01MYmRSekt4cG04OXNydElzaDFQNDZnRHNUdFh2VzF0?=
 =?utf-8?B?Yk8yM3ZuYlQ4U3JYS2Z6OUFSaHFVN0l2N2dVTjB2WDhhVGs3TkFVZEhRN2U2?=
 =?utf-8?B?ZUt6WWMyVGN6dytlcXhMR0pXL0dtZEJGRUJNOHdRUm9lTGdpSXQ1cFhSSVZt?=
 =?utf-8?B?ektLSFhhRE5VQUI1ZithamVGUmgyL1MrNFFQL3QralJNeTNPWlF6OU5MeE9z?=
 =?utf-8?B?cEhFVCtmYnBjMlV1UWcyOVhFNExoSTRCY1Z2VDFxV3NEZ0ZsYzNwNTdqMk44?=
 =?utf-8?B?N1JvN2VnbThpdThKNFkvbHhEVUdZODVUN2FmQWNDWWc4RC9Xc08yOGRlSWNH?=
 =?utf-8?B?L2EvUUNQbDJDaXZVcDEwaHJBaUp6Wk1xYVAzRXFYaGtBLzBuWnJoWVBBeE1o?=
 =?utf-8?B?RGlRU0UrVWl5UXAxZnlkRmlLNXViMUR5UkJYcHk4cUNXT3FZSkRpek0wdlZB?=
 =?utf-8?B?VERpOW1PNkp0d0NDTllHN0UyV0hQcEJ3TENGRU5DOGwwd0txSndHc2YwaGJH?=
 =?utf-8?B?V1NKdmRqYlBOTWljaGVUS1BSTitGVVBHd0FGeUhXN0hyejFOYU1IMm4vQ2lu?=
 =?utf-8?B?UTZCRFRuOWJSRER0d3V4alJjSUxBSkFWSEZDK0E1Y3IvYU1SWnFZUVYxVE5a?=
 =?utf-8?B?dzdQY3JzVUZhRFhmR3YxZ1B2WXJIQ2ZmVVFkeVUwSURLU1VqZEFPbXowQ0d1?=
 =?utf-8?B?WTNOL2ZGZ2w3ZXFGNlE4QzhjTjRmaW1LRUI5TWsxYnBvdldMekxrQTNqQy9o?=
 =?utf-8?B?b3ZJMWRDREg0MGVsWFNDNDMyb3h5ZW9wQThMMHl5Z3hIc01qQ1VzNXFzVGVy?=
 =?utf-8?B?dS9WNzU3VVVxYk45ZjQyeTNVNEd5L1lBL3FsdGZ3NjBuNk1pazl4MnA4QWYy?=
 =?utf-8?Q?1cwBT6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:31.5186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedfde75-db70-4cd9-ac36-08ddca760053
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373

Refactor REGISTER_VPCI_INIT to contain more capability specific
information, this will benefit further follow-on changes to hide
capability when initialization fails.

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
v7->v8 changes:
* Recover vpci_make_msix_hole() call in modify_decoding(), which was  deleted by wrong.
* Add some comment to describe why need to add vpci_make_msix_hole() in init_msix().

v6->v7 changes:
* Change the pointer parameter of cleanup hook of vpci_capability_t to be const.
  If change parameter of init hook to be const will affect init_msix, and it assigns pdev
  to struct vpci_msix, so keep no const to expanding the impact.
* Delete the vpci_make_msix_hole() call in modify_decoding().
* Change __start_vpci_array from vpci_capability_t* array to vpci_capability_t array.
* Change the name "finit##_t" to be "name##_entry" and add a "name" parameter to macro
  REGISTER_VPCI_CAPABILITY.

v5->v6 changes:
* Rename REGISTER_PCI_CAPABILITY to REGISTER_VPCI_CAPABILITY.
* Move vpci_capability_t entry from ".data.vpci" to ".data.rel.ro.vpci" and
  move the instances of VPCI_ARRAY in the linker scripts before *(.data.rel.ro).
* Change _start/end_vpci_array[] to be const pointer array.

v4->v5 changes:
* Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to
  REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
* Change cleanup hook of vpci_capability_t from void to int.

v3->v4 changes
* Delete the useless trailing dot of section ".data.vpci".
* Add description about priority since this patch removes the initializing priority of
  capabilities and priority is not needed anymore.
* Change the hook name from fini to cleanup.
* Change the name x and y to be finit and fclean.
* Remove the unnecessary check "!capability->init"

v2->v3 changes:
* This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
* Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
* Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove
  failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/arch/arm/xen.lds.S    |  3 +--
 xen/arch/ppc/xen.lds.S    |  3 +--
 xen/arch/riscv/xen.lds.S  |  3 +--
 xen/arch/x86/xen.lds.S    |  2 +-
 xen/drivers/vpci/header.c |  3 +--
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   | 13 ++++++++++--
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 29 +++++++++++++++++++-------
 xen/include/xen/xen.lds.h |  2 +-
 11 files changed, 74 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 5bfbe1e92c1e..9f30c3a13ed1 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -57,6 +57,7 @@ SECTIONS
 
        *(.rodata)
        *(.rodata.*)
+       VPCI_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
@@ -64,8 +65,6 @@ SECTIONS
        __proc_info_start = .;
        *(.proc.info)
        __proc_info_end = .;
-
-       VPCI_ARRAY
   } :text
 
 #if defined(BUILD_ID)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1366e2819eed..1de0b77fc6b9 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -51,11 +51,10 @@ SECTIONS
 
         *(.rodata)
         *(.rodata.*)
+        VPCI_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
-        VPCI_ARRAY
-
         . = ALIGN(POINTER_ALIGN);
     } :text
 
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8c3c06de01f6..edcadff90bfe 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -46,11 +46,10 @@ SECTIONS
 
         *(.rodata)
         *(.rodata.*)
+        VPCI_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
-        VPCI_ARRAY
-
         . = ALIGN(POINTER_ALIGN);
     } :text
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 636c7768aa3c..8e9cac75b09e 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -135,6 +135,7 @@ SECTIONS
 
        *(.rodata)
        *(.rodata.*)
+       VPCI_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
@@ -148,7 +149,6 @@ SECTIONS
        *(.note.gnu.build-id)
        __note_gnu_build_id_end = .;
 #endif
-       VPCI_ARRAY
   } PHDR(text)
 
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f537f3f25d2a..469f4977441a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -858,7 +858,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1054,7 +1054,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..c3eba4e14870 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_CAP(MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 74211301ba10..eb3e7dcd1068 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -703,9 +703,18 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    /*
+     * vPCI header initialization will have mapped the whole BAR into the
+     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
+     * the MSI-X table here, so that Xen can trap accesses.
+     */
+    spin_lock(&pdev->vpci->lock);
+    rc = vpci_make_msix_hole(pdev);
+    spin_unlock(&pdev->vpci->lock);
+
+    return rc;
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..3c18792d9bcd 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..7778acee0df6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern const vpci_capability_t __start_vpci_array[];
+extern const vpci_capability_t __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        unsigned int pos = 0;
+        int rc;
+
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
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
@@ -128,7 +154,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,14 +184,13 @@ int vpci_assign_device(struct pci_dev *pdev)
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
index 6a481a4e89d3..17cfecb0aabf 100644
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
+    int (* init)(struct pci_dev *pdev);
+    int (* cleanup)(const struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,21 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
+    static const vpci_capability_t name##_entry \
+        __used_section(".data.rel.ro.vpci") = { \
+        .id = (cap), \
+        .init = (finit), \
+        .cleanup = (fclean), \
+        .is_ext = (ext), \
+    }
+
+#define REGISTER_VPCI_CAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
+#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
+    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..b126dfe88792 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -188,7 +188,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.rel.ro.vpci)      \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


