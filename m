Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B5B11852
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057167.1425114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiw-0000LZ-U2; Fri, 25 Jul 2025 06:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057167.1425114; Fri, 25 Jul 2025 06:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiw-0000I8-Px; Fri, 25 Jul 2025 06:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1057167;
 Fri, 25 Jul 2025 06:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBiv-0007mf-6l
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c9d177-691e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:16:04 +0200 (CEST)
Received: from MW3PR05CA0014.namprd05.prod.outlook.com (2603:10b6:303:2b::19)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:01 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::3a) by MW3PR05CA0014.outlook.office365.com
 (2603:10b6:303:2b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 06:16:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:15:59 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:57 -0500
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
X-Inumbo-ID: d7c9d177-691e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsXeIUKC73sL1E22cDKJrtI9FtBE/nqFCwl1Dav4jR61JHmBIg3SoE2q+0eTx2qqBj6G8O++KvNermuy7GtkIIDdE+eFk0mnVIogm0P5LhPe5eJqYdUqzktc7mRcy0VYZTzfM66TbUuQcBl63Ol785J09Wr8nkOiQ6s1XmiJxCMbc2s/67YlY8f+sQZKh2m1qEG/nqdRqpAuY10shVaxdGj62UejJK6tAgWLlpGsUZjdXCOmv6oqU0KEUINU2BEQtU+X54O0DnYPw1A8jEO3IH/Lsbs6gem5qh4do+SrMw/WTrQNL+rCwPPuZ4HRrHt/jbNG6sc3cM0F2douckVr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAL+xqL35bIe5J2w9qcpDdUvbMX7wPcjZi5f8A3G+Dc=;
 b=k7NMaRnrs1xljLgH4V23zEIjadPaFCBMQFst2f6yjJEHNsCWW0pZUrYaTxCuwLyerYK4nuiQw/2h0ofdJijnvhbq5Zprnf6XLFQHUP3G22lKm2MdjXL9GgLR1b14QejkV+EZ0kH3MdZDz+zgn4LLCH1uqrUGm9oO+8yFfXpVv0vhv+dD7fRUQtYd+hG9zsz7FmGB3FDrdlrbLCetdQHyif+e9WPKDDGuOnj3gY/ptAsPcmm8UNJQJ+5lENAzXwEZCwwI6t8OSgE2+/E8Bfmt4yOr7HaLuZLWf6EH2zLF7R9IbkVEA5mINNWzbIu1TMe32WHXCkTNrIUy7xxSmlM0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAL+xqL35bIe5J2w9qcpDdUvbMX7wPcjZi5f8A3G+Dc=;
 b=DF0cv/ttT2n7lDzlQYZ+LU5rdcMg25BVEBzqXLKtVbQp6J5uNUfLWf4m4u+ByjJoaIRCzbPi91DBkfhF77PdJNDiSsEGKxqZH/SL3MMOPc58Kb+rN5lDsnUtR28q5Q39HhhbwSGaExzK/ZHlvAZpqqUrt+SBcbVdfPZqA/qk2bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 04/11] xen/platform_op: Wrap around XENPF_firmware_info
Date: Fri, 25 Jul 2025 14:15:23 +0800
Message-ID: <20250725061530.309953-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: f0823c17-f599-4534-935d-08ddcb42b989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHpVOTZESE1ra0Q4U3lGaGdCVjlTd05jcnJYc1ZPSXk2VWRDT3haOGhWRE95?=
 =?utf-8?B?VWk4WTV1U2g0UERCT1NnVkJZRk8xSzRRbWFvYmt4SWt0Z2ZVeU5zWFJDQndu?=
 =?utf-8?B?bks3ZVRqdWYySm5qcll2b3FMdTJLZTlSSTBQSjZyN3E5SmNaUTdFb09HTE53?=
 =?utf-8?B?UXZJaWYxZks5K2ZGS0E5ZFJFY3FRV2pwbUwzU3pXWUloVFNVeWFZdDFRUnJ5?=
 =?utf-8?B?Vy9KbTdLWGsvOFIyeWd5bi9YeEROL0RWWUpWRWFVNDAxSlpaV0llTnlhOEM5?=
 =?utf-8?B?OWJYZ0hyNzNvcS9YcU5RTjlVYnpwQlRzNHllUTkxMFJMNlg3NXdqekVKaFBJ?=
 =?utf-8?B?U1JVTVgxTzFtL3BnMkw1c0hEcjd1T2U2Z09EcDZQUzczUEpSbGREU0pLOFNL?=
 =?utf-8?B?KzRWaUF2TjdOWEtpcnJMT1l6aEJmQ1pjSi9MMk9LazZFV2hQblNsV2p5Skhs?=
 =?utf-8?B?TGZscVkxbDBpZFhqK2ttMEhCKzdMQkdXcEErY0VySW1QSXEwUG1HUS8xU1ZK?=
 =?utf-8?B?UHd6eVlhUVFKVnVCWVBLVVplT1Z0SUdqM0VDWmJmYnkxZEMvVmQ4bmd0N1pn?=
 =?utf-8?B?VHVwcFhYQi83SDJGemR4ZzZrR1ZnU3pvVW1kN0pLSkdsNjhqeS9HamxRY1lT?=
 =?utf-8?B?dng4d1JFS1l1RE5zMEhNY1Uvd2FjcEVBUnpKQUg3eVdsYzI2S2tjeE1aOEd2?=
 =?utf-8?B?VVVnSkxKNlF3TEpMK1JWbkNjNlIyU2o3RjJmczlxS0pUWU5BQzByRU5ZaFFi?=
 =?utf-8?B?VDd2NlpVL2xpK212TjlSZVlpTURpUVhGVVNxbzl2QUN0SGtZLzlpUEpFWFo4?=
 =?utf-8?B?aTRYQ1R6MWl6OUFLeDZkL2NHb1ZhdG5LbzB2K1MzUzdpTlpIWHMvSitIclJx?=
 =?utf-8?B?RWRLVmRaNnVJWUFnNUF2UVFXbUdMUmtHSXRkcE9xWVZNeUQxZEM3ZzZRVTVt?=
 =?utf-8?B?SWoxaW4wTGsrN1lWQ2lLNUJQSGZSdHRzenF0dTJVdWVKeUtIakdpQmwvc0w4?=
 =?utf-8?B?aUNUNTZyWVhxZHhQSCtuK2djUUZSL0VOd0RiQ1RFWGRjN2pYUTI0N1VHc0s5?=
 =?utf-8?B?Vi93YTA3SlJiYnB6ZWNTbW16QlRXdVU1VGVuMS83ZFFQT1AxS3l5clBVOHU0?=
 =?utf-8?B?OXZ0RnFDOHIvRXMvY0hxR3AwMDVVYjZoTXVUb2RMQWxOSHhmdU1jbVgrU3Nw?=
 =?utf-8?B?OUxYY3FXTXBub0Q5U01SYldCaTNPWmNoSkhJNmEzOXJDQVdQSmYrZi9qT2xP?=
 =?utf-8?B?YzR6UjJmbFRhSWtnZVR6eGZHZm9RMHJKMk1FUHlES2NYdDZEQ09ablY2K2dK?=
 =?utf-8?B?dEpTeEhpbDg3NHd6bTAxSDZlUXZLbGdLbnphSzlIR29WaStTV1NVazBjWU9E?=
 =?utf-8?B?SXN2c1o0WjVQQThheGUvZHVYNnJxR0xkZHdlZGVQQlEvbTlmVGxxbzhOaHBi?=
 =?utf-8?B?Q1B5VGExcndlQWJaYXFIckljcTBLMk1oSFdPNnJONEVjcTB5bXdOY090dWpE?=
 =?utf-8?B?ekV5SGs4R2l0OUtFRjBTYkVxNysyTjBVR0c2MWUwaWNuRHdjZjF5LzhLZjlO?=
 =?utf-8?B?RE0xMzJLNUkzRGZBT2RrY3I1WEpha2N3emJCdllRQnN5RlRHQ3lncWJQWUo2?=
 =?utf-8?B?Kyt4dEozNkZyZEVZaGtrY2g1V0NxNUJockZSU0svWFdJTjBCb2ZYSEt3NlBU?=
 =?utf-8?B?MmJrSThCQ1B4L1g1dHdlSmUrK1Q1WWZMbVRRYUVwQ2hON2VuRjdzSGtQSytu?=
 =?utf-8?B?QmR4UExicUhiY09vVFNvZW4vL25YZnRHa21UZ0NPSzI3T1RWTmJJNFRXMlRQ?=
 =?utf-8?B?UVdUMXdJdUhMUzUwdjhFQ21NOUNhN2o4dmVOcDh0aDdiVlEvNDJ0REFiT3Ew?=
 =?utf-8?B?QmtrQmIzRzd6MFk2akpRdzIrUzVwNmJQWDJLcXdLa0I5aEpabEJzWmVtU3VY?=
 =?utf-8?B?d0tBbFVPSjBVRHdwM1lneERSOVprZVlScVcrelhQUWREbExpem1ZS040RVF6?=
 =?utf-8?B?Lzg4Tmh1WGJrVDJpZ0NTbDMzcmlIQnIrR0YraHY5cHpRZ3dWNWIvM2FwT05n?=
 =?utf-8?Q?lVcz3l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:15:59.6209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0823c17-f599-4534-935d-08ddcb42b989
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

efi_get_info() is only used for XEN_FW_EFI_INFO of XENPF_firmware_info,
so wrap it.
And wrap its compat function efi_compat_get_info().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
cc: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/common-stub.c | 4 ++++
 xen/common/efi/compat.c      | 2 ++
 xen/common/efi/runtime.c     | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
index 77f138a6c574..05a84c60fb70 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -21,10 +21,12 @@ unsigned long efi_get_time(void)
 void efi_halt_system(void) { }
 void efi_reset_system(bool warm) { }
 
+#ifdef CONFIG_PLATFORM_OP
 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
     return -ENOSYS;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 {
@@ -33,8 +35,10 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
 #ifdef CONFIG_COMPAT
 
+#ifdef CONFIG_PLATFORM_OP
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
     __attribute__((__alias__("efi_get_info")));
+#endif /* CONFIG_PLATFORM_OP */
 
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
     __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/compat.c b/xen/common/efi/compat.c
index 7cc6279b8f36..4f5f59fcac2e 100644
--- a/xen/common/efi/compat.c
+++ b/xen/common/efi/compat.c
@@ -1,8 +1,10 @@
 #include <xen/guest_access.h>
 #include <compat/platform.h>
 
+#ifdef CONFIG_PLATFORM_OP
 #define efi_get_info efi_compat_get_info
 #define xenpf_efi_info compat_pf_efi_info
+#endif
 
 #define efi_runtime_call efi_compat_runtime_call
 #define xenpf_efi_runtime_call compat_pf_efi_runtime_call
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 7e1fce291d92..ab63785397e2 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -227,6 +227,8 @@ const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n)
 #endif /* COMPAT */
 
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
+
+#ifdef CONFIG_PLATFORM_OP
 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
     unsigned int i, n;
@@ -325,6 +327,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 
     return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static long gwstrlen(XEN_GUEST_HANDLE_PARAM(CHAR16) str)
 {
-- 
2.34.1


