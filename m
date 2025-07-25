Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A78B11854
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057166.1425103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiu-0008Ts-Kr; Fri, 25 Jul 2025 06:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057166.1425103; Fri, 25 Jul 2025 06:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiu-0008S0-Hk; Fri, 25 Jul 2025 06:16:04 +0000
Received: by outflank-mailman (input) for mailman id 1057166;
 Fri, 25 Jul 2025 06:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBit-0007jJ-BF
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2409::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5acca94-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:01 +0200 (CEST)
Received: from BY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:180::36)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 06:15:57 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:180:cafe::d6) by BY5PR13CA0023.outlook.office365.com
 (2603:10b6:a03:180::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 06:15:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:15:57 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:55 -0500
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
X-Inumbo-ID: d5acca94-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaA9i/Bn3dKoBb+m6aZdR1hl8zwKQHc7R8UZq0+VW4KPSU+JFHTebAkeWxdM6tsjLfXCR9uWaS9rVPQr8uLC+oLlan+isSTJc3LnHHQZogSCIsF3EpFGGH1xBzs31XbRj0WJd67+iZHjiEnKLppYoDpeLLSTQpFWw7nWoU8Y8n9lZ92glcqEIFrZRjnckH0uiWEgi0AKafYjQesjXHQjg3QWylJ6IALl4A/sZ5tfAPxRABwFkoiLzDqNQ1cDRSNorcaf+AyLTi6C3JK+bpeg9elx4jNidQkNS2nJiUjQO+c6iyFkUdO6hJx1M25UzHytzcsQOQ+ByvMh8xP6B9q5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RpOgsPA26B5Jaym4nHduKhV3x1BUCK6xdLduwp69R0=;
 b=j25/OyDi4epkf1J0ZxHNvYTKsHpNqW6PdXpxOYaU9Hq05W5DZ3cTEX6gi8bqYJ89QGszNMlqcRrOJIQ+SvKX57mhilG5ZpI4dGGbsDa+dAhC1EkRPGtjAzg06PLr5FJ+Onc7wSBq4cPWx1R5zUPZGncqdWDpfwEr9sPbe/dwSBEr4hAcx79heb49CPhHX7gTZRh5DnqslStEpAWJ/21mJiRIjSmW0DD5CUaz22sZ+7vk+5MD5m2N3S1Vr744dh8RzybWEMOVow8f1BwKAAB7lki+DjiEJZMIziZ4qwnhF8mnWVF0KbtefEsN+cuVmmndEqGxHvSxPKIH9kkxKq0Www==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RpOgsPA26B5Jaym4nHduKhV3x1BUCK6xdLduwp69R0=;
 b=02Wm+HJNXSEaBttUv5zo4S59Y0qYvCPPlBgaca4llErgnlj9YGluG5pafwQmOAIakGuZsfdG17wsY5sJtFnIbgQKZJWHcNkORXtv/N4cVeYFzczEHZsz6+L/WHtOCRgX42MZEkOq73yK21XBuHir3sG7uXDw/PpKPKqjcU667iQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/11] xen/platform_op: Wrap around XENPF_microcode_update(2)
Date: Fri, 25 Jul 2025 14:15:22 +0800
Message-ID: <20250725061530.309953-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fb00df-3639-42e4-fbb3-08ddcb42b856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vk1TbHBpRlYxaDVCY1ErVEhWSTFaeisyYlV6Zk1VQWswUjJTR3o3MjJ1Yjk0?=
 =?utf-8?B?aS80bWZUenpVQUxVMG9UZ1dhWVRvWHVxRTZVdEVBVnpsdXVsa00zTDBuYXlC?=
 =?utf-8?B?a3YwVzR5UUw4cUs1SlZLanVQWER3U2NhaUJNYS9SVnR3RllyOHZIMm5saEFi?=
 =?utf-8?B?cXphaG95Zlc5TFJNSEU1dXFMcEpBdlY2TldQaU1tYUJWdnZHSGNpV2c0aDFx?=
 =?utf-8?B?WUVLbG5Jei91TVkrNEcrTDNQYkc4VWY0b29ueVFhUXV3cU50dnNDZ0dIUWlL?=
 =?utf-8?B?ZFlTaGR1NCtuWDFEMGJ3T2dMSk1hdUdCdFJaa2RoSElveWhiR09POUQ4MGZx?=
 =?utf-8?B?TXcrdlNXUlFJRzZiTGtpcDFmVGUxUk8vdU51aGR5MDRObjRoWWtWUnlTSlBR?=
 =?utf-8?B?UFJyS282VDNBaHJ4ejIrKzJxNVpyR3Z6QndxQ0dybEtQTWVJdDFBOVVVKzlu?=
 =?utf-8?B?TWJ1amRSRjdPbUhJYmdyU3BoOGMxMjNUMWFoMnhvbzJvT09ETTBLOUZYNHdI?=
 =?utf-8?B?TVNlMkJyRnU1Z3o0S2tTYlM0eHJTY2d1ZzVqV0lqdTZsREFDTTNIMTc0R3Rk?=
 =?utf-8?B?cFFhKzkvYmU4VGtYNUtwL0dDM3B1Q2loMC9uRlpyZTRiU1pNaTdURElHNG44?=
 =?utf-8?B?V25ZbnRRWkZUbndKRU52SDhhOEhmalVrNjN6ZU1XLytIV1hVWDRvcnJBdzZp?=
 =?utf-8?B?M3RmUkNhcEZDeFdQSWZZYjl2aUJoZ3RCVmkzSUZMUlNDSDZFZXZDQWZhMGtZ?=
 =?utf-8?B?RCtEZFd3RVRpbXlvelQ2V0ZaMTZwTW1CVkUrbGxJSUFMTFFnNG9YbEEwZUpY?=
 =?utf-8?B?TFFiU05aYVU2ZWlteDYzVjlXbGRyN3MxSXZ2ZkNzeTVPaVJPSks2clBWUXky?=
 =?utf-8?B?OUt1NExMcDJlK1hpUFRnenhqWkppZHlpVFZKaVZwQVZWRTdrcTQ1b1hSWDVv?=
 =?utf-8?B?NTE2RDI3MzJ1cWhYYUUrRzZ6a3hUWkhscGlOaHZJM0F1ekZra1BqbkdrQlBr?=
 =?utf-8?B?NzZ0cGlQNDlJV1JYVmxndVNSNHR2NnJ1NzIrV3BCZEgzaUZRNUl5SlFzd3hN?=
 =?utf-8?B?REJTeFNNY2J5Q1NITjhoMEFvcDhDd3picGFyVEZ5VkJCUEYxZU5aRDVtT0RJ?=
 =?utf-8?B?L0JvVGNOWWRuTlpaemtLTGxaZmxhTzFBL0dPbjdHOVEvVWJpRWdSR2ZjNDdL?=
 =?utf-8?B?S3NOZCtXbVZSWVY4ZHV0RlFIWGNlcnlURlpmcjBVVzkzRG5jMEhUQTBqbDVm?=
 =?utf-8?B?OVVNZzZlS2xRYnowdldvaExZRCtuK1BPOVhlWUZLOEpRak1SWjBMMXVzL3R0?=
 =?utf-8?B?WElQdGMyd1lMaFB4Nmo5OG9oWGlWdWVJZ1VOTFlxUFBhODVVa1ZWTFhheEU0?=
 =?utf-8?B?bzRDN2xIRXRPS0c4NVdaQmI5VDMxWmJCQmYzdnVqSS9EM3NpMTN4VUhQcGdx?=
 =?utf-8?B?NlkySkJDZ0MrOFBSK0YvMmRYZnVIMm1LWjM2QmJDY1VTYXMyUHBxUVJaRmhS?=
 =?utf-8?B?OFVqRk00MjRaeCsrdTIxd0ZRMjlUVlI2OXF6STFJOGNxS084a0UyR1pjVDYr?=
 =?utf-8?B?dTNqeTUyNG96TDIzYlBqNy9OU0FXWDJlMnJKV2FuVElPNlVMcUNiUGluNk0r?=
 =?utf-8?B?NkdEeDJlcnh1dTRtMUtxQkxBSmdzNkRsNGZiaitCRlYzRTNDRjY2eHVJY2Rx?=
 =?utf-8?B?Qy83YmhjQzdZdlc3VUtoVFdxMFkvT0V2ME1GVzYrMEowUVMwTzdnSmhscFdl?=
 =?utf-8?B?cFkrSjhoaytiUFYxQm1CR0JuVktka1pFK2xKUkZQRXhKT1JMcXlqbVlBd1dF?=
 =?utf-8?B?SkxRRDFFNk50OEoxMFBrNFZEaUJyZEJ1QTUzVWQ5dUIrY2UrSTlpT3pUbWRR?=
 =?utf-8?B?a0VvUllJZmVrRGR0UmVKV0dZdUNISTlkR1NXYUdKZkxra0dyQ1E2dHczYVpl?=
 =?utf-8?B?aGJselFTM0JXQ3BOanErT3ZGNEp0b2ZWZzZYcHJDZ09aUE9HZ2JFRmxreTA2?=
 =?utf-8?B?N1JmNHVjZkNaYkdOY2ZhTlJ3MU43ck9JelBrSXhWU09oM2lqUEJORCtQWHVS?=
 =?utf-8?Q?H/YA1t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:15:57.6122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fb00df-3639-42e4-fbb3-08ddcb42b856
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

ucode_update_hcall() is only used for XENPF_microcode_update and
XENPF_microcode_update2, so wrap it and its call stack functions:
ucode_update_hcall
	ucode_update_hcall_cont
		do_microcode_update
			control_thread_fn
				microcode_nmi_callback
					is_cpu_primary
					primary_thread_work
					secondary_nmi_work
						wait_for_state
				set_state
				wait_for_condition
				wait_cpu_callin
				wait_cpu_callout
			primary_thread_fn
			secondary_thread_fn

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 816e9bfe40ba..ec306cea895e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -59,6 +59,7 @@
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
 static bool __initdata ucode_mod_forced;
+#ifdef CONFIG_PLATFORM_OP
 static unsigned int nr_cores;
 
 /*
@@ -76,6 +77,7 @@ static enum {
     LOADING_ENTER,
     LOADING_EXIT,
 } loading_state;
+#endif /* CONFIG_PLATFORM_OP */
 
 struct patch_with_flags {
     unsigned int flags;
@@ -167,6 +169,7 @@ static struct microcode_ops __ro_after_init ucode_ops;
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
+#ifdef CONFIG_PLATFORM_OP
 /* Store error code of the work done in NMI handler */
 static DEFINE_PER_CPU(int, loading_err);
 
@@ -183,6 +186,7 @@ static struct patch_with_flags nmi_patch =
 {
     .patch  = ZERO_BLOCK_PTR,
 };
+#endif /* CONFIG_PLATFORM_OP */
 
 /*
  * Return a patch that covers current CPU. If there are multiple patches,
@@ -195,6 +199,7 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
     return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 /* Returns true if ucode should be loaded on a given cpu */
 static bool is_cpu_primary(unsigned int cpu)
 {
@@ -646,6 +651,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
      */
     return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
-- 
2.34.1


