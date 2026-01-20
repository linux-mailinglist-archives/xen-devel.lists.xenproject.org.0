Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E3D3C3CE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208504.1520694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DD-0001wZ-GS; Tue, 20 Jan 2026 09:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208504.1520694; Tue, 20 Jan 2026 09:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DD-0001qm-AL; Tue, 20 Jan 2026 09:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1208504;
 Tue, 20 Jan 2026 09:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8DB-0001NH-Rt
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:45 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0253c26-f5e3-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 10:39:40 +0100 (CET)
Received: from SN6PR04CA0094.namprd04.prod.outlook.com (2603:10b6:805:f2::35)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 09:39:32 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:805:f2:cafe::c3) by SN6PR04CA0094.outlook.office365.com
 (2603:10b6:805:f2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 09:39:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:32 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:29 -0600
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
X-Inumbo-ID: f0253c26-f5e3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxbpohVAYrDNQcg1dDDpEI3oWWHnVfhsVuHFkA8qT/V0156o6walgPUUmMAL5LohRm2nf7gu5z6hTQrG24cH4UyxeTHoTtBVdZtp5lBu7DLl16wZiDzdhuhxOT111r2NpKiSa5vofXdXMH0FawvIw/8TUZyGlpxzqHECTyhASvoW98Kp/Tu3YsNBPuChkBRkgWpmhgJDYd/yIT6KcjgxXMTBjJlLTAlEavjJPpN+IIpyu574LLp9m8ADlOkPYqXqgo/rUhQs2IBbYLVGUaLyrt4RF/gZLnD8ZBiyvifMD/RN6r/JsoLi1Vdxamco4mftjCF5/Zl5X4wkKc31+mFXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7JUwPOWscttGNrjWYKOuXxkeyKAiYXYN+soRUeRFk0=;
 b=syZS5AFahm9lRz6g/CQqgoCHQuJsOlwQjvuxNOVPonwkpcamhXXwKm7eMQkwAYYpSWXgwAkH53Xt50KGMfnhn6ew+7CFtjfYHqtIxMQDsoXJ03zszNnOnIHaGdujIg0mwxnKRkIF+i4bg+nyeRJUqRWXEa8jmrH5pYwUv4gLj60LvabKlxNicSRG+v7kO5UAPvLffwt/cdN7Eu6GXjBX0TZcdLZHnwZ9+6hlWrHEdPzd39qyU02T7e+Zz887C88HUSGkjp89nHYlkfpZPCAwvACoXXL5HZlGB+YB+pd35l+rBEwVn0Oy9cNHe5drnhbJCy6nuCud2TOMiZn0L4JT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7JUwPOWscttGNrjWYKOuXxkeyKAiYXYN+soRUeRFk0=;
 b=aAT788GrX+qxs+2s3ZH12Zmqw3pfc1jEf6JdyyjG7LBLaXRFq8MHzH4rqEOrmpD2ufLygJWTRS+2RvuewyJ7fp+HpSCgu5Y1cLArXyKe5AkheJ2JIgeVbreXy6acB/NmxrpgcsMsgpdsNCFwIQ4KbonS7fUnlU16bmnLnPOMlWg=
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
Subject: [PATCH v4 1/5] x86/ucode: Add Kconfig option to remove microcode loading
Date: Tue, 20 Jan 2026 10:38:46 +0100
Message-ID: <20260120093852.2380-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4ea7b1-5b2b-46e8-7ca2-08de5807d09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjNET005SmJTektNZWY5RGhsVldyd1ozSkM4K1ZOWEZ5TFVFT1YwUnZPU2ds?=
 =?utf-8?B?RGZ4d2paaW10YU52WkVZTm52YnJva2ZxTEtTQk53UUlxemJxN1FoNDNESWxx?=
 =?utf-8?B?SDZjN0NkRi9kNHNUVnpReDgzdUF3bUkvTFZkcURVdFJGT0pkMVAwaWZyK2dC?=
 =?utf-8?B?cnJ4VFJ6QnNvMmNEK0h2Smg5ckJkdmZQWGhJMlFvblRzZmpEUW9IYVJSd2Iy?=
 =?utf-8?B?OEhjdkRsU3ZyT0o3TUdjKzAxT0lLUk9lUTRRTUtkZXJHd2U4SzAzcDQzZTJ6?=
 =?utf-8?B?czVTMkpxb1J2U3hPTWw0T2p4TFpicFY0ektnend5dDd6UktWUVhpVG02SjU4?=
 =?utf-8?B?WVgvMjFBYWwwQ3l5VFZDSmI1WHNMQi9pc09Dd1ovQkNMM0xnY0czWjN4SThp?=
 =?utf-8?B?K1VhOU5LaWg4YWFJR0VwTmdGT3MyUjVIcGpsSnRWazN3Vm9Ta3pZRC9SZmxT?=
 =?utf-8?B?TkRFT0I5cnhMcEZxcFVadFdycFZtNC9XTXpZRFNQbU8xRGZsZjhMRlk0b010?=
 =?utf-8?B?SmMxZ1JIb2dmdGRpL0tOK1dLS1VWa3lQVWtMcjdKdlVHSzJUT3FGU0VMVVJC?=
 =?utf-8?B?bWNwYUpxZWFxa3U0N20zY0RON3RVU0Q3NHQ2RllWeGR4blR5UFpNVHNscWhm?=
 =?utf-8?B?N25USVpLVmw1MkI0TjRUZSsveWp1N0NFK2MvVUlVMUdUQzdQUm1tNVNMZ1VP?=
 =?utf-8?B?bllnWXlta3MwdkF0a01oS3I4YmNTRENFZjI2WTlRYTF1Qm95Z0xhOWRLVDBs?=
 =?utf-8?B?TEFDSXVISXJpREdMcXpqTmUxZ01EWEY4cDU5NzdXZUFlclo2bDhMUmQ1L05y?=
 =?utf-8?B?cWNCV2tTcXNpMksvdGpWYmdVbjVFUWVVZzVGK2VwbG9aYVJKTTVibjhGOXZm?=
 =?utf-8?B?Rk1zSjl5alFCaktjNkYyeGdGMlp0WlEvSDhLS2tNOStLK21NSjJTa0V6Vy80?=
 =?utf-8?B?UTNIUkl3UGo1My9MYjlQTnJrbmxDWDhGUGRzeG1IOGJ1QzVUclFzTW9hREh1?=
 =?utf-8?B?dm80S3ZETG5ITURWTmtONkRDa3AvWWhEak1ubmMyTndmc3JpTCtlZXAvTU1J?=
 =?utf-8?B?RGxmYzlGbHRTMXhQcmYxeHR6ZjlYV0lnQlVvWnhjdUtnTlY2bFBEVFh3cDl0?=
 =?utf-8?B?UDNFcTlNREg3R01pZnRoN3ZsMEQrT2F5RHVPRlVWSXpQL2tuVzFYN2tvUnIw?=
 =?utf-8?B?U2tIcGN6ZGQwMnZxSDRIcmdkcU51cUFOam9PeXVScHRwSllieE5VUWRXcEk3?=
 =?utf-8?B?S2U5dm1jQ3V5Z2FiR3JWTGRVL0c4bHoyN1FOTU5YVnZFSGQyVWpZeTQzUGhm?=
 =?utf-8?B?YStocm4zTHgwUGNsREs2VEVQVmduYnM3alZLdy9nTkN6Zm5oMUdIbVJweTBQ?=
 =?utf-8?B?WnFxUVRUVXczMlI1RW14VHhjZ0ZhdGVUV1hqeWdWcng3SlFQUnpHTC9ZZzF5?=
 =?utf-8?B?WnVCZ3JUNnFMTEFGdFdGY1BPKzR5bURiaGEwZzR5T3ZVZkFpTGtGRHg2VUo5?=
 =?utf-8?B?bGVaOVcvU2lwdkdlZzl6SC85TUpQTTc5Rm4rRmRVaFNoRGRNd2Q2QTlYVHpB?=
 =?utf-8?B?alRGK2g4bFBhM0czVlU3MXNNdVo2cmNBOXRZT3dvcnpTY21XRlVtSlZLZUxv?=
 =?utf-8?B?L2tVdXRiS2FrTGU1OFBKZE4zTjZKczVZWHV3RlpiSjFjUDNOZjZTYzFqUUhB?=
 =?utf-8?B?VzdZYzQvaTNDUHUzdVFsRTBnRlk0bFJaLzRNaGJ3bVhJeUhKcVBhTUt6cW9Q?=
 =?utf-8?B?KzdKMThSSk5oMU5WUVFMSExhN2hYWnRSMjdWMFpvekVDT2ZkWkltOVROWG5x?=
 =?utf-8?B?Tk56SFAxUzNMbFJ3c1lzR2ZuT3NJNTJiL2hCbEI0NjVSUVlEc2VLV0dXWFVh?=
 =?utf-8?B?aVpCUnhZZmVxZ3crSzQyd1JtTmlNMUwrMG52c0J6Q28xQmk4RDRISnNVTm8x?=
 =?utf-8?B?MmgwWE1QeVk4NzlyODRxZzhzdUI2aXptdGRaeUV3aldPK1VBQzdJMitkWHZC?=
 =?utf-8?B?NTV0V3pKc2tlaTZDaVY3YVI3bVBKUi9QcnBCL0R5blF2TEZRL2lWcTRyc0Q4?=
 =?utf-8?B?UEVSWjhVblh1UlcvQnBlalUrRTgxWDBEck53bHZoQkhaWDFxTFZBeDY1cXho?=
 =?utf-8?B?LzhSb1AzYitBRkYxSk92WVVMUUhscDlSQm41b0hiSzZGaE1CY3h6M2ZLQm5i?=
 =?utf-8?B?TWZWMGFKWThkSEVBWkF1Sk9IejR2bGdId1lZb3NWZS9UaDBmY2phSjdHNHRh?=
 =?utf-8?B?VVdhcnVPWGN5a2RtWDVHaVhkRnVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:32.0511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4ea7b1-5b2b-46e8-7ca2-08de5807d09c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574

Amend docs to reflect ucode= command/stanza depend on MICROCODE_LOADING
being set.

The new MICROCODE_OP() is a conditional setter for the microcode_ops
struct. By using IS_ENABLED() there rather than ifdef we allow DCE to
remove all statics no longer used when microcode loading is disabled
without tagging them with __maybe_unused.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v4:
  * Minor spell fix in commit message ("rather")
  * efi.pandoc: terminate sentence with "enabled".
  * xen-command-line: State applicability as first line.
  * reorder cpu hooks.
  * MICROCODE_OP() comment
  * MICROCODE_OP() moved next to microcode_ops
  * Re-arranged platform_ops to turn them into smaller hunks.
---
 docs/admin-guide/microcode-loading.rst |  2 ++
 docs/misc/efi.pandoc                   |  2 ++
 docs/misc/xen-command-line.pandoc      |  7 ++++---
 xen/arch/x86/Kconfig                   | 14 ++++++++++++++
 xen/arch/x86/cpu/microcode/amd.c       | 16 +++++++++-------
 xen/arch/x86/cpu/microcode/core.c      | 15 ++++++++++++---
 xen/arch/x86/cpu/microcode/intel.c     | 11 +++++++----
 xen/arch/x86/cpu/microcode/private.h   |  3 +++
 xen/arch/x86/efi/efi-boot.h            |  3 ++-
 xen/arch/x86/platform_hypercall.c      | 10 ++++++++--
 10 files changed, 63 insertions(+), 20 deletions(-)

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
index 11c1ac3346..8198a7f063 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -104,6 +104,8 @@ Specifies an XSM module to load.
 
 Specifies a CPU microcode blob to load. (x86 only)
 
+Only available when Xen is compiled with CONFIG_MICROCODE_LOADING enabled.
+
 ###`dtb=<filename>`
 
 Specifies a device tree file to load.  The platform firmware may provide a
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 15f7a315a4..0eca489b7d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2751,9 +2751,10 @@ performance.
     Applicability: x86
     Default: `scan` is selectable via Kconfig, `nmi,digest-check`
 
-Controls for CPU microcode loading. For early loading, this parameter can
-specify how and where to find the microcode update blob. For late loading,
-this parameter specifies if the update happens within a NMI handler.
+Controls for CPU microcode loading, available when `CONFIG_MICROCODE_LOADING` is
+enabled. For early loading, this parameter can specify how and where to find the
+microcode update blob. For late loading, this parameter specifies if the update
+happens within a NMI handler.
 
 'integer' specifies the CPU microcode update blob module index. When positive,
 this specifies the n-th module (in the GrUB entry, zero based) to be used
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
index 71b041c84b..c1ab6deb4d 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -561,11 +561,11 @@ static const char __initconst amd_cpio_path[] =
     "kernel/x86/microcode/AuthenticAMD.bin";
 
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = amd_compare,
-    .cpio_path                        = amd_cpio_path,
+    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
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
index 281993e725..dac464961a 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -408,17 +408,20 @@ static const char __initconst intel_cpio_path[] =
     "kernel/x86/microcode/GenuineIntel.bin";
 
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare                          = intel_compare,
-    .cpio_path                        = intel_cpio_path,
+    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
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
index e6c965dc99..77ce816c1a 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -8,6 +8,9 @@
 /* Opaque.  Internals are vendor-specific. */
 struct microcode_patch;
 
+/* Aids dead-code elimination of the static hooks */
+#define MICROCODE_OP(x) (IS_ENABLED(CONFIG_MICROCODE_LOADING) ? (x) : NULL)
+
 struct microcode_ops {
     /*
      * Parse a microcode container.  Format is vendor-specific.
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
index f8eca48170..2ac9fc2d96 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -317,8 +317,11 @@ ret_t do_platform_op(
     {
         XEN_GUEST_HANDLE(const_void) data;
 
-        guest_from_compat_handle(data, op->u.microcode.data);
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+            break;
 
+        guest_from_compat_handle(data, op->u.microcode.data);
         ret = ucode_update_hcall(data, op->u.microcode.length, 0);
         break;
     }
@@ -327,8 +330,11 @@ ret_t do_platform_op(
     {
         XEN_GUEST_HANDLE(const_void) data;
 
-        guest_from_compat_handle(data, op->u.microcode2.data);
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
+            break;
 
+        guest_from_compat_handle(data, op->u.microcode2.data);
         ret = ucode_update_hcall(data, op->u.microcode2.length,
                                  op->u.microcode2.flags);
         break;
-- 
2.43.0


