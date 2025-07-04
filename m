Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D881EAF88AF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032829.1406227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXD-0004N3-Hl; Fri, 04 Jul 2025 07:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032829.1406227; Fri, 04 Jul 2025 07:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXD-0004KU-DC; Fri, 04 Jul 2025 07:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1032829;
 Fri, 04 Jul 2025 07:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXB-0003s2-QL
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10c7cef-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:32 +0200 (CEST)
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 4 Jul
 2025 07:08:26 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::cb) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.15 via Frontend Transport; Fri,
 4 Jul 2025 07:08:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:26 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:22 -0500
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
X-Inumbo-ID: b10c7cef-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcxhE/K06z1EOjXFAifdeUh3gqCl7P7RDrLdj940289SI9BlCTfssz8NXonQTLLCRJvbfwmh30hUYTUNTViqRiqQKv6ETQEEvQwMmHbAjSp3M2y793/tP4BPMPO+9YdPnDrAPs4bzjXBUjxWDhEC8ujXqcYXT0Ct+o+Tri6QGeVAzQR2CjBi6lzDYILJDitq4pyOwyDgkjN9KzEHlblBCbxk4Obu+n38EsdJkamxK/m9VGi17+U3UKSkSkeVkmKFIoEQ+Sl5qWPK1eVB7MOOdtRZgHNidl28MhUGdBKyb+96+K8pona/uFc+xvyh94dDulztXnsKDMqkXxyqESvCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fROVOWcbEB5C5BOPnfRbFfqrpyMA5taHFpepRRI/SpA=;
 b=J+pTmIDM0jCZoFLfw/Af6dJRahIBYNcn9liTHdlp22J+/QFFhsSqLyCuZpDx4XqD71r4UutAFvaaptEmUyzzVJaQapC7zmyyM5C7PaqzGyI4mvltiRlqDYNuXnUm+qDH9X1rj6WBIwm4rtVP5Y14R13ZDc4SS02G5MH3+qx+Bk6DOd3wwMFZ76sIwy3j9o4MQEAKiH4tskrI8/xX/tNDSaCV6kP5DrMAl+4WqDQ0yERv5q9zYOZwk7DZIcWCHwVHJDr182kCmSioBAsqyfyeyS79pQM9Uoh8MtjkVvdqFJUV0dqor6GNA+Q4+YTvU3l05ZxWT0386VSMO7uBgLnDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fROVOWcbEB5C5BOPnfRbFfqrpyMA5taHFpepRRI/SpA=;
 b=rrV3Vk45qsn073n7WqOCcVkHaCY2Vsro+5i/FyTjiInvyUsu/BWubhCdkOuD+TjK7KKoE3kMXVUhuhdFDeqoO8Ro4wz8aWQaaUDegmyKvyhFWid+f+F8mWjbKuveKAMnxsdNhPFwzkJbBrBID9EAPMWQRaej3pGcIh+etJ84oQY=
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
Subject: [PATCH v7 2/8] vpci: Refactor REGISTER_VPCI_INIT
Date: Fri, 4 Jul 2025 15:07:57 +0800
Message-ID: <20250704070803.314366-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704070803.314366-1-Jiqian.Chen@amd.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: a07f1c42-961e-47c0-4c97-08ddbac99273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azd5SzM4dUdSbXdrMzBaVEgrdlJxTHJ3L24wQ1FWbFBBeVg0R0tuVlNRSHMr?=
 =?utf-8?B?cU5yT1JvTXA2UzFTMTBtZ3phZ243VDBna3JLK3NIWjE5WWRNb1BCYk14TzFM?=
 =?utf-8?B?SDA4eFRnVXJMaWJnWjBwTitoQ25YRmNPUnM4THY0cGJXS1czU2xwdlFYR0F1?=
 =?utf-8?B?dVhLZ01Ed1B1aDRPeE9ka3NBSVZYZEl1V3FXemZCY09nSWNwNEhjb01nOFo5?=
 =?utf-8?B?eG9tMjgzZjZabUlHYkg4R05SVUlGazVDb2Y0STJVem1QdFhZYnQ2eXJYTS9s?=
 =?utf-8?B?UVlEZmt1Ui84MmVLSHlPSDFST0ptUlBsQWUvN3BVaXZZL2RsOEpkRjRDS2hk?=
 =?utf-8?B?bXozNzZua2ZRT1FwTDdNZ0Q4b1lIdWc0Q2VPUzUzRjFKZEVVWjhSL2hKaHBJ?=
 =?utf-8?B?RExkVmpBVFFDYWpleG9IRnp6dHNDVUpxbVIxM3pXSlYzSG5VcXYyT2loSlBT?=
 =?utf-8?B?MjF6QXVWdWdCTHJ2K2dnYkVndFQ5RFlDSlN5NUVRTEtOUk4yVVNhbWoyZFZC?=
 =?utf-8?B?cTE3SDlZa05YYThZdXhPR2RxV0k1bzlrOFR0MEVvbXFWQ3A0dkNZQ2tLZFVH?=
 =?utf-8?B?N2t6TFNmREhzWUs4aHRVN2t1WlNtdEZ3d0ZPTjY3QzRsRTBvUGlJZjlzdTEv?=
 =?utf-8?B?TStxVmQ1Sjl3N3ZrVjVrOXplNys1OU9wMmFxWTZyV21hcXVubnNtcnd6bm0w?=
 =?utf-8?B?Q1ZjUnFyR0h3dk03M0VOSlhGcmx0TGdBOGF2VXJRUGxqRURaSG9KTW5TS0c1?=
 =?utf-8?B?OXRhK3RjcERPcmh4MUFOZlg2OFZZSFdDeXh2UFc2VjBjZTQ5ZGR5QnF3eVhO?=
 =?utf-8?B?OFpUK3J0RHBMbUk1Y2s0QytzbXhES0svSklySFR4eFloVVNTZGNDeTNKem5w?=
 =?utf-8?B?TllHL3RkaGluN3pZZUpOd3YyUTBhWktrd3h0TjJuTlhwV3Z6ZG5TUVZsVHpM?=
 =?utf-8?B?d0twZUxVWFZSRVBDSll5L2QxclB3RUhhd0F6NFkrR2VRbGdRZy94NXVGY2Qw?=
 =?utf-8?B?UFRJano4VlA4dW14ZVRxY3Zoa0Qxa0tLc0t4QWc1NzBCdEpKaXp1VitvWWQz?=
 =?utf-8?B?cUtQMEFqdmhYK2xuVFllYW5RTzFmQndqazFWbFc3MUVHWTMyY3RDU09RM2tJ?=
 =?utf-8?B?VlA4aHJUdXgzWkZ6bkZMMnFrTDRrSEpzRHVUU09ZK3l2bDNoWmZsYVBId05u?=
 =?utf-8?B?b28rNEE2OUUrQkJsczBTaHdZNS9XMGVZeXJ4U0NmMzJEM3BqN1dDWjNoTENl?=
 =?utf-8?B?WWZmZ1lqcFFHZ3ZiendjQXQ0SlJmTHZSVHR6R0ZKU2thWU00ZzFiTllpWGl5?=
 =?utf-8?B?QUZUTFA0UWRVT2J2ZUN4aENJWWxKZTF2N1VkQzJSKy94YXMvUEVBNnRjUEVB?=
 =?utf-8?B?U2VDZWkrMCtHNVlxbkhHOEdMZUVpaFg5YWg1eTVIbmF1d3pqSVJnNEpMOVpC?=
 =?utf-8?B?S0tUMDh2Z3pKTFh3NENLc3M1N3A3QTNwMWs4ZHAxeUZ4bGk0QldvVkwxNnBG?=
 =?utf-8?B?M3E5TjVrNVIwTENPR0dsS2xZOXkwKzVGaDVkNkxtMEJPWEc0WVQ4UlEvMm1D?=
 =?utf-8?B?UXEwZG1UbnpHZUNQd1U3WHgxK1F1QWpKWFJxYXVONzFtK3E2Rk1xbTMzckFR?=
 =?utf-8?B?VWNSYUpRWk01SEYyWTJsVVFuSjVQdGpSeTNqdGdJQ3EyM2lkMEwyRlBOMXhD?=
 =?utf-8?B?VlVra0lVMlJrYlhmbVdBSmZRRExyMmxYdVord0xIRFpNS0F6NVdBem5ad0or?=
 =?utf-8?B?TlV1MkRVQkVydW5IWFZoZy9iZXNJUHRra3k1Nlp6cHhDZHUzR2FibEJJZG94?=
 =?utf-8?B?eEQ5QWw4bGtyaEhIRlBuMjdKcWMyQi9mMUNKMlJXSnd2c0JJRUFkMnArNmM2?=
 =?utf-8?B?MGViemlaZGpmcGYxSEh1RWlYVmlZdGR4T1E4KzY4NEpqTzJ1VTVuMnl2Qit4?=
 =?utf-8?B?WEgwWW5zRXdWS2RxdGp3a3NoTkNaWmh3SW9ZN3gvZkpTRWZnL2c0dGtVaVBq?=
 =?utf-8?B?VThCVGJUNjRQWGNaek5TQkJwa1JRYmpHcEorbUpKdUJ1blg4K2FtUXVqYUtw?=
 =?utf-8?Q?I0s8Fx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:26.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07f1c42-961e-47c0-4c97-08ddbac99273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236

Refactor REGISTER_VPCI_INIT to contain more capability specific
information, this will benefit further follow-on changes to hide
capability when initialization fails.

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

After refactor, the "priority" of initializing capabilities isn't
needed anymore, so delete its related codes.

Note:
Call vpci_make_msix_hole() in the end of init_msix() since the change
of sequence of init_header() and init_msix(). And delete the call of
vpci_make_msix_hole() in modify_decoding() since it is not needed.

The cleanup hook is also added in this change, even if it's still
unused. Further changes will make use of it.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
There is a byte alignment problem in the array __start_vpci_array, which can be solved after
"[PATCH] x86: don't have gcc over-align data" is merged.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
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
 xen/drivers/vpci/header.c | 16 +-------------
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   | 11 +++++++---
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    | 32 ++++++++++++++++++----------
 xen/include/xen/xen.lds.h |  2 +-
 11 files changed, 71 insertions(+), 49 deletions(-)

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
index 8ee8052cd4a3..069253b5f721 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     bool map = cmd & PCI_COMMAND_MEMORY;
     unsigned int i;
 
-    /*
-     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
-     * can be trapped (and emulated) by Xen when the memory decoding bit is
-     * enabled.
-     *
-     * FIXME: punching holes after the p2m has been set up might be racy for
-     * DomU usage, needs to be revisited.
-     */
-#ifdef CONFIG_HAS_PCI_MSI
-    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
-        return;
-#endif
-
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
@@ -869,7 +856,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1065,7 +1052,6 @@ static int cf_check init_header(struct pci_dev *pdev)
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
index 74211301ba10..a1692b9d9f6a 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -589,7 +589,8 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
     .write = msix_write,
 };
 
-int vpci_make_msix_hole(const struct pci_dev *pdev)
+/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
+static int vpci_make_msix_hole(const struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
     unsigned int i;
@@ -703,9 +704,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
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
index 8474c0e3b995..e7e5b64f1be4 100644
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
index 61d16cc8b897..61287e5d2e12 100644
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
@@ -206,9 +219,6 @@ struct vpci_vcpu {
 #ifdef __XEN__
 void vpci_dump_msi(void);
 
-/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
-int vpci_make_msix_hole(const struct pci_dev *pdev);
-
 /* Arch-specific vPCI MSI helpers. */
 void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
                         unsigned int entry, bool mask);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..eb86305c11c7 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -188,7 +188,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.rel.ro.vpci)           \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


