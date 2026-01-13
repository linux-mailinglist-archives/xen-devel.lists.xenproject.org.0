Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E9D18AED
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201591.1517217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdPA-0005fI-VH; Tue, 13 Jan 2026 12:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201591.1517217; Tue, 13 Jan 2026 12:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdPA-0005d9-RV; Tue, 13 Jan 2026 12:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1201591;
 Tue, 13 Jan 2026 12:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdP9-0004bu-4L
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:21:47 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c9e9e51-f07a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 13:21:45 +0100 (CET)
Received: from BL1PR13CA0322.namprd13.prod.outlook.com (2603:10b6:208:2c1::27)
 by CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 12:21:39 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::b9) by BL1PR13CA0322.outlook.office365.com
 (2603:10b6:208:2c1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 12:21:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:21:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:21:36 -0600
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
X-Inumbo-ID: 6c9e9e51-f07a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng+iPC8was9vFPbprLLfnyPjlkaDwzGtD6wR5CSI0Suy1f0iWW/G+2qq2gMkOsvE4vnTHpBrGOjh7+EQ0n/iI09ueRtQr4V1FrohiYgldGRapzXGNTww9xFilQxUlFP90M7KyuvTfgunE44isJcZ4M2d3CYm4ZnwqVd5zuLDcNGd+ZHeddo8KSnb4SQP/LX/3tcnhDEuRiNAXilsO1cyt/nFYaj8bHyNZVwELFAEkP+1FYmDINht0UBDoWKTm7Q+QCTzjLLALP8Z6b2Aj+HNhe+MnlufgMYnTWyAEwB0r7ljrkqOyiDXkWqCe3kmDnYZ8AidJRBb9tQ7KdX+lMct4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c651OyNI/1pUox+oVe25mxjBq9KfipSq30mm7zQRpPc=;
 b=Ts95KS6H4YbDoZdfG+qUTmVJviTkLs6HdskxPbZSpkzQqjxoklH0/COcFQLdlJdEh51MnDIxwz75ZZ0k0ufJCoBOBewTZvm7xgeDbmmc1u/DW0lxVcuZClEsEOuZ7LMVXEU/EPzyDSagj/yA7XhkTcuPpZ+FDFRPMwCMPXhbclc0+aGjs5u3Ri42cj5C2mdjWuwlbywUT0FHxb5YsZmxbuVJHyUWr8/oKO/NU4s5oPT/pOOC0o5EVX3qP/Zda2HqHJqNtg3AILXBJn9IxnS1EOMnY7xsZdVpi73xNZl0GLgsfD5aeGDewbtjYeONysUoKjqsuVPm9BD7NRckKptiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c651OyNI/1pUox+oVe25mxjBq9KfipSq30mm7zQRpPc=;
 b=daDN+tUuI0jNWf8KaWQvF801TzhCn/tR10sPJM+4tRiZq8zChWpwNe6/EtvHvfLLpQ3mwNp/HW2wS6LpC032ipIxyKMhitD+2NYYpGdpY4tePIyvzp2Sl/0G0k9jZuWe6uUFtGJ4ANvEw7o+QGd0pICmDzWIhuBADBh2wa5iAcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v3 4/4] x86/ucode: Add Kconfig option to remove microcode loading
Date: Tue, 13 Jan 2026 13:21:04 +0100
Message-ID: <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|CH3PR12MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: ff043a9a-1009-434d-2a06-08de529e4d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1RBVk9uY2FjbTRaOGNEUktadUFTLzZ4RzRPQ1R4blh2NGJ6NS9xczA1R1pP?=
 =?utf-8?B?UWNrQ0JJVm9McmxxSU5mS2hyaEJMbXd6aUhkNTRTN01tcEViMFBzRkl4eUJ0?=
 =?utf-8?B?U2JZWk1KYSt4RmlGc1dTblRXOFlXQXBOSmhJK1o5Q2JCYUhEbnhZMFZidlB0?=
 =?utf-8?B?WjVDeTRNMGFOWmtwZ256MndvRk13N3dPRmNnRk91eCtxd1d4NDk4MzVlTnpi?=
 =?utf-8?B?TEFCTml2UG1CL29VMm05eVdYSnUzaEtaOEJVRWJkM3BkdXpMZTJrMm9GbnVu?=
 =?utf-8?B?V2FKYldKUkdKS2xMcVorbkpNZkFiVUdiN1NFMVEybVJ3TUhzY25RaC9GVmlw?=
 =?utf-8?B?ay8yWUhsRmVjN2JMSURWcDR4MGNJZ1JQR2lBTjZaY2NyaFhwNlkxUGpSZW5w?=
 =?utf-8?B?a09aem1ZdGNBaE5tVlhQUjh1WS9HK3lZeVUyU1FoU2hMYkRkWGZLZ2JlRFNN?=
 =?utf-8?B?UWxMR09DN3dpUXN2blI0azRuelBxSXlzNWZtU05zMVlTU0NCUzRXdnN3NWh6?=
 =?utf-8?B?d0xrbTNJcEVhNFZ3M1VVb2FXcFBsVGxzMXU3NFlCOXRLby9lOFZBNDdybldB?=
 =?utf-8?B?aHVwMTIvUWt5QWJCQ041d1VyZTczTXRhVFByVVFSSzNzNVRJNGxva2oybHJQ?=
 =?utf-8?B?aHkrWVY0ZjJyRytRakNrTkdhYUx2bHBWK0l2cEpxNWNUY2xadDMxVUIvSlM1?=
 =?utf-8?B?RjUyblBWQVdiaDNZVWlzSzcrRnhkZXVBT3NkL1hRbVlpZU1IY3pvb25RWUZu?=
 =?utf-8?B?T01CRURLS09ZMUczbnlFRlpZN2tvUzJzTlBTb3EzU3pkTVdiNDBZSUh0aWx4?=
 =?utf-8?B?c0VxTFpIdHpRQlVnS2VVTUFBWTVZRGJQVFYySEIveXZRenlKL3R5T3NoQVh4?=
 =?utf-8?B?OUl0Z1lTMHJMQ0dIOUtOWXJ3OC8vb25pTWRsZGxPa0J3cFpFK0lneTI5ZFJm?=
 =?utf-8?B?UFlaYUwrSW1TY3RxYjVPaWlKbGlDWXZPRlI5RkpSZ1p1dTQ4ZHMzR2EyZmcw?=
 =?utf-8?B?RXZEZDN6bGVYQUh0eWlDcXhob3V6UzFTSDF2NElGZWZITFZWVmV3YjVWamdn?=
 =?utf-8?B?Ny8zMXVpMmxaR0g4anRwNDMydFdMeE9SZTJyWXpaeFdCeDRCdFNSem1ONWlv?=
 =?utf-8?B?bUxYVGhvbDA4OGtyVGdaQk9YVU5DbU9uZkk4N0tiSDZvV2pDTjJaWTJXK1BP?=
 =?utf-8?B?SFo5aG5GUFpqYmVuVWlLZG1IaVVvOHkrSmgzM0JnM0ppb1VSa05pVy9sM1oz?=
 =?utf-8?B?d1ZXNWlpUkxHVGhNNVh4Mm1EeEtTYWRXUHBxNzZGc2dVSzJYYXpSNTIvS0NV?=
 =?utf-8?B?d2szbVhKV3lITC9YZHp6RVJRUmdZN0dBRVh2WEZEOFptTW9MSTNQY24xcFo3?=
 =?utf-8?B?L2NoZE55ajVwRGtMV1pRNW1INFJnOE91NzU1QTh3Ulo1aVhsYTB4ODk0cEI0?=
 =?utf-8?B?TWFEZ1JmTkpSeE9NNW5pdVhGZnhIalJQOHFlY3JWcVB2RjFtVldpYnpCRW1W?=
 =?utf-8?B?Z0o2WXRqM0VxUHVlR2dCNlVvSHZZM0VtSFNTQzdJaktrY2Z0Mmh0ZnFualhS?=
 =?utf-8?B?RzZ4MVd4d010U2l0VFlSaEhIYXpxZGNsM0ZlSXlPT0pyei8rbitySmM1WHVo?=
 =?utf-8?B?TStvMi92UnFFRk5OSzhnNUNHbkZQeFpkaW0yNjFSVnh5UEF1QVAwTHVYZFg1?=
 =?utf-8?B?RjF2REtFQnlIWWlMMVp3U05qUU5SdWJEZUliVW11dmJhbzRyT204WkRIQk5s?=
 =?utf-8?B?Y1FuUERoSFg0ZndYa2t2UlpjQXFvRUVrRFV5SGZnWEFsb295eTdSS0kwSVcy?=
 =?utf-8?B?YjcyT0dwaUFxS0I4cTZTdmI1dU9VQzJvRFNLTG9iREpUS1YvSXYvbjU3bWhM?=
 =?utf-8?B?MUp5YXNiOHljZEFoSk1oSTRRY1J1ZHNSTVVKVGFveHFxME55NHRxYVdwVy83?=
 =?utf-8?B?cmIyY3lVUFd0aVN5QjRwUVdObWgxOGp1T09nazBCVThoQVFaM09reWxGcFpP?=
 =?utf-8?B?Z29YcE8xaDFvQy85eldRaFpSbjFCdC9pWU04cC9JWnQvMWJXeElFaVJZdSt6?=
 =?utf-8?B?QlNpOWliZVRVTHpDWnNlM3dEUERlcWMybGc2dXZKLzkvYWJ3S2d1OXNhelps?=
 =?utf-8?Q?Whh4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:21:39.1043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff043a9a-1009-434d-2a06-08de529e4d7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484

Amend docs to reflect ucode= command/stanza depend on MICROCODE_LOADING
being set.

The new MICROCODE_OP() is a conditional setter for the microcode_ops
struct. By using IS_ENABLED() there ratehr than ifdef we allow DCE to
remove all statics no longer used when microcode loading is disabled
without tagging them with __maybe_unused.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * Moved MICROCODE_SCAN_DEFAULT to a separate patch
  * Added doc change to admin-guide
  * Added Andrew's suggestion for Kconfig help text
  * Inlined can_apply_microcode() macro in core.c
  * Kept the platform-ops, gating them on CONFIG_MICROCODE_LOADING
    through the new MICROCODE_OP() macro.
---
 docs/admin-guide/microcode-loading.rst |  2 ++
 docs/misc/efi.pandoc                   |  2 ++
 docs/misc/xen-command-line.pandoc      |  2 +-
 xen/arch/x86/Kconfig                   | 14 ++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c       | 16 +++++++++-------
 xen/arch/x86/cpu/microcode/core.c      | 15 ++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c     | 11 +++++++----
 xen/arch/x86/cpu/microcode/private.h   |  2 ++
 xen/arch/x86/efi/efi-boot.h            |  3 ++-
 xen/arch/x86/platform_hypercall.c      | 22 +++++++++++++++-------
 10 files changed, 66 insertions(+), 23 deletions(-)

diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
index a07e25802f..148bc8559b 100644
--- a/docs/admin-guide/microcode-loading.rst
+++ b/docs/admin-guide/microcode-loading.rst
@@ -23,6 +23,8 @@ TSX errata which necessitated disabling the feature entirely), or the addition
 of brand new features (e.g. the Spectre v2 controls to work around speculative
 execution vulnerabilities).
 
+Microcode loading support in Xen is controlled by the
+``CONFIG_MICROCODE_LOADING`` Kconfig option.
 
 Boot time microcode loading
 ---------------------------
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c3fb1f3a30 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -104,6 +104,8 @@ Specifies an XSM module to load.
 
 Specifies a CPU microcode blob to load. (x86 only)
 
+Only available when Xen is compiled with CONFIG_MICROCODE_LOADING.
+
 ###`dtb=<filename>`
 
 Specifies a device tree file to load.  The platform firmware may provide a
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 15f7a315a4..866fa2f951 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2748,7 +2748,7 @@ performance.
 ### ucode
 > `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
 
-    Applicability: x86
+    Applicability: x86 with CONFIG_MICROCODE_LOADING active
     Default: `scan` is selectable via Kconfig, `nmi,digest-check`
 
 Controls for CPU microcode loading. For early loading, this parameter can
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d5705e4bff..61f58aa829 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -331,8 +331,22 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
+config MICROCODE_LOADING
+	bool "Microcode loading"
+	default y
+	help
+	  Microcode updates for CPUs fix errata and provide new functionality for
+	  software to work around bugs, such as the speculative execution
+	  vulnerabilities. It is common for OSes to carry updated microcode as
+	  software tends to get updated more frequently than firmware.
+
+	  For embedded environments where a full firmware/software stack is being
+	  provided, it might not be necessary for Xen to need to load microcode
+	  itself.
+
 config MICROCODE_SCAN_DEFAULT
 	bool "Scan for microcode by default"
+	depends on MICROCODE_LOADING
 	help
 	  During boot, Xen can scan the multiboot images for a CPIO archive
 	  containing CPU microcode to be loaded, which is Linux's mechanism for
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 71b041c84b..86706a21a6 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -561,11 +561,11 @@ static const char __initconst amd_cpio_path[] =
     "kernel/x86/microcode/AuthenticAMD.bin";
 
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
+    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = amd_compare,
-    .cpio_path                        = amd_cpio_path,
+    .apply_microcode                  = MICROCODE_OP(apply_microcode),
+    .compare                          = MICROCODE_OP(amd_compare),
+    .cpio_path                        = MICROCODE_OP(amd_cpio_path),
 };
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
@@ -574,7 +574,8 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
      * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
      * CPUs.  Taint Xen if digest checking is turned off.
      */
-    if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
+    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) &&
+         boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
          !opt_digest_check )
     {
         printk(XENLOG_WARNING
@@ -614,8 +615,9 @@ void __init amd_check_entrysign(void)
     unsigned int curr_rev;
     uint8_t fixed_rev;
 
-    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
-         boot_cpu_data.family < 0x17 ||
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING)  ||
+         boot_cpu_data.vendor != X86_VENDOR_AMD ||
+         boot_cpu_data.family < 0x17            ||
          boot_cpu_data.family > 0x1a )
         return;
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index dabdb95b4c..efaf808f1a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -58,7 +58,7 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static bool __initdata ucode_mod_forced;
+static bool __initdata __maybe_unused ucode_mod_forced;
 static unsigned int nr_cores;
 
 /*
@@ -104,6 +104,7 @@ static int __initdata opt_mod_idx;
 static bool __initdata opt_scan = IS_ENABLED(CONFIG_MICROCODE_SCAN_DEFAULT);
 bool __ro_after_init opt_digest_check = true;
 
+#ifdef CONFIG_MICROCODE_LOADING
 /*
  * Used by the EFI path only, when xen.cfg identifies an explicit microcode
  * file.  Overrides ucode=<int>|scan on the regular command line.
@@ -162,6 +163,7 @@ static int __init cf_check parse_ucode(const char *s)
     return rc;
 }
 custom_param("ucode", parse_ucode);
+#endif /* CONFIG_MICROCODE_LOADING */
 
 static struct microcode_ops __ro_after_init ucode_ops;
 
@@ -469,7 +471,7 @@ struct ucode_buf {
     char buffer[];
 };
 
-static long cf_check ucode_update_hcall_cont(void *data)
+static long cf_check __maybe_unused ucode_update_hcall_cont(void *data)
 {
     struct microcode_patch *patch = NULL;
     int ret, result;
@@ -613,6 +615,7 @@ static long cf_check ucode_update_hcall_cont(void *data)
     return ret;
 }
 
+#ifdef CONFIG_MICROCODE_LOADING
 int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
                        unsigned long len, unsigned int flags)
 {
@@ -645,6 +648,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
      */
     return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
 }
+#endif /* CONFIG_MICROCODE_LOADING */
 
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
@@ -658,7 +662,7 @@ int microcode_update_one(void)
     if ( ucode_ops.collect_cpu_info )
         alternative_vcall(ucode_ops.collect_cpu_info);
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) || !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
     spin_lock(&microcode_mutex);
@@ -678,6 +682,7 @@ int microcode_update_one(void)
  */
 static int __initdata early_mod_idx = -1;
 
+#ifdef CONFIG_MICROCODE_LOADING
 static int __init cf_check microcode_init_cache(void)
 {
     struct boot_info *bi = &xen_boot_info;
@@ -734,6 +739,7 @@ static int __init cf_check microcode_init_cache(void)
     return rc;
 }
 presmp_initcall(microcode_init_cache);
+#endif /* CONFIG_MICROCODE_LOADING */
 
 /*
  * There are several tasks:
@@ -898,6 +904,9 @@ int __init early_microcode_init(struct boot_info *bi)
 
     printk(XENLOG_INFO "BSP microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);
 
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+        return -ENODEV;
+
     /*
      * Some hypervisors deliberately report a microcode revision of -1 to
      * mean that they will not accept microcode updates.
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 281993e725..ba99f4ffdc 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -408,17 +408,20 @@ static const char __initconst intel_cpio_path[] =
     "kernel/x86/microcode/GenuineIntel.bin";
 
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
+    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = intel_compare,
-    .cpio_path                        = intel_cpio_path,
+    .apply_microcode                  = MICROCODE_OP(apply_microcode),
+    .compare                          = MICROCODE_OP(intel_compare),
+    .cpio_path                        = MICROCODE_OP(intel_cpio_path),
 };
 
 void __init ucode_probe_intel(struct microcode_ops *ops)
 {
     *ops = intel_ucode_ops;
 
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+        return;
+
     if ( !can_load_microcode() )
         ops->apply_microcode = NULL;
 }
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index e6c965dc99..1167b79db1 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -93,4 +93,6 @@ void ucode_probe_intel(struct microcode_ops *ops);
 static inline void ucode_probe_intel(struct microcode_ops *ops) {}
 #endif
 
+#define MICROCODE_OP(x) (IS_ENABLED(CONFIG_MICROCODE_LOADING) ? (x) : NULL)
+
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..42a2c46b5e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -295,7 +295,8 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
 {
     union string name;
 
-    if ( read_section(image, L"ucode", &ucode, NULL) )
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) ||
+         read_section(image, L"ucode", &ucode, NULL) )
         return;
 
     name.s = get_value(&cfg, section, "ucode");
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..a55060e662 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -309,22 +309,30 @@ ret_t do_platform_op(
 
     case XENPF_microcode_update:
     {
-        XEN_GUEST_HANDLE(const_void) data;
+        ret = -EOPNOTSUPP;
+        if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+        {
+            XEN_GUEST_HANDLE(const_void) data;
 
-        guest_from_compat_handle(data, op->u.microcode.data);
+            guest_from_compat_handle(data, op->u.microcode.data);
+            ret = ucode_update_hcall(data, op->u.microcode.length, 0);
+        }
 
-        ret = ucode_update_hcall(data, op->u.microcode.length, 0);
         break;
     }
 
     case XENPF_microcode_update2:
     {
-        XEN_GUEST_HANDLE(const_void) data;
+        ret = -EOPNOTSUPP;
+        if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+        {
+            XEN_GUEST_HANDLE(const_void) data;
 
-        guest_from_compat_handle(data, op->u.microcode2.data);
+            guest_from_compat_handle(data, op->u.microcode2.data);
+            ret = ucode_update_hcall(data, op->u.microcode2.length,
+                                     op->u.microcode2.flags);
+        }
 
-        ret = ucode_update_hcall(data, op->u.microcode2.length,
-                                 op->u.microcode2.flags);
         break;
     }
 
-- 
2.43.0


